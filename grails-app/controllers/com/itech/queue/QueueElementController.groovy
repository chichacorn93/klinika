package com.itech.queue

import org.springframework.dao.DataIntegrityViolationException

import com.itech.schedule.FollowUpAppointment
import com.itech.membership.*

import enums.AppointmentType;

class QueueElementController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def springSecurityService

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		//		def principal = springSecurityService.principal
		def id = springSecurityService.principal.id
		def user = User.get(id)
		def queueElementInstanceList = QueueElement.list(params)

		params.max = Math.min(max ?: 10, 100)
		def followUpInstanceList = QueueElement.todayFollowUps()

		if(followUpInstanceList){
			followUpInstanceList.each {
				if(!it.isQueued){
					def time = it.appointmentDate.getTimeString()
					def queueElementInstance = new QueueElement(date: new Date(), appointmentType: AppointmentType.FOLLOW_UP, patient: it.patient, timeAdmitted: time,
					complaints: it.description, doctor:it.doctor)
					it.isQueued = true
					//					queueElementInstance.save(flush:true)
					if(!queueElementInstance.save(flush:true)){
						queueElementInstance.errors.allErrors.each {flash.message = "$it"}
						redirect(action: "list")
						return
					}
				}
			}
		}
		if(user.getClass() == Receptionist){
			def receptionist = Receptionist.get(id)
			if(receptionist){
				def doctors = receptionist.doctors
				def queues = [] as 	Set
				if(doctors){
					doctors.each {
						def result = QueueElement.findAllWhere(doctor: it)
						if(result){
							queues.addAll(result)
						}
					}
				}
				queueElementInstanceList = queues
			}

		}
		if(user.getClass() == Doctor){
			def doctor = Doctor.get(id)

			if(doctor){
				def queues = QueueElement.findAllWhere(doctor: doctor)
				if(queues){
					queueElementInstanceList = queues
				}
				else{queueElementInstanceList = null}

			}
		}

		[queueElementInstanceList: queueElementInstanceList, queueElementInstanceTotal: QueueElement.count()]
	}

	def create() {
		[queueElementInstance: new QueueElement(params)]
	}

	def save() {
		def queueElementInstance = new QueueElement(params)
		if (!queueElementInstance.save(flush: true)) {
			render(view: "create", model: [queueElementInstance: queueElementInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'queueElement.label', default: 'QueueElement'),
			queueElementInstance.id
		])
		redirect(action: "show", id: queueElementInstance.id)
	}

	def show(Long id) {
		def queueElementInstance = QueueElement.get(id)
		if (!queueElementInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'queueElement.label', default: 'QueueElement'),
				id
			])
			redirect(action: "list")
			return
		}

		[queueElementInstance: queueElementInstance]
	}

	def edit(Long id) {
		def queueElementInstance = QueueElement.get(id)
		if (!queueElementInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'queueElement.label', default: 'QueueElement'),
				id
			])
			redirect(action: "list")
			return
		}

		[queueElementInstance: queueElementInstance]
	}

	def update(Long id, Long version) {
		def queueElementInstance = QueueElement.get(id)
		if (!queueElementInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'queueElement.label', default: 'QueueElement'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (queueElementInstance.version > version) {
				queueElementInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'queueElement.label', default: 'QueueElement')] as Object[],
						"Another user has updated this QueueElement while you were editing")
				render(view: "edit", model: [queueElementInstance: queueElementInstance])
				return
			}
		}

		queueElementInstance.properties = params

		if (!queueElementInstance.save(flush: true)) {
			render(view: "edit", model: [queueElementInstance: queueElementInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'queueElement.label', default: 'QueueElement'),
			queueElementInstance.id
		])
		redirect(action: "show", id: queueElementInstance.id)
	}

	def delete(Long id) {
		def queueElementInstance = QueueElement.get(id)
		if (!queueElementInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'queueElement.label', default: 'QueueElement'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			queueElementInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'queueElement.label', default: 'QueueElement'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'queueElement.label', default: 'QueueElement'),
				id
			])
			redirect(action: "show", id: id)
		}
	}

	def clear(){
		def q = QueueElement.withCriteria {
			def now = new Date().clearTime()
			between('date', now-1, now+1)
			eq('isDone', false)
		}
		if(q){
			q.each { it.isDone = true }
		}

		redirect(action: "list")
		return
	}

	def remove(Long id){
		def queueElementInstance = QueueElement.get(id)
		if (!queueElementInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'queueElement.label', default: 'QueueElement'),
				id
			])
			redirect(action: "list")
			return
		}
		queueElementInstance.isDone = true
		if (!queueElementInstance.save(flush: true)) {
			redirect(action: "show", id: queueElementInstance.id)
			return
		}
		flash.message = "$queueElementInstance.patient has been removed."
		redirect(action: "list")
	}
}
