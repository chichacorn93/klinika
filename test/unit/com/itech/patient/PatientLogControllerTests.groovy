package com.itech.patient



import org.junit.*
import grails.test.mixin.*

@TestFor(PatientLogController)
@Mock(PatientLog)
class PatientLogControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/patientLog/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.patientLogInstanceList.size() == 0
        assert model.patientLogInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.patientLogInstance != null
    }

    void testSave() {
        controller.save()

        assert model.patientLogInstance != null
        assert view == '/patientLog/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/patientLog/show/1'
        assert controller.flash.message != null
        assert PatientLog.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/patientLog/list'

        populateValidParams(params)
        def patientLog = new PatientLog(params)

        assert patientLog.save() != null

        params.id = patientLog.id

        def model = controller.show()

        assert model.patientLogInstance == patientLog
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/patientLog/list'

        populateValidParams(params)
        def patientLog = new PatientLog(params)

        assert patientLog.save() != null

        params.id = patientLog.id

        def model = controller.edit()

        assert model.patientLogInstance == patientLog
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/patientLog/list'

        response.reset()

        populateValidParams(params)
        def patientLog = new PatientLog(params)

        assert patientLog.save() != null

        // test invalid parameters in update
        params.id = patientLog.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/patientLog/edit"
        assert model.patientLogInstance != null

        patientLog.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/patientLog/show/$patientLog.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        patientLog.clearErrors()

        populateValidParams(params)
        params.id = patientLog.id
        params.version = -1
        controller.update()

        assert view == "/patientLog/edit"
        assert model.patientLogInstance != null
        assert model.patientLogInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/patientLog/list'

        response.reset()

        populateValidParams(params)
        def patientLog = new PatientLog(params)

        assert patientLog.save() != null
        assert PatientLog.count() == 1

        params.id = patientLog.id

        controller.delete()

        assert PatientLog.count() == 0
        assert PatientLog.get(patientLog.id) == null
        assert response.redirectedUrl == '/patientLog/list'
    }
}
