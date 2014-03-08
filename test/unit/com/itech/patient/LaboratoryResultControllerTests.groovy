package com.itech.patient



import org.junit.*
import grails.test.mixin.*

@TestFor(LaboratoryResultController)
@Mock(LaboratoryResult)
class LaboratoryResultControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/laboratoryResult/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.laboratoryResultInstanceList.size() == 0
        assert model.laboratoryResultInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.laboratoryResultInstance != null
    }

    void testSave() {
        controller.save()

        assert model.laboratoryResultInstance != null
        assert view == '/laboratoryResult/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/laboratoryResult/show/1'
        assert controller.flash.message != null
        assert LaboratoryResult.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/laboratoryResult/list'

        populateValidParams(params)
        def laboratoryResult = new LaboratoryResult(params)

        assert laboratoryResult.save() != null

        params.id = laboratoryResult.id

        def model = controller.show()

        assert model.laboratoryResultInstance == laboratoryResult
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/laboratoryResult/list'

        populateValidParams(params)
        def laboratoryResult = new LaboratoryResult(params)

        assert laboratoryResult.save() != null

        params.id = laboratoryResult.id

        def model = controller.edit()

        assert model.laboratoryResultInstance == laboratoryResult
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/laboratoryResult/list'

        response.reset()

        populateValidParams(params)
        def laboratoryResult = new LaboratoryResult(params)

        assert laboratoryResult.save() != null

        // test invalid parameters in update
        params.id = laboratoryResult.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/laboratoryResult/edit"
        assert model.laboratoryResultInstance != null

        laboratoryResult.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/laboratoryResult/show/$laboratoryResult.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        laboratoryResult.clearErrors()

        populateValidParams(params)
        params.id = laboratoryResult.id
        params.version = -1
        controller.update()

        assert view == "/laboratoryResult/edit"
        assert model.laboratoryResultInstance != null
        assert model.laboratoryResultInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/laboratoryResult/list'

        response.reset()

        populateValidParams(params)
        def laboratoryResult = new LaboratoryResult(params)

        assert laboratoryResult.save() != null
        assert LaboratoryResult.count() == 1

        params.id = laboratoryResult.id

        controller.delete()

        assert LaboratoryResult.count() == 0
        assert LaboratoryResult.get(laboratoryResult.id) == null
        assert response.redirectedUrl == '/laboratoryResult/list'
    }
}
