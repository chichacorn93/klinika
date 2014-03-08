package com.itech.patient

import org.springframework.dao.DataIntegrityViolationException

import com.itech.patient.PatientLog
import com.itech.queue.QueueElement
import com.itech.schedule.NewAppointment;
import com.itech.membership.*

import enums.AppointmentType;
class PatientController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	// Export service provided by Export plugin
	def exportService
	def grailsApplication  //inject GrailsApplication
	def springSecurityService

	def index() {
		redirect(action: "list", params: params)
	}

	def list(){

		def user_id = springSecurityService.principal.id
		def user = User.get(user_id)

		if(user.getClass() == Doctor){
			redirect (controller: 'doctor', action: 'patients', id:user_id)
			return
		}
		if(user.getClass() == Receptionist){
			def receptionist = Receptionist.get(user_id)
			def doctors = receptionist.doctors
			

			redirect (controller: 'doctor', action: 'doctors', params: [doctors: doctors])
			return
		}



	}

	//		def list(Integer max) {
	//			params.max = Math.max(max ?: Patient.count(), 1) //use for datatables
	//			[patientInstanceList: Patient.list(params), patientInstanceTotal: Patient.count()]
	//		}

	def create() {
		[patientInstance: new Patient(params)]

	}

	def save() {
		def patientInstance = new Patient(params)
		def fname = params.firstName
		def lname = params.lastName
		def mname = params.middleName
		def result = Patient.withCriteria {
			eq('firstName', fname)
			eq('lastName', lname)
			eq('middleName', mname)
		}
		if(result){
			render(view: "create", model: [patientInstance: patientInstance])
			flash.message = "Patient record with name \"$fname $mname $lname\" is already exist!"
			return
		}

		if (!patientInstance.save(flush: true)) {
			render(view: "create", model: [patientInstance: patientInstance])
			return
		}
		if(session.isQueue){
			def queueElementInstance = new QueueElement(date: new Date(), appointmentType: AppointmentType.NEW_APPOINTMENT,
			patient: patientInstance, timeAdmitted: session.time, complaints: session.complaints, doctor: session.doctor)
			queueElementInstance.save(flash:true)
			def a = NewAppointment.get(session.appointmentId)
			a.delete(flush:true)
			session.isQueue = false
			if(!queueElementInstance.save(flash:true)){
				queueElementInstance.errors.each{
					flash.message = "$it"
					redirect(action: "list")
					return
				}
			}
			flash.message = "$lname has been added to queue"
			redirect(controller: "newAppointment", action: "listAffirmed")
			return

		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'patient.label', default: 'Patient'),
			patientInstance.id
		])
		redirect(action: "show", id: patientInstance.id)
	}

	def show(Long id) {
		def patientInstance = Patient.get(id)
		//		def age = patientInstance.getAge()
		[patientInstance: patientInstance]
	}

	def edit(Long id) {
		def patientInstance = Patient.get(id)
		if (!patientInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'patient.label', default: 'Patient'),
				id
			])
			redirect(action: "list")
			return
		}

		[patientInstance: patientInstance]
	}

	def update(Long id, Long version) {
		def patientInstance = Patient.get(id)
		if (!patientInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'patient.label', default: 'Patient'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (patientInstance.version > version) {
				patientInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'patient.label', default: 'Patient')] as Object[],
						"Another user has updated this Patient while you were editing")
				render(view: "edit", model: [patientInstance: patientInstance])
				return
			}
		}

		patientInstance.properties = params

		if (!patientInstance.save(flush: true)) {
			render(view: "edit", model: [patientInstance: patientInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'patient.label', default: 'Patient'),
			patientInstance.id
		])
		redirect(action: "show", id: patientInstance.id)
	}

	def delete(Long id) {
		def patientInstance = Patient.get(id)
		if (!patientInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'patient.label', default: 'Patient'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			patientInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'patient.label', default: 'Patient'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'patient.label', default: 'Patient'),
				id
			])
			redirect(action: "show", id: id)
		}
	}

	def activate(Long id){
		def patientInstance = Patient.get(id)
		if (!patientInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'patient.label', default: 'Patient'),
				id
			])
			redirect(action: "list")
			return
		}
		patientInstance.isActive= true
		redirect(action: "show", id: id)
		flash.message = "$patientInstance.lastName\'s profile is activated succesfully!"

	}

	def deactivate(Long id){
		def patientInstance = Patient.get(id)
		if (!patientInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'patient.label', default: 'Patient'),
				id
			])
			redirect(action: "list")
			return
		}
		patientInstance.isActive = false
		redirect(action: "listDeactivated")
		flash.message = "Patient deactivated succesfully!"
	}

	def remove(Long id){
		def patientInstance = Patient.get(id)
		if (!patientInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'patient.label', default: 'Patient'),
				id
			])
			redirect(action: "list")
			return
		}
		patientInstance.isDeleted = true
		redirect(action: "listRemoved")
		flash.message = "Patient has been removed succesfully!"
	}

	def restore(Long id){
		def patientInstance = Patient.get(id)
		if (!patientInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'patient.label', default: 'Patient'),
				id
			])
			redirect(action: "list")
			return
		}
		patientInstance.isDeleted = false
		redirect(action: "show", id: id)
		flash.message = "Patient has been restored succesfully!"
	}

	def listDeactivated(Integer max){
		params.max = Math.min(max ?: 10, 100)
		[patientInstanceList: Patient.list(params), patientInstanceTotal: Patient.count()]
	}

	def listRemoved(Integer max){
		params.max = Math.min(max ?: 10, 100)
		[patientInstanceList: Patient.list(params), patientInstanceTotal: Patient.count()]
	}

	def updateMobile(Long id, String mobileNum){
		def patientInstance = Patient.get(id)
		def oldNum = patientInstance.mobileNumber
		patientInstance.mobileNumber = params.mobileNum
		patientInstance.save(flash:true)
		flash.message = "$patientInstance.lastName's mobile # has been changed from $oldNum to $mobileNum"
		redirect(controller: "newAppointment", action: "listAffirmed")
	}
}
