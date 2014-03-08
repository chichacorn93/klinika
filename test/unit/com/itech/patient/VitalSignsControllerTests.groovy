package com.itech.patient



import org.junit.*
import grails.test.mixin.*

@TestFor(VitalSignsController)
@Mock(VitalSigns)
class VitalSignsControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/vitalSigns/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.vitalSignsInstanceList.size() == 0
        assert model.vitalSignsInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.vitalSignsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.vitalSignsInstance != null
        assert view == '/vitalSigns/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/vitalSigns/show/1'
        assert controller.flash.message != null
        assert VitalSigns.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/vitalSigns/list'

        populateValidParams(params)
        def vitalSigns = new VitalSigns(params)

        assert vitalSigns.save() != null

        params.id = vitalSigns.id

        def model = controller.show()

        assert model.vitalSignsInstance == vitalSigns
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/vitalSigns/list'

        populateValidParams(params)
        def vitalSigns = new VitalSigns(params)

        assert vitalSigns.save() != null

        params.id = vitalSigns.id

        def model = controller.edit()

        assert model.vitalSignsInstance == vitalSigns
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/vitalSigns/list'

        response.reset()

        populateValidParams(params)
        def vitalSigns = new VitalSigns(params)

        assert vitalSigns.save() != null

        // test invalid parameters in update
        params.id = vitalSigns.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/vitalSigns/edit"
        assert model.vitalSignsInstance != null

        vitalSigns.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/vitalSigns/show/$vitalSigns.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        vitalSigns.clearErrors()

        populateValidParams(params)
        params.id = vitalSigns.id
        params.version = -1
        controller.update()

        assert view == "/vitalSigns/edit"
        assert model.vitalSignsInstance != null
        assert model.vitalSignsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/vitalSigns/list'

        response.reset()

        populateValidParams(params)
        def vitalSigns = new VitalSigns(params)

        assert vitalSigns.save() != null
        assert VitalSigns.count() == 1

        params.id = vitalSigns.id

        controller.delete()

        assert VitalSigns.count() == 0
        assert VitalSigns.get(vitalSigns.id) == null
        assert response.redirectedUrl == '/vitalSigns/list'
    }
}
