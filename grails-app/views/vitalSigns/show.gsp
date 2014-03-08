
<%@ page import="com.itech.patient.VitalSigns" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vitalSigns.label', default: 'VitalSigns')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-vitalSigns" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-vitalSigns" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list vitalSigns">
			
				<g:if test="${vitalSignsInstance?.bloodPressure}">
				<li class="fieldcontain">
					<span id="bloodPressure-label" class="property-label"><g:message code="vitalSigns.bloodPressure.label" default="Blood Pressure" /></span>
					
						<span class="property-value" aria-labelledby="bloodPressure-label"><g:fieldValue bean="${vitalSignsInstance}" field="bloodPressure"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vitalSignsInstance?.pulseRate}">
				<li class="fieldcontain">
					<span id="pulseRate-label" class="property-label"><g:message code="vitalSigns.pulseRate.label" default="Pulse Rate" /></span>
					
						<span class="property-value" aria-labelledby="pulseRate-label"><g:fieldValue bean="${vitalSignsInstance}" field="pulseRate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vitalSignsInstance?.height}">
				<li class="fieldcontain">
					<span id="height-label" class="property-label"><g:message code="vitalSigns.height.label" default="Height" /></span>
					
						<span class="property-value" aria-labelledby="height-label"><g:fieldValue bean="${vitalSignsInstance}" field="height"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vitalSignsInstance?.weight}">
				<li class="fieldcontain">
					<span id="weight-label" class="property-label"><g:message code="vitalSigns.weight.label" default="Weight" /></span>
					
						<span class="property-value" aria-labelledby="weight-label"><g:fieldValue bean="${vitalSignsInstance}" field="weight"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vitalSignsInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="vitalSigns.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${vitalSignsInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vitalSignsInstance?.lastMenstruationPeriod}">
				<li class="fieldcontain">
					<span id="lastMenstruationPeriod-label" class="property-label"><g:message code="vitalSigns.lastMenstruationPeriod.label" default="Last Menstruation Period" /></span>
					
						<span class="property-value" aria-labelledby="lastMenstruationPeriod-label"><g:formatDate date="${vitalSignsInstance?.lastMenstruationPeriod}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vitalSignsInstance?.patient}">
				<li class="fieldcontain">
					<span id="patient-label" class="property-label"><g:message code="vitalSigns.patient.label" default="Patient" /></span>
					
						<span class="property-value" aria-labelledby="patient-label"><g:link controller="patient" action="show" id="${vitalSignsInstance?.patient?.id}">${vitalSignsInstance?.patient?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${vitalSignsInstance?.id}" />
					<g:link class="edit" action="edit" id="${vitalSignsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
