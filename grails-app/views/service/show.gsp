
<%@ page import="com.itech.revenue.Service" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'service.label', default: 'Service')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-service" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-service" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list service">
			
				<g:if test="${serviceInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="service.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${serviceInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInstance?.serviceCharge}">
				<li class="fieldcontain">
					<span id="serviceCharge-label" class="property-label"><g:message code="service.serviceCharge.label" default="Service Charge" /></span>
					
						<span class="property-value" aria-labelledby="serviceCharge-label"><g:fieldValue bean="${serviceInstance}" field="serviceCharge"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInstance?.serviceInvoice}">
				<li class="fieldcontain">
					<span id="serviceInvoice-label" class="property-label"><g:message code="service.serviceInvoice.label" default="Service Invoice" /></span>
					
						<span class="property-value" aria-labelledby="serviceInvoice-label"><g:link controller="serviceInvoice" action="show" id="${serviceInstance?.serviceInvoice?.id}">${serviceInstance?.serviceInvoice?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${serviceInstance?.id}" />
					<g:link class="edit" action="edit" id="${serviceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
