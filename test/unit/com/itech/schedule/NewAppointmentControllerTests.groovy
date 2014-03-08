package com.itech.schedule



import org.junit.*
import grails.test.mixin.*

@TestFor(NewAppointmentController)
@Mock(NewAppointment)
class NewAppointmentControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/newAppointment/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.newAppointmentInstanceList.size() == 0
        assert model.newAppointmentInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.newAppointmentInstance != null
    }

    void testSave() {
        controller.save()

        assert model.newAppointmentInstance != null
        assert view == '/newAppointment/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/newAppointment/show/1'
        assert controller.flash.message != null
        assert NewAppointment.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/newAppointment/list'

        populateValidParams(params)
        def newAppointment = new NewAppointment(params)

        assert newAppointment.save() != null

        params.id = newAppointment.id

        def model = controller.show()

        assert model.newAppointmentInstance == newAppointment
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/newAppointment/list'

        populateValidParams(params)
        def newAppointment = new NewAppointment(params)

        assert newAppointment.save() != null

        params.id = newAppointment.id

        def model = controller.edit()

        assert model.newAppointmentInstance == newAppointment
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/newAppointment/list'

        response.reset()

        populateValidParams(params)
        def newAppointment = new NewAppointment(params)

        assert newAppointment.save() != null

        // test invalid parameters in update
        params.id = newAppointment.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/newAppointment/edit"
        assert model.newAppointmentInstance != null

        newAppointment.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/newAppointment/show/$newAppointment.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        newAppointment.clearErrors()

        populateValidParams(params)
        params.id = newAppointment.id
        params.version = -1
        controller.update()

        assert view == "/newAppointment/edit"
        assert model.newAppointmentInstance != null
        assert model.newAppointmentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/newAppointment/list'

        response.reset()

        populateValidParams(params)
        def newAppointment = new NewAppointment(params)

        assert newAppointment.save() != null
        assert NewAppointment.count() == 1

        params.id = newAppointment.id

        controller.delete()

        assert NewAppointment.count() == 0
        assert NewAppointment.get(newAppointment.id) == null
        assert response.redirectedUrl == '/newAppointment/list'
    }
}
