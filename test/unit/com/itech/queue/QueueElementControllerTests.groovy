package com.itech.queue



import org.junit.*
import grails.test.mixin.*

@TestFor(QueueElementController)
@Mock(QueueElement)
class QueueElementControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/queueElement/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.queueElementInstanceList.size() == 0
        assert model.queueElementInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.queueElementInstance != null
    }

    void testSave() {
        controller.save()

        assert model.queueElementInstance != null
        assert view == '/queueElement/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/queueElement/show/1'
        assert controller.flash.message != null
        assert QueueElement.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/queueElement/list'

        populateValidParams(params)
        def queueElement = new QueueElement(params)

        assert queueElement.save() != null

        params.id = queueElement.id

        def model = controller.show()

        assert model.queueElementInstance == queueElement
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/queueElement/list'

        populateValidParams(params)
        def queueElement = new QueueElement(params)

        assert queueElement.save() != null

        params.id = queueElement.id

        def model = controller.edit()

        assert model.queueElementInstance == queueElement
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/queueElement/list'

        response.reset()

        populateValidParams(params)
        def queueElement = new QueueElement(params)

        assert queueElement.save() != null

        // test invalid parameters in update
        params.id = queueElement.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/queueElement/edit"
        assert model.queueElementInstance != null

        queueElement.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/queueElement/show/$queueElement.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        queueElement.clearErrors()

        populateValidParams(params)
        params.id = queueElement.id
        params.version = -1
        controller.update()

        assert view == "/queueElement/edit"
        assert model.queueElementInstance != null
        assert model.queueElementInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/queueElement/list'

        response.reset()

        populateValidParams(params)
        def queueElement = new QueueElement(params)

        assert queueElement.save() != null
        assert QueueElement.count() == 1

        params.id = queueElement.id

        controller.delete()

        assert QueueElement.count() == 0
        assert QueueElement.get(queueElement.id) == null
        assert response.redirectedUrl == '/queueElement/list'
    }
}
