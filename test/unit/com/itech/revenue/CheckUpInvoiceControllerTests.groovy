package com.itech.revenue



import org.junit.*
import grails.test.mixin.*

@TestFor(CheckUpInvoiceController)
@Mock(CheckUpInvoice)
class CheckUpInvoiceControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/checkUpInvoice/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.checkUpInvoiceInstanceList.size() == 0
        assert model.checkUpInvoiceInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.checkUpInvoiceInstance != null
    }

    void testSave() {
        controller.save()

        assert model.checkUpInvoiceInstance != null
        assert view == '/checkUpInvoice/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/checkUpInvoice/show/1'
        assert controller.flash.message != null
        assert CheckUpInvoice.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/checkUpInvoice/list'

        populateValidParams(params)
        def checkUpInvoice = new CheckUpInvoice(params)

        assert checkUpInvoice.save() != null

        params.id = checkUpInvoice.id

        def model = controller.show()

        assert model.checkUpInvoiceInstance == checkUpInvoice
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/checkUpInvoice/list'

        populateValidParams(params)
        def checkUpInvoice = new CheckUpInvoice(params)

        assert checkUpInvoice.save() != null

        params.id = checkUpInvoice.id

        def model = controller.edit()

        assert model.checkUpInvoiceInstance == checkUpInvoice
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/checkUpInvoice/list'

        response.reset()

        populateValidParams(params)
        def checkUpInvoice = new CheckUpInvoice(params)

        assert checkUpInvoice.save() != null

        // test invalid parameters in update
        params.id = checkUpInvoice.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/checkUpInvoice/edit"
        assert model.checkUpInvoiceInstance != null

        checkUpInvoice.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/checkUpInvoice/show/$checkUpInvoice.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        checkUpInvoice.clearErrors()

        populateValidParams(params)
        params.id = checkUpInvoice.id
        params.version = -1
        controller.update()

        assert view == "/checkUpInvoice/edit"
        assert model.checkUpInvoiceInstance != null
        assert model.checkUpInvoiceInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/checkUpInvoice/list'

        response.reset()

        populateValidParams(params)
        def checkUpInvoice = new CheckUpInvoice(params)

        assert checkUpInvoice.save() != null
        assert CheckUpInvoice.count() == 1

        params.id = checkUpInvoice.id

        controller.delete()

        assert CheckUpInvoice.count() == 0
        assert CheckUpInvoice.get(checkUpInvoice.id) == null
        assert response.redirectedUrl == '/checkUpInvoice/list'
    }
}
