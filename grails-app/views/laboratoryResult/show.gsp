
<%@ page import="com.itech.patient.LaboratoryResult" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'laboratoryResult.label', default: 'LaboratoryResult')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-laboratoryResult" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-laboratoryResult" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list laboratoryResult">
			
				<g:if test="${laboratoryResultInstance?.details}">
				<li class="fieldcontain">
					<span id="details-label" class="property-label"><g:message code="laboratoryResult.details.label" default="Details" /></span>
					
						<span class="property-value" aria-labelledby="details-label"><g:fieldValue bean="${laboratoryResultInstance}" field="details"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${laboratoryResultInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="laboratoryResult.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${laboratoryResultInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${laboratoryResultInstance?.patient}">
				<li class="fieldcontain">
					<span id="patient-label" class="property-label"><g:message code="laboratoryResult.patient.label" default="Patient" /></span>
					
						<span class="property-value" aria-labelledby="patient-label"><g:link controller="patient" action="show" id="${laboratoryResultInstance?.patient?.id}">${laboratoryResultInstance?.patient?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${laboratoryResultInstance?.id}" />
					<g:link class="edit" action="edit" id="${laboratoryResultInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
