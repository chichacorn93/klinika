<%@ page import="com.itech.revenue.Service" %>



<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="service.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${serviceInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'serviceCharge', 'error')} required">
	<label for="serviceCharge">
		<g:message code="service.serviceCharge.label" default="Service Charge" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="serviceCharge" value="${fieldValue(bean: serviceInstance, field: 'serviceCharge')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'serviceInvoice', 'error')} required">
	<label for="serviceInvoice">
		<g:message code="service.serviceInvoice.label" default="Service Invoice" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="serviceInvoice" name="serviceInvoice.id" from="${com.itech.revenue.ServiceInvoice.list()}" optionKey="id" required="" value="${serviceInstance?.serviceInvoice?.id}" class="many-to-one"/>
</div>

