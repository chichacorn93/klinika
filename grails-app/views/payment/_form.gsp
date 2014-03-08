<%@ page import="com.itech.revenue.Payment" %>



<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'amountpaid', 'error')} required">
	<label for="amountpaid">
		<g:message code="payment.amountpaid.label" default="Amountpaid" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amountpaid" value="${fieldValue(bean: paymentInstance, field: 'amountpaid')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="payment.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${paymentInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'invoice', 'error')} required">
	<label for="invoice">
		<g:message code="payment.invoice.label" default="Invoice" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="invoice" name="invoice.id" from="${com.itech.revenue.Invoice.list()}" optionKey="id" required="" value="${paymentInstance?.invoice?.id}" class="many-to-one"/>
</div>

