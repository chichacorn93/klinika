package com.itech.revenue

import org.springframework.dao.DataIntegrityViolationException

class CheckUpInvoiceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [checkUpInvoiceInstanceList: CheckUpInvoice.list(params), checkUpInvoiceInstanceTotal: CheckUpInvoice.count()]
    }

    def create() {
        [checkUpInvoiceInstance: new CheckUpInvoice(params)]
    }

    def save() {
        def checkUpInvoiceInstance = new CheckUpInvoice(params)
        if (!checkUpInvoiceInstance.save(flush: true)) {
            render(view: "create", model: [checkUpInvoiceInstance: checkUpInvoiceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'checkUpInvoice.label', default: 'CheckUpInvoice'), checkUpInvoiceInstance.id])
        redirect(action: "show", id: checkUpInvoiceInstance.id)
    }

    def show(Long id) {
        def checkUpInvoiceInstance = CheckUpInvoice.get(id)
        if (!checkUpInvoiceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'checkUpInvoice.label', default: 'CheckUpInvoice'), id])
            redirect(action: "list")
            return
        }

        [checkUpInvoiceInstance: checkUpInvoiceInstance]
    }

    def edit(Long id) {
        def checkUpInvoiceInstance = CheckUpInvoice.get(id)
        if (!checkUpInvoiceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'checkUpInvoice.label', default: 'CheckUpInvoice'), id])
            redirect(action: "list")
            return
        }

        [checkUpInvoiceInstance: checkUpInvoiceInstance]
    }

    def update(Long id, Long version) {
        def checkUpInvoiceInstance = CheckUpInvoice.get(id)
        if (!checkUpInvoiceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'checkUpInvoice.label', default: 'CheckUpInvoice'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (checkUpInvoiceInstance.version > version) {
                checkUpInvoiceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'checkUpInvoice.label', default: 'CheckUpInvoice')] as Object[],
                          "Another user has updated this CheckUpInvoice while you were editing")
                render(view: "edit", model: [checkUpInvoiceInstance: checkUpInvoiceInstance])
                return
            }
        }

        checkUpInvoiceInstance.properties = params

        if (!checkUpInvoiceInstance.save(flush: true)) {
            render(view: "edit", model: [checkUpInvoiceInstance: checkUpInvoiceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'checkUpInvoice.label', default: 'CheckUpInvoice'), checkUpInvoiceInstance.id])
        redirect(action: "show", id: checkUpInvoiceInstance.id)
    }

    def delete(Long id) {
        def checkUpInvoiceInstance = CheckUpInvoice.get(id)
        if (!checkUpInvoiceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'checkUpInvoice.label', default: 'CheckUpInvoice'), id])
            redirect(action: "list")
            return
        }

        try {
            checkUpInvoiceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'checkUpInvoice.label', default: 'CheckUpInvoice'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'checkUpInvoice.label', default: 'CheckUpInvoice'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def revenue(){
		def totalRevenue = CheckUpInvoice.getCheckUpRevenue()
		render "$totalRevenue"
	}
}
