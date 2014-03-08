package com.itech.membership



import org.junit.*
import grails.test.mixin.*

@TestFor(ReceptionistController)
@Mock(Receptionist)
class ReceptionistControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/receptionist/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.receptionistInstanceList.size() == 0
        assert model.receptionistInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.receptionistInstance != null
    }

    void testSave() {
        controller.save()

        assert model.receptionistInstance != null
        assert view == '/receptionist/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/receptionist/show/1'
        assert controller.flash.message != null
        assert Receptionist.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/receptionist/list'

        populateValidParams(params)
        def receptionist = new Receptionist(params)

        assert receptionist.save() != null

        params.id = receptionist.id

        def model = controller.show()

        assert model.receptionistInstance == receptionist
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/receptionist/list'

        populateValidParams(params)
        def receptionist = new Receptionist(params)

        assert receptionist.save() != null

        params.id = receptionist.id

        def model = controller.edit()

        assert model.receptionistInstance == receptionist
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/receptionist/list'

        response.reset()

        populateValidParams(params)
        def receptionist = new Receptionist(params)

        assert receptionist.save() != null

        // test invalid parameters in update
        params.id = receptionist.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/receptionist/edit"
        assert model.receptionistInstance != null

        receptionist.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/receptionist/show/$receptionist.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        receptionist.clearErrors()

        populateValidParams(params)
        params.id = receptionist.id
        params.version = -1
        controller.update()

        assert view == "/receptionist/edit"
        assert model.receptionistInstance != null
        assert model.receptionistInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/receptionist/list'

        response.reset()

        populateValidParams(params)
        def receptionist = new Receptionist(params)

        assert receptionist.save() != null
        assert Receptionist.count() == 1

        params.id = receptionist.id

        controller.delete()

        assert Receptionist.count() == 0
        assert Receptionist.get(receptionist.id) == null
        assert response.redirectedUrl == '/receptionist/list'
    }
}
