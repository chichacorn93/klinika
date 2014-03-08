
<%@ page import="com.itech.revenue.Payment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-payment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-payment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list payment">
			
				<g:if test="${paymentInstance?.amountpaid}">
				<li class="fieldcontain">
					<span id="amountpaid-label" class="property-label"><g:message code="payment.amountpaid.label" default="Amountpaid" /></span>
					
						<span class="property-value" aria-labelledby="amountpaid-label"><g:fieldValue bean="${paymentInstance}" field="amountpaid"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${paymentInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="payment.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${paymentInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${paymentInstance?.invoice}">
				<li class="fieldcontain">
					<span id="invoice-label" class="property-label"><g:message code="payment.invoice.label" default="Invoice" /></span>
					
						<span class="property-value" aria-labelledby="invoice-label"><g:link controller="invoice" action="show" id="${paymentInstance?.invoice?.id}">${paymentInstance?.invoice?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${paymentInstance?.id}" />
					<g:link class="edit" action="edit" id="${paymentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
