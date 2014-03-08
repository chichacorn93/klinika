package com.itech.revenue

import org.springframework.dao.DataIntegrityViolationException

class ServiceInvoiceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [serviceInvoiceInstanceList: ServiceInvoice.list(params), serviceInvoiceInstanceTotal: ServiceInvoice.count()]
    }

    def create() {
        [serviceInvoiceInstance: new ServiceInvoice(params)]
    }

    def save() {
        def serviceInvoiceInstance = new ServiceInvoice(params)
        if (!serviceInvoiceInstance.save(flush: true)) {
            render(view: "create", model: [serviceInvoiceInstance: serviceInvoiceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'serviceInvoice.label', default: 'ServiceInvoice'), serviceInvoiceInstance.id])
        redirect(action: "show", id: serviceInvoiceInstance.id)
    }

    def show(Long id) {
        def serviceInvoiceInstance = ServiceInvoice.get(id)
        if (!serviceInvoiceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'serviceInvoice.label', default: 'ServiceInvoice'), id])
            redirect(action: "list")
            return
        }

        [serviceInvoiceInstance: serviceInvoiceInstance]
    }

    def edit(Long id) {
        def serviceInvoiceInstance = ServiceInvoice.get(id)
        if (!serviceInvoiceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'serviceInvoice.label', default: 'ServiceInvoice'), id])
            redirect(action: "list")
            return
        }

        [serviceInvoiceInstance: serviceInvoiceInstance]
    }

    def update(Long id, Long version) {
        def serviceInvoiceInstance = ServiceInvoice.get(id)
        if (!serviceInvoiceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'serviceInvoice.label', default: 'ServiceInvoice'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (serviceInvoiceInstance.version > version) {
                serviceInvoiceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'serviceInvoice.label', default: 'ServiceInvoice')] as Object[],
                          "Another user has updated this ServiceInvoice while you were editing")
                render(view: "edit", model: [serviceInvoiceInstance: serviceInvoiceInstance])
                return
            }
        }

        serviceInvoiceInstance.properties = params

        if (!serviceInvoiceInstance.save(flush: true)) {
            render(view: "edit", model: [serviceInvoiceInstance: serviceInvoiceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'serviceInvoice.label', default: 'ServiceInvoice'), serviceInvoiceInstance.id])
        redirect(action: "show", id: serviceInvoiceInstance.id)
    }

    def delete(Long id) {
        def serviceInvoiceInstance = ServiceInvoice.get(id)
        if (!serviceInvoiceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'serviceInvoice.label', default: 'ServiceInvoice'), id])
            redirect(action: "list")
            return
        }

        try {
            serviceInvoiceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'serviceInvoice.label', default: 'ServiceInvoice'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'serviceInvoice.label', default: 'ServiceInvoice'), id])
            redirect(action: "show", id: id)
        }
    }
}
