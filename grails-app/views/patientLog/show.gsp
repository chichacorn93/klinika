
<%@ page import="com.itech.patient.PatientLog" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'patientLog.label', default: 'PatientLog')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-patientLog" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-patientLog" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list patientLog">
			
				<g:if test="${patientLogInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="patientLog.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${patientLogInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientLogInstance?.patient}">
				<li class="fieldcontain">
					<span id="patient-label" class="property-label"><g:message code="patientLog.patient.label" default="Patient" /></span>
					
						<span class="property-value" aria-labelledby="patient-label"><g:link controller="patient" action="show" id="${patientLogInstance?.patient?.id}">${patientLogInstance?.patient?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientLogInstance?.patientAction}">
				<li class="fieldcontain">
					<span id="patientAction-label" class="property-label"><g:message code="patientLog.patientAction.label" default="Patient Action" /></span>
					
						<span class="property-value" aria-labelledby="patientAction-label"><g:fieldValue bean="${patientLogInstance}" field="patientAction"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${patientLogInstance?.id}" />
					<g:link class="edit" action="edit" id="${patientLogInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
