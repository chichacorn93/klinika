<%@ page import="com.itech.revenue.CheckUpInvoice" %>



<div class="fieldcontain ${hasErrors(bean: checkUpInvoiceInstance, field: 'number', 'error')} required">
	<label for="number">
		<g:message code="checkUpInvoice.number.label" default="Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="number" type="number" value="${checkUpInvoiceInstance.number}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: checkUpInvoiceInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="checkUpInvoice.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${checkUpInvoiceInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: checkUpInvoiceInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="checkUpInvoice.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${checkUpInvoiceInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: checkUpInvoiceInstance, field: 'doctor', 'error')} required">
	<label for="doctor">
		<g:message code="checkUpInvoice.doctor.label" default="Doctor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="doctor" name="doctor.id" from="${com.itech.membership.Doctor.list()}" optionKey="id" required="" value="${checkUpInvoiceInstance?.doctor?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: checkUpInvoiceInstance, field: 'hasBalance', 'error')} ">
	<label for="hasBalance">
		<g:message code="checkUpInvoice.hasBalance.label" default="Has Balance" />
		
	</label>
	<g:checkBox name="hasBalance" value="${checkUpInvoiceInstance?.hasBalance}" />
</div>

<div class="fieldcontain ${hasErrors(bean: checkUpInvoiceInstance, field: 'patient', 'error')} required">
	<label for="patient">
		<g:message code="checkUpInvoice.patient.label" default="Patient" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="patient" name="patient.id" from="${com.itech.patient.Patient.list()}" optionKey="id" required="" value="${checkUpInvoiceInstance?.patient?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: checkUpInvoiceInstance, field: 'paymentMethod', 'error')} required">
	<label for="paymentMethod">
		<g:message code="checkUpInvoice.paymentMethod.label" default="Payment Method" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="paymentMethod" from="${enums.PaymentMethod?.values()}" keys="${enums.PaymentMethod.values()*.name()}" required="" value="${checkUpInvoiceInstance?.paymentMethod?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: checkUpInvoiceInstance, field: 'paymentOption', 'error')} required">
	<label for="paymentOption">
		<g:message code="checkUpInvoice.paymentOption.label" default="Payment Option" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="paymentOption" from="${enums.PaymentOption?.values()}" keys="${enums.PaymentOption.values()*.name()}" required="" value="${checkUpInvoiceInstance?.paymentOption?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: checkUpInvoiceInstance, field: 'payments', 'error')} ">
	<label for="payments">
		<g:message code="checkUpInvoice.payments.label" default="Payments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${checkUpInvoiceInstance?.payments?}" var="p">
    <li><g:link controller="payment" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="payment" action="create" params="['checkUpInvoice.id': checkUpInvoiceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'payment.label', default: 'Payment')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: checkUpInvoiceInstance, field: 'totalAmount', 'error')} required">
	<label for="totalAmount">
		<g:message code="checkUpInvoice.totalAmount.label" default="Total Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalAmount" value="${fieldValue(bean: checkUpInvoiceInstance, field: 'totalAmount')}" required=""/>
</div>

