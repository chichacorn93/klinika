
<%@ page import="com.itech.patient.Prescription" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prescription.label', default: 'Prescription')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-prescription" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-prescription" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list prescription">
			
				<g:if test="${prescriptionInstance?.clinicAddress}">
				<li class="fieldcontain">
					<span id="clinicAddress-label" class="property-label"><g:message code="prescription.clinicAddress.label" default="Clinic Address" /></span>
					
						<span class="property-value" aria-labelledby="clinicAddress-label"><g:fieldValue bean="${prescriptionInstance}" field="clinicAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prescriptionInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="prescription.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${prescriptionInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prescriptionInstance?.clinicName}">
				<li class="fieldcontain">
					<span id="clinicName-label" class="property-label"><g:message code="prescription.clinicName.label" default="Clinic Name" /></span>
					
						<span class="property-value" aria-labelledby="clinicName-label"><g:fieldValue bean="${prescriptionInstance}" field="clinicName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prescriptionInstance?.clinicMobileNumber}">
				<li class="fieldcontain">
					<span id="clinicMobileNumber-label" class="property-label"><g:message code="prescription.clinicMobileNumber.label" default="Clinic Mobile Number" /></span>
					
						<span class="property-value" aria-labelledby="clinicMobileNumber-label"><g:fieldValue bean="${prescriptionInstance}" field="clinicMobileNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prescriptionInstance?.clinicTelNumber}">
				<li class="fieldcontain">
					<span id="clinicTelNumber-label" class="property-label"><g:message code="prescription.clinicTelNumber.label" default="Clinic Tel Number" /></span>
					
						<span class="property-value" aria-labelledby="clinicTelNumber-label"><g:fieldValue bean="${prescriptionInstance}" field="clinicTelNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prescriptionInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="prescription.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${prescriptionInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${prescriptionInstance?.doctor}">
				<li class="fieldcontain">
					<span id="doctor-label" class="property-label"><g:message code="prescription.doctor.label" default="Doctor" /></span>
					
						<span class="property-value" aria-labelledby="doctor-label"><g:link controller="doctor" action="show" id="${prescriptionInstance?.doctor?.id}">${prescriptionInstance?.doctor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${prescriptionInstance?.patient}">
				<li class="fieldcontain">
					<span id="patient-label" class="property-label"><g:message code="prescription.patient.label" default="Patient" /></span>
					
						<span class="property-value" aria-labelledby="patient-label"><g:link controller="patient" action="show" id="${prescriptionInstance?.patient?.id}">${prescriptionInstance?.patient?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${prescriptionInstance?.id}" />
					<g:link class="edit" action="edit" id="${prescriptionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
