package com.itech.schedule

import org.springframework.dao.DataIntegrityViolationException

import com.itech.patient.Patient
import com.itech.queue.QueueElement

import enums.AppointmentType;

class NewAppointmentController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		//        params.max = Math.min(max ?: 10, 100)
		params.max = Math.max(max ?: NewAppointment.count(), 1) //use for datatables
		[newAppointmentInstanceList: NewAppointment.list(params), newAppointmentInstanceTotal: NewAppointment.count()]
	}

	def create() {
		[newAppointmentInstance: new NewAppointment(params)]
	}

	def save() {
		def newAppointmentInstance = new NewAppointment(params)
		if (!newAppointmentInstance.save(flush: true)) {
			render(view: "create", model: [newAppointmentInstance: newAppointmentInstance])
			return
		}
		
		//nagbutang ko sang smsobject d. -jonah
		flash.message = message(code: 'default.created.message', args: [
			message(code: 'newAppointment.label', default: 'NewAppointment'),
			newAppointmentInstance.id
		])
		redirect(action: "show", id: newAppointmentInstance.id)
	}

	def show(Long id) {
		def newAppointmentInstance = NewAppointment.get(id)
		if (!newAppointmentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'newAppointment.label', default: 'NewAppointment'),
				id
			])
			redirect(action: "list")
			return
		}

		[newAppointmentInstance: newAppointmentInstance]
	}

	def edit(Long id) {
		def newAppointmentInstance = NewAppointment.get(id)
		if (!newAppointmentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'newAppointment.label', default: 'NewAppointment'),
				id
			])
			redirect(action: "list")
			return
		}

		[newAppointmentInstance: newAppointmentInstance]
	}

	def update(Long id, Long version) {
		def newAppointmentInstance = NewAppointment.get(id)
		if (!newAppointmentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'newAppointment.label', default: 'NewAppointment'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (newAppointmentInstance.version > version) {
				newAppointmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'newAppointment.label', default: 'NewAppointment')] as Object[],
						"Another user has updated this NewAppointment while you were editing")
				render(view: "edit", model: [newAppointmentInstance: newAppointmentInstance])
				return
			}
		}

		newAppointmentInstance.properties = params

		if (!newAppointmentInstance.save(flush: true)) {
			render(view: "edit", model: [newAppointmentInstance: newAppointmentInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'newAppointment.label', default: 'NewAppointment'),
			newAppointmentInstance.id
		])
		redirect(action: "show", id: newAppointmentInstance.id)
	}

	def delete(Long id) {
		def newAppointmentInstance = NewAppointment.get(id)
		if (!newAppointmentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'newAppointment.label', default: 'NewAppointment'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			newAppointmentInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'newAppointment.label', default: 'NewAppointment'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'newAppointment.label', default: 'NewAppointment'),
				id
			])
			redirect(action: "show", id: id)
		}
	}

	def affirm(Long id){
		def newAppointmentInstance = NewAppointment.get(id)
		if (!newAppointmentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'newAppointment.label', default: 'NewAppointment'),
				id
			])
			redirect(action: "list")
			return
		}
		newAppointmentInstance.isAffirmed = true
		def f = newAppointmentInstance.isAffirmed
		flash.message = "$newAppointmentInstance.lastName's appointment has been affirmed! $f"
		redirect(action: "show", id:newAppointmentInstance.id)
	}

	def cancel(Long id){
		def newAppointmentInstance = NewAppointment.get(id)
		if (!newAppointmentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'newAppointment.label', default: 'NewAppointment'),
				id
			])
			redirect(action: "list")
			return
		}
		newAppointmentInstance.isAffirmed = false
		def f = newAppointmentInstance.isAffirmed
		flash.message = "$newAppointmentInstance.lastName's appointment has been cancelled! $f"
		redirect(action: "show", id:newAppointmentInstance.id)
	}

	def listAffirmed(Integer max) {
		//        params.max = Math.min(max ?: 10, 100)
		params.max = Math.max(max ?: NewAppointment.count(), 1) //use for datatables
		[newAppointmentInstanceList: NewAppointment.list(params), newAppointmentInstanceTotal: NewAppointment.count()]
	}

	def addToQueue(Long id){
		def newAppointmentInstance = NewAppointment.get(id)
		if (!newAppointmentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'newAppointment.label', default: 'NewAppointment'),
				id
			])
			redirect(action: "list")
			return
		}
		if(!newAppointmentInstance.isAffirmed){
			flash.message = "Unable to add. Affirmed it first!"
			newAppointmentInstance.isAffirmed = false
			redirect(action: "show", id: newAppointmentInstance.id)
			return
		}
		def fname = newAppointmentInstance.firstName
		def lname = newAppointmentInstance.lastName
		def mname = newAppointmentInstance.middleName
		def num = newAppointmentInstance.mobileNum
		def time = newAppointmentInstance.appointmentDate.getTimeString()
		def description = newAppointmentInstance.description
		def doctor = newAppointmentInstance.doctor
		def mobileNum = newAppointmentInstance.mobileNum
		def patient = Patient.findWhere(firstName: fname, lastName: lname, middleName: mname)
		println "$patient"
		if(!patient){
			flash.message = "Patient not found! Create new record."
			session.isQueue = true
			session.time = time
			session.complaints = description
			session.doctor = doctor
			session.appointmentId = id
			redirect(controller: 'patient', action: "create", params:[firstName: fname, lastName: lname, middleName: mname, mobileNumber: mobileNum])
			return
		}

		def queueInstanceList = QueueElement.withCriteria {
			def now = new Date().clearTime()
			between('date', now-1, now+1)
			eq('patient', patient)
			eq('isDone', false)
		}
		if(queueInstanceList){
			flash.exist = "Unable to queue. $lname's appointment is already on queue."
			println "already exist"
			redirect(contoller: "newAppointment", action: "show", id: newAppointmentInstance.id)
			return
		}
		def queueInstance = new QueueElement(date: new Date(), patient: patient, appointmentType: AppointmentType.NEW_APPOINTMENT, timeAdmitted:time, complaints: description, doctor: doctor, hasTransaction: false, isDone: false)
		if(!queueInstance.save(flash: true)){
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'queueElement.label', default: 'QueueElement'),
				id
			])
			redirect(action: "show", id:newAppointmentInstance.id)
			return
		}
		newAppointmentInstance.delete(flush:true)
		def cutNum = num.substring(3, num.length())
		if(!patient.mobileNumber.contains(cutNum)){
			flash.message2 = "Warning: appointment mobile number ($num) dont match to the current patient mobile"
			flash.patientId = patient.id
			flash.mobileNum = num
		}
		flash.message = "$lname has been added to queue"
		redirect(action: "listAffirmed")
	}
}
