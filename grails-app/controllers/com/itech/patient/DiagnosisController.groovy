package com.itech.patient

import org.springframework.dao.DataIntegrityViolationException

class DiagnosisController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [diagnosisInstanceList: Diagnosis.list(params), diagnosisInstanceTotal: Diagnosis.count()]
    }

    def create() {
        [diagnosisInstance: new Diagnosis(params)]
    }

    def save() {
        def diagnosisInstance = new Diagnosis(params)
        if (!diagnosisInstance.save(flush: true)) {
            render(view: "create", model: [diagnosisInstance: diagnosisInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'diagnosis.label', default: 'Diagnosis'), diagnosisInstance.id])
        redirect(action: "show", id: diagnosisInstance.id)
    }

    def show(Long id) {
        def diagnosisInstance = Diagnosis.get(id)
        if (!diagnosisInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'diagnosis.label', default: 'Diagnosis'), id])
            redirect(action: "list")
            return
        }

        [diagnosisInstance: diagnosisInstance]
    }

    def edit(Long id) {
        def diagnosisInstance = Diagnosis.get(id)
        if (!diagnosisInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'diagnosis.label', default: 'Diagnosis'), id])
            redirect(action: "list")
            return
        }

        [diagnosisInstance: diagnosisInstance]
    }

    def update(Long id, Long version) {
        def diagnosisInstance = Diagnosis.get(id)
        if (!diagnosisInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'diagnosis.label', default: 'Diagnosis'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (diagnosisInstance.version > version) {
                diagnosisInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'diagnosis.label', default: 'Diagnosis')] as Object[],
                          "Another user has updated this Diagnosis while you were editing")
                render(view: "edit", model: [diagnosisInstance: diagnosisInstance])
                return
            }
        }

        diagnosisInstance.properties = params

        if (!diagnosisInstance.save(flush: true)) {
            render(view: "edit", model: [diagnosisInstance: diagnosisInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'diagnosis.label', default: 'Diagnosis'), diagnosisInstance.id])
        redirect(action: "show", id: diagnosisInstance.id)
    }

    def delete(Long id) {
        def diagnosisInstance = Diagnosis.get(id)
        if (!diagnosisInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'diagnosis.label', default: 'Diagnosis'), id])
            redirect(action: "list")
            return
        }

        try {
            diagnosisInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'diagnosis.label', default: 'Diagnosis'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'diagnosis.label', default: 'Diagnosis'), id])
            redirect(action: "show", id: id)
        }
    }
}
