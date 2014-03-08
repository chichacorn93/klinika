package com.itech.patient



import org.junit.*
import grails.test.mixin.*

@TestFor(DiagnosisController)
@Mock(Diagnosis)
class DiagnosisControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/diagnosis/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.diagnosisInstanceList.size() == 0
        assert model.diagnosisInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.diagnosisInstance != null
    }

    void testSave() {
        controller.save()

        assert model.diagnosisInstance != null
        assert view == '/diagnosis/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/diagnosis/show/1'
        assert controller.flash.message != null
        assert Diagnosis.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/diagnosis/list'

        populateValidParams(params)
        def diagnosis = new Diagnosis(params)

        assert diagnosis.save() != null

        params.id = diagnosis.id

        def model = controller.show()

        assert model.diagnosisInstance == diagnosis
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/diagnosis/list'

        populateValidParams(params)
        def diagnosis = new Diagnosis(params)

        assert diagnosis.save() != null

        params.id = diagnosis.id

        def model = controller.edit()

        assert model.diagnosisInstance == diagnosis
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/diagnosis/list'

        response.reset()

        populateValidParams(params)
        def diagnosis = new Diagnosis(params)

        assert diagnosis.save() != null

        // test invalid parameters in update
        params.id = diagnosis.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/diagnosis/edit"
        assert model.diagnosisInstance != null

        diagnosis.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/diagnosis/show/$diagnosis.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        diagnosis.clearErrors()

        populateValidParams(params)
        params.id = diagnosis.id
        params.version = -1
        controller.update()

        assert view == "/diagnosis/edit"
        assert model.diagnosisInstance != null
        assert model.diagnosisInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/diagnosis/list'

        response.reset()

        populateValidParams(params)
        def diagnosis = new Diagnosis(params)

        assert diagnosis.save() != null
        assert Diagnosis.count() == 1

        params.id = diagnosis.id

        controller.delete()

        assert Diagnosis.count() == 0
        assert Diagnosis.get(diagnosis.id) == null
        assert response.redirectedUrl == '/diagnosis/list'
    }
}
