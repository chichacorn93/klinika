package com.itech.membership

import org.springframework.dao.DataIntegrityViolationException

class ReceptionistController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [receptionistInstanceList: Receptionist.list(params), receptionistInstanceTotal: Receptionist.count()]
    }

    def create() {
        [receptionistInstance: new Receptionist(params)]
    }

    def save() {
        def receptionistInstance = new Receptionist(params)
        if (!receptionistInstance.save(flush: true)) {
            render(view: "create", model: [receptionistInstance: receptionistInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'receptionist.label', default: 'Receptionist'), receptionistInstance.id])
        redirect(action: "show", id: receptionistInstance.id)
    }

    def show(Long id) {
        def receptionistInstance = Receptionist.get(id)
        if (!receptionistInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'receptionist.label', default: 'Receptionist'), id])
            redirect(action: "list")
            return
        }

        [receptionistInstance: receptionistInstance]
    }

    def edit(Long id) {
        def receptionistInstance = Receptionist.get(id)
        if (!receptionistInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'receptionist.label', default: 'Receptionist'), id])
            redirect(action: "list")
            return
        }

        [receptionistInstance: receptionistInstance]
    }

    def update(Long id, Long version) {
        def receptionistInstance = Receptionist.get(id)
        if (!receptionistInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'receptionist.label', default: 'Receptionist'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (receptionistInstance.version > version) {
                receptionistInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'receptionist.label', default: 'Receptionist')] as Object[],
                          "Another user has updated this Receptionist while you were editing")
                render(view: "edit", model: [receptionistInstance: receptionistInstance])
                return
            }
        }

        receptionistInstance.properties = params

        if (!receptionistInstance.save(flush: true)) {
            render(view: "edit", model: [receptionistInstance: receptionistInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'receptionist.label', default: 'Receptionist'), receptionistInstance.id])
        redirect(action: "show", id: receptionistInstance.id)
    }

    def delete(Long id) {
        def receptionistInstance = Receptionist.get(id)
        if (!receptionistInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'receptionist.label', default: 'Receptionist'), id])
            redirect(action: "list")
            return
        }

        try {
            receptionistInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'receptionist.label', default: 'Receptionist'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'receptionist.label', default: 'Receptionist'), id])
            redirect(action: "show", id: id)
        }
    }
}
