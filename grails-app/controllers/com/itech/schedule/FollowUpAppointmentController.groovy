package com.itech.schedule

import org.springframework.dao.DataIntegrityViolationException

class FollowUpAppointmentController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[followUpAppointmentInstanceList: FollowUpAppointment.list(params), followUpAppointmentInstanceTotal: FollowUpAppointment.count()]
	}

	def create() {
		[followUpAppointmentInstance: new FollowUpAppointment(params)]
	}

	def save() {
		def followUpAppointmentInstance = new FollowUpAppointment(params)
		if (!followUpAppointmentInstance.save(flush: true)) {
			render(view: "create", model: [followUpAppointmentInstance: followUpAppointmentInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'followUpAppointment.label', default: 'FollowUpAppointment'),
			followUpAppointmentInstance.id
		])
		redirect(action: "show", id: followUpAppointmentInstance.id)
	}

	def show(Long id) {
		def followUpAppointmentInstance = FollowUpAppointment.get(id)
		if (!followUpAppointmentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'followUpAppointment.label', default: 'FollowUpAppointment'),
				id
			])
			redirect(action: "list")
			return
		}

		[followUpAppointmentInstance: followUpAppointmentInstance]
	}

	def edit(Long id) {
		def followUpAppointmentInstance = FollowUpAppointment.get(id)
		if (!followUpAppointmentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'followUpAppointment.label', default: 'FollowUpAppointment'),
				id
			])
			redirect(action: "list")
			return
		}

		[followUpAppointmentInstance: followUpAppointmentInstance]
	}

	def update(Long id, Long version) {
		def followUpAppointmentInstance = FollowUpAppointment.get(id)
		if (!followUpAppointmentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'followUpAppointment.label', default: 'FollowUpAppointment'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (followUpAppointmentInstance.version > version) {
				followUpAppointmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'followUpAppointment.label', default: 'FollowUpAppointment')] as Object[],
						"Another user has updated this FollowUpAppointment while you were editing")
				render(view: "edit", model: [followUpAppointmentInstance: followUpAppointmentInstance])
				return
			}
		}

		followUpAppointmentInstance.properties = params

		if (!followUpAppointmentInstance.save(flush: true)) {
			render(view: "edit", model: [followUpAppointmentInstance: followUpAppointmentInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'followUpAppointment.label', default: 'FollowUpAppointment'),
			followUpAppointmentInstance.id
		])
		redirect(action: "show", id: followUpAppointmentInstance.id)
	}

	def delete(Long id) {
		def followUpAppointmentInstance = FollowUpAppointment.get(id)
		if (!followUpAppointmentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'followUpAppointment.label', default: 'FollowUpAppointment'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			followUpAppointmentInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'followUpAppointment.label', default: 'FollowUpAppointment'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'followUpAppointment.label', default: 'FollowUpAppointment'),
				id
			])
			redirect(action: "show", id: id)
		}
	}
}
