<%@ page import="com.itech.revenue.Revenue" %>



<div class="fieldcontain ${hasErrors(bean: revenueInstance, field: 'totalRevenue', 'error')} required">
	<label for="totalRevenue">
		<g:message code="revenue.totalRevenue.label" default="Total Revenue" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalRevenue" value="${fieldValue(bean: revenueInstance, field: 'totalRevenue')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: revenueInstance, field: 'invoices', 'error')} ">
	<label for="invoices">
		<g:message code="revenue.invoices.label" default="Invoices" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${revenueInstance?.invoices?}" var="i">
    <li><g:link controller="invoice" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="invoice" action="create" params="['revenue.id': revenueInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'invoice.label', default: 'Invoice')])}</g:link>
</li>
</ul>

</div>

