package com.itech.patient

import org.springframework.dao.DataIntegrityViolationException

class PatientLogController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [patientLogInstanceList: PatientLog.list(params), patientLogInstanceTotal: PatientLog.count()]
    }

    def create() {
        [patientLogInstance: new PatientLog(params)]
    }

    def save() {
        def patientLogInstance = new PatientLog(params)		
        if (!patientLogInstance.save(flush: true)) {
            render(view: "create", model: [patientLogInstance: patientLogInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'patientLog.label', default: 'PatientLog'), patientLogInstance.id])
        redirect(action: "show", id: patientLogInstance.id)
    }

    def show(Long id) {
        def patientLogInstance = PatientLog.get(id)
        if (!patientLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'patientLog.label', default: 'PatientLog'), id])
            redirect(action: "list")
            return
        }

        [patientLogInstance: patientLogInstance]
    }

    def edit(Long id) {
        def patientLogInstance = PatientLog.get(id)
        if (!patientLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'patientLog.label', default: 'PatientLog'), id])
            redirect(action: "list")
            return
        }

        [patientLogInstance: patientLogInstance]
    }

    def update(Long id, Long version) {
        def patientLogInstance = PatientLog.get(id)
        if (!patientLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'patientLog.label', default: 'PatientLog'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (patientLogInstance.version > version) {
                patientLogInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'patientLog.label', default: 'PatientLog')] as Object[],
                          "Another user has updated this PatientLog while you were editing")
                render(view: "edit", model: [patientLogInstance: patientLogInstance])
                return
            }
        }

        patientLogInstance.properties = params

        if (!patientLogInstance.save(flush: true)) {
            render(view: "edit", model: [patientLogInstance: patientLogInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'patientLog.label', default: 'PatientLog'), patientLogInstance.id])
        redirect(action: "show", id: patientLogInstance.id)
    }

    def delete(Long id) {
        def patientLogInstance = PatientLog.get(id)
        if (!patientLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'patientLog.label', default: 'PatientLog'), id])
            redirect(action: "list")
            return
        }

        try {
            patientLogInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'patientLog.label', default: 'PatientLog'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'patientLog.label', default: 'PatientLog'), id])
            redirect(action: "show", id: id)
        }
    }
}
