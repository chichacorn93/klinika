package com.itech.revenue



import org.junit.*
import grails.test.mixin.*

@TestFor(ServiceInvoiceController)
@Mock(ServiceInvoice)
class ServiceInvoiceControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/serviceInvoice/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.serviceInvoiceInstanceList.size() == 0
        assert model.serviceInvoiceInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.serviceInvoiceInstance != null
    }

    void testSave() {
        controller.save()

        assert model.serviceInvoiceInstance != null
        assert view == '/serviceInvoice/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/serviceInvoice/show/1'
        assert controller.flash.message != null
        assert ServiceInvoice.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/serviceInvoice/list'

        populateValidParams(params)
        def serviceInvoice = new ServiceInvoice(params)

        assert serviceInvoice.save() != null

        params.id = serviceInvoice.id

        def model = controller.show()

        assert model.serviceInvoiceInstance == serviceInvoice
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/serviceInvoice/list'

        populateValidParams(params)
        def serviceInvoice = new ServiceInvoice(params)

        assert serviceInvoice.save() != null

        params.id = serviceInvoice.id

        def model = controller.edit()

        assert model.serviceInvoiceInstance == serviceInvoice
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/serviceInvoice/list'

        response.reset()

        populateValidParams(params)
        def serviceInvoice = new ServiceInvoice(params)

        assert serviceInvoice.save() != null

        // test invalid parameters in update
        params.id = serviceInvoice.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/serviceInvoice/edit"
        assert model.serviceInvoiceInstance != null

        serviceInvoice.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/serviceInvoice/show/$serviceInvoice.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        serviceInvoice.clearErrors()

        populateValidParams(params)
        params.id = serviceInvoice.id
        params.version = -1
        controller.update()

        assert view == "/serviceInvoice/edit"
        assert model.serviceInvoiceInstance != null
        assert model.serviceInvoiceInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/serviceInvoice/list'

        response.reset()

        populateValidParams(params)
        def serviceInvoice = new ServiceInvoice(params)

        assert serviceInvoice.save() != null
        assert ServiceInvoice.count() == 1

        params.id = serviceInvoice.id

        controller.delete()

        assert ServiceInvoice.count() == 0
        assert ServiceInvoice.get(serviceInvoice.id) == null
        assert response.redirectedUrl == '/serviceInvoice/list'
    }
}
