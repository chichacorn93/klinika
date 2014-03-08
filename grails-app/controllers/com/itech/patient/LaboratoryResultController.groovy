package com.itech.patient

import org.springframework.dao.DataIntegrityViolationException

class LaboratoryResultController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [laboratoryResultInstanceList: LaboratoryResult.list(params), laboratoryResultInstanceTotal: LaboratoryResult.count()]
    }

    def create() {
        [laboratoryResultInstance: new LaboratoryResult(params)]
    }

    def save() {
        def laboratoryResultInstance = new LaboratoryResult(params)
        if (!laboratoryResultInstance.save(flush: true)) {
            render(view: "create", model: [laboratoryResultInstance: laboratoryResultInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'laboratoryResult.label', default: 'LaboratoryResult'), laboratoryResultInstance.id])
        redirect(action: "show", id: laboratoryResultInstance.id)
    }

    def show(Long id) {
        def laboratoryResultInstance = LaboratoryResult.get(id)
        if (!laboratoryResultInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'laboratoryResult.label', default: 'LaboratoryResult'), id])
            redirect(action: "list")
            return
        }

        [laboratoryResultInstance: laboratoryResultInstance]
    }

    def edit(Long id) {
        def laboratoryResultInstance = LaboratoryResult.get(id)
        if (!laboratoryResultInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'laboratoryResult.label', default: 'LaboratoryResult'), id])
            redirect(action: "list")
            return
        }

        [laboratoryResultInstance: laboratoryResultInstance]
    }

    def update(Long id, Long version) {
        def laboratoryResultInstance = LaboratoryResult.get(id)
        if (!laboratoryResultInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'laboratoryResult.label', default: 'LaboratoryResult'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (laboratoryResultInstance.version > version) {
                laboratoryResultInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'laboratoryResult.label', default: 'LaboratoryResult')] as Object[],
                          "Another user has updated this LaboratoryResult while you were editing")
                render(view: "edit", model: [laboratoryResultInstance: laboratoryResultInstance])
                return
            }
        }

        laboratoryResultInstance.properties = params

        if (!laboratoryResultInstance.save(flush: true)) {
            render(view: "edit", model: [laboratoryResultInstance: laboratoryResultInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'laboratoryResult.label', default: 'LaboratoryResult'), laboratoryResultInstance.id])
        redirect(action: "show", id: laboratoryResultInstance.id)
    }

    def delete(Long id) {
        def laboratoryResultInstance = LaboratoryResult.get(id)
        if (!laboratoryResultInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'laboratoryResult.label', default: 'LaboratoryResult'), id])
            redirect(action: "list")
            return
        }

        try {
            laboratoryResultInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'laboratoryResult.label', default: 'LaboratoryResult'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'laboratoryResult.label', default: 'LaboratoryResult'), id])
            redirect(action: "show", id: id)
        }
    }
}
