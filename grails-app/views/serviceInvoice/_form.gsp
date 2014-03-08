<%@ page import="com.itech.revenue.ServiceInvoice" %>



<div class="fieldcontain ${hasErrors(bean: serviceInvoiceInstance, field: 'number', 'error')} required">
	<label for="number">
		<g:message code="serviceInvoice.number.label" default="Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="number" type="number" value="${serviceInvoiceInstance.number}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: serviceInvoiceInstance, field: 'payer', 'error')} required">
	<label for="payer">
		<g:message code="serviceInvoice.payer.label" default="Payer" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="payer" required="" value="${serviceInvoiceInstance?.payer}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serviceInvoiceInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="serviceInvoice.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${serviceInvoiceInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: serviceInvoiceInstance, field: 'doctor', 'error')} required">
	<label for="doctor">
		<g:message code="serviceInvoice.doctor.label" default="Doctor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="doctor" name="doctor.id" from="${com.itech.membership.Doctor.list()}" optionKey="id" required="" value="${serviceInvoiceInstance?.doctor?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serviceInvoiceInstance, field: 'hasBalance', 'error')} ">
	<label for="hasBalance">
		<g:message code="serviceInvoice.hasBalance.label" default="Has Balance" />
		
	</label>
	<g:checkBox name="hasBalance" value="${serviceInvoiceInstance?.hasBalance}" />
</div>

<div class="fieldcontain ${hasErrors(bean: serviceInvoiceInstance, field: 'patient', 'error')} required">
	<label for="patient">
		<g:message code="serviceInvoice.patient.label" default="Patient" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="patient" name="patient.id" from="${com.itech.patient.Patient.list()}" optionKey="id" required="" value="${serviceInvoiceInstance?.patient?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serviceInvoiceInstance, field: 'paymentMethod', 'error')} required">
	<label for="paymentMethod">
		<g:message code="serviceInvoice.paymentMethod.label" default="Payment Method" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="paymentMethod" from="${enums.PaymentMethod?.values()}" keys="${enums.PaymentMethod.values()*.name()}" required="" value="${serviceInvoiceInstance?.paymentMethod?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serviceInvoiceInstance, field: 'paymentOption', 'error')} required">
	<label for="paymentOption">
		<g:message code="serviceInvoice.paymentOption.label" default="Payment Option" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="paymentOption" from="${enums.PaymentOption?.values()}" keys="${enums.PaymentOption.values()*.name()}" required="" value="${serviceInvoiceInstance?.paymentOption?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serviceInvoiceInstance, field: 'payments', 'error')} ">
	<label for="payments">
		<g:message code="serviceInvoice.payments.label" default="Payments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${serviceInvoiceInstance?.payments?}" var="p">
    <li><g:link controller="payment" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="payment" action="create" params="['serviceInvoice.id': serviceInvoiceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'payment.label', default: 'Payment')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: serviceInvoiceInstance, field: 'services', 'error')} ">
	<label for="services">
		<g:message code="serviceInvoice.services.label" default="Services" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${serviceInvoiceInstance?.services?}" var="s">
    <li><g:link controller="service" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="service" action="create" params="['serviceInvoice.id': serviceInvoiceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'service.label', default: 'Service')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: serviceInvoiceInstance, field: 'totalAmount', 'error')} required">
	<label for="totalAmount">
		<g:message code="serviceInvoice.totalAmount.label" default="Total Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalAmount" value="${fieldValue(bean: serviceInvoiceInstance, field: 'totalAmount')}" required=""/>
</div>

