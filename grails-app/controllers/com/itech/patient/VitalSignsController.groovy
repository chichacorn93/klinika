package com.itech.patient

import org.springframework.dao.DataIntegrityViolationException

class VitalSignsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [vitalSignsInstanceList: VitalSigns.list(params), vitalSignsInstanceTotal: VitalSigns.count()]
    }

    def create() {
        [vitalSignsInstance: new VitalSigns(params)]
    }

    def save() {
        def vitalSignsInstance = new VitalSigns(params)
        if (!vitalSignsInstance.save(flush: true)) {
            render(view: "create", model: [vitalSignsInstance: vitalSignsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'vitalSigns.label', default: 'VitalSigns'), vitalSignsInstance.id])
        redirect(action: "show", id: vitalSignsInstance.id)
    }

    def show(Long id) {
        def vitalSignsInstance = VitalSigns.get(id)
        if (!vitalSignsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vitalSigns.label', default: 'VitalSigns'), id])
            redirect(action: "list")
            return
        }

        [vitalSignsInstance: vitalSignsInstance]
    }

    def edit(Long id) {
        def vitalSignsInstance = VitalSigns.get(id)
        if (!vitalSignsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vitalSigns.label', default: 'VitalSigns'), id])
            redirect(action: "list")
            return
        }

        [vitalSignsInstance: vitalSignsInstance]
    }

    def update(Long id, Long version) {
        def vitalSignsInstance = VitalSigns.get(id)
        if (!vitalSignsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vitalSigns.label', default: 'VitalSigns'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (vitalSignsInstance.version > version) {
                vitalSignsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'vitalSigns.label', default: 'VitalSigns')] as Object[],
                          "Another user has updated this VitalSigns while you were editing")
                render(view: "edit", model: [vitalSignsInstance: vitalSignsInstance])
                return
            }
        }

        vitalSignsInstance.properties = params

        if (!vitalSignsInstance.save(flush: true)) {
            render(view: "edit", model: [vitalSignsInstance: vitalSignsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'vitalSigns.label', default: 'VitalSigns'), vitalSignsInstance.id])
        redirect(action: "show", id: vitalSignsInstance.id)
    }

    def delete(Long id) {
        def vitalSignsInstance = VitalSigns.get(id)
        if (!vitalSignsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vitalSigns.label', default: 'VitalSigns'), id])
            redirect(action: "list")
            return
        }

        try {
            vitalSignsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'vitalSigns.label', default: 'VitalSigns'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'vitalSigns.label', default: 'VitalSigns'), id])
            redirect(action: "show", id: id)
        }
    }
}
