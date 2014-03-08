package com.itech.schedule



import org.junit.*
import grails.test.mixin.*

@TestFor(FollowUpAppointmentController)
@Mock(FollowUpAppointment)
class FollowUpAppointmentControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/followUpAppointment/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.followUpAppointmentInstanceList.size() == 0
        assert model.followUpAppointmentInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.followUpAppointmentInstance != null
    }

    void testSave() {
        controller.save()

        assert model.followUpAppointmentInstance != null
        assert view == '/followUpAppointment/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/followUpAppointment/show/1'
        assert controller.flash.message != null
        assert FollowUpAppointment.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/followUpAppointment/list'

        populateValidParams(params)
        def followUpAppointment = new FollowUpAppointment(params)

        assert followUpAppointment.save() != null

        params.id = followUpAppointment.id

        def model = controller.show()

        assert model.followUpAppointmentInstance == followUpAppointment
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/followUpAppointment/list'

        populateValidParams(params)
        def followUpAppointment = new FollowUpAppointment(params)

        assert followUpAppointment.save() != null

        params.id = followUpAppointment.id

        def model = controller.edit()

        assert model.followUpAppointmentInstance == followUpAppointment
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/followUpAppointment/list'

        response.reset()

        populateValidParams(params)
        def followUpAppointment = new FollowUpAppointment(params)

        assert followUpAppointment.save() != null

        // test invalid parameters in update
        params.id = followUpAppointment.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/followUpAppointment/edit"
        assert model.followUpAppointmentInstance != null

        followUpAppointment.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/followUpAppointment/show/$followUpAppointment.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        followUpAppointment.clearErrors()

        populateValidParams(params)
        params.id = followUpAppointment.id
        params.version = -1
        controller.update()

        assert view == "/followUpAppointment/edit"
        assert model.followUpAppointmentInstance != null
        assert model.followUpAppointmentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/followUpAppointment/list'

        response.reset()

        populateValidParams(params)
        def followUpAppointment = new FollowUpAppointment(params)

        assert followUpAppointment.save() != null
        assert FollowUpAppointment.count() == 1

        params.id = followUpAppointment.id

        controller.delete()

        assert FollowUpAppointment.count() == 0
        assert FollowUpAppointment.get(followUpAppointment.id) == null
        assert response.redirectedUrl == '/followUpAppointment/list'
    }
}
