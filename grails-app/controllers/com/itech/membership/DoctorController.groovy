package com.itech.membership

import org.springframework.dao.DataIntegrityViolationException

class DoctorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        //params.max = Math.min(max ?: 10, 100)
		params.max = Math.max(max ?: Doctor.count(), 1) //use for datatables
        [doctorInstanceList: Doctor.list(params), doctorInstanceTotal: Doctor.count()]
    }
	
	def doctors(){
//		params.max = Math.max(max ?: doctors.count(), 1) //use for datatables
		def doctors = params.doctors
		[doctorInstanceList: doctors, doctorInstanceTotal: doctors.count()]

	}

    def create() {
        [doctorInstance: new Doctor(params)]
    }
	
	def beforeInterceptor = {
		println "Executing action $actionName with params $params"
	}

    def save() {
        def doctorInstance = new Doctor(params)
        if (!doctorInstance.save(flush: true)) {
            render(view: "create", model: [doctorInstance: doctorInstance])
            return
        }

        flash.message = message(code: "default.created.message", args: [message(code: 'doctor.label', default: 'Doctor'), doctorInstance.id])
        redirect(action: "show", id: doctorInstance.id)
    }

    def show(Long id) {
        def doctorInstance = Doctor.get(id)
        if (!doctorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'doctor.label', default: 'Doctor'), id])
            redirect(action: "list")
            return
        }

        [doctorInstance: doctorInstance]
    }
	
	def patients(Long id){
		def doctorInstance = Doctor.get(id)
		if (!doctorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'doctor.label', default: 'Doctor'), id])
			redirect(action: "list")
			return
		}

		[doctorInstance: doctorInstance]
	}

    def edit(Long id) {
        def doctorInstance = Doctor.get(id)
        if (!doctorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'doctor.label', default: 'Doctor'), id])
            redirect(action: "list")
            return
        }

        [doctorInstance: doctorInstance]
    }

    def update(Long id, Long version) {
        def doctorInstance = Doctor.get(id)
        if (!doctorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'doctor.label', default: 'Doctor'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (doctorInstance.version > version) {
                doctorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'doctor.label', default: 'Doctor')] as Object[],
                          "Another user has updated this Doctor while you were editing")
                render(view: "edit", model: [doctorInstance: doctorInstance])
                return
            }
        }

        doctorInstance.properties = params

        if (!doctorInstance.save(flush: true)) {
            render(view: "edit", model: [doctorInstance: doctorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'doctor.label', default: 'Doctor'), doctorInstance.id])
        redirect(action: "show", id: doctorInstance.id)
    }

    def delete(Long id) {
        def doctorInstance = Doctor.get(id)
        if (!doctorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'doctor.label', default: 'Doctor'), id])
            redirect(action: "list")
            return
        }

        try {
            doctorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'doctor.label', default: 'Doctor'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'doctor.label', default: 'Doctor'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def activate(Long id){
		def doctorInstance = Doctor.get(id)
		if (!doctorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'Doctor.label', default: 'Doctor'), id])
			redirect(action: "list")
			return
		}
		doctorInstance.isActive = true
		redirect(action: "show", id: id)
		flash.message = "$doctorInstance.lastName\'s profile is activated succesfully!"
		
	}
	
	def deactivate(Long id){
		def doctorInstance = Doctor.get(id)
		if (!doctorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'Doctor.label', default: 'Doctor'), id])
			redirect(action: "list")
			return
		}
		doctorInstance.isActive = false
		doctorInstance.accountLocked = true
		redirect(action: "listDeactivated")
		flash.message = "Doctor deactivated succesfully!"
	}
	
	def remove(Long id){
		def doctorInstance = Doctor.get(id)
		if (!doctorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'Doctor.label', default: 'Doctor'), id])
			redirect(action: "list")
			return
		}
		doctorInstance.isDeleted = true
		redirect(action: "listRemoved")
		flash.message = "Doctor has been removed succesfully!"
	}
	
	def restore(Long id){
		def doctorInstance = Doctor.get(id)
		if (!doctorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'Doctor.label', default: 'Doctor'), id])
			redirect(action: "list")
			return
		}
		doctorInstance.isDeleted = false
		redirect(action: "show", id: id)
		flash.message = "Doctor has been restored succesfully!"
	}
	
	def listDeactivated(Integer max){
		params.max = Math.min(max ?: 10, 100)
		[doctorInstanceList: Doctor.list(params), doctorInstanceTotal: Doctor.count()]
	}
	
	def listRemoved(Integer max){
		params.max = Math.min(max ?: 10, 100)
		[doctorInstanceList: Doctor.list(params), doctorInstanceTotal: Doctor.count()]
	}
}
