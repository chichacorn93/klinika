package com.itech.patient

import org.springframework.dao.DataIntegrityViolationException

class ReferralController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [referralInstanceList: Referral.list(params), referralInstanceTotal: Referral.count()]
    }

    def create() {
        [referralInstance: new Referral(params)]
    }

    def save() {
        def referralInstance = new Referral(params)
        if (!referralInstance.save(flush: true)) {
            render(view: "create", model: [referralInstance: referralInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'referral.label', default: 'Referral'), referralInstance.id])
        redirect(action: "show", id: referralInstance.id)
    }

    def show(Long id) {
        def referralInstance = Referral.get(id)
        if (!referralInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'referral.label', default: 'Referral'), id])
            redirect(action: "list")
            return
        }

        [referralInstance: referralInstance]
    }

    def edit(Long id) {
        def referralInstance = Referral.get(id)
        if (!referralInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'referral.label', default: 'Referral'), id])
            redirect(action: "list")
            return
        }

        [referralInstance: referralInstance]
    }

    def update(Long id, Long version) {
        def referralInstance = Referral.get(id)
        if (!referralInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'referral.label', default: 'Referral'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (referralInstance.version > version) {
                referralInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'referral.label', default: 'Referral')] as Object[],
                          "Another user has updated this Referral while you were editing")
                render(view: "edit", model: [referralInstance: referralInstance])
                return
            }
        }

        referralInstance.properties = params

        if (!referralInstance.save(flush: true)) {
            render(view: "edit", model: [referralInstance: referralInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'referral.label', default: 'Referral'), referralInstance.id])
        redirect(action: "show", id: referralInstance.id)
    }

    def delete(Long id) {
        def referralInstance = Referral.get(id)
        if (!referralInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'referral.label', default: 'Referral'), id])
            redirect(action: "list")
            return
        }

        try {
            referralInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'referral.label', default: 'Referral'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'referral.label', default: 'Referral'), id])
            redirect(action: "show", id: id)
        }
    }
}
