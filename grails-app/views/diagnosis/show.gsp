
<%@ page import="com.itech.patient.Diagnosis"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'diagnosis.label', default: 'Diagnosis')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Details<small> ${diagnosisInstance}</small>
				</h1>
			</div>
			<div id="show-diagnosis" class="content scaffold-show" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<ol class="property-list diagnosis">

					<g:if test="${diagnosisInstance?.details}">
						<li class="fieldcontain"><span id="details-label"
							class="property-label"><g:message
									code="diagnosis.details.label" default="Details" /></span> <span
							class="property-value" aria-labelledby="details-label"><g:fieldValue
									bean="${diagnosisInstance}" field="details" /></span></li>
					</g:if>

					<g:if test="${diagnosisInstance?.doctor}">
						<li class="fieldcontain"><span id="doctor-label"
							class="property-label"><g:message
									code="diagnosis.doctor.label" default="Doctor" /></span> <span
							class="property-value" aria-labelledby="doctor-label"><g:link
									controller="doctor" action="show"
									id="${diagnosisInstance?.doctor?.id}">
									${diagnosisInstance?.doctor?.encodeAsHTML()}
								</g:link></span></li>
					</g:if>

					<g:if test="${diagnosisInstance?.date}">
						<li class="fieldcontain"><span id="date-label"
							class="property-label"><g:message
									code="diagnosis.date.label" default="Date" /></span> <span
							class="property-value" aria-labelledby="date-label"><g:formatDate
									date="${diagnosisInstance?.date}" /></span></li>
					</g:if>

					<g:if test="${diagnosisInstance?.patient}">
						<li class="fieldcontain"><span id="patient-label"
							class="property-label"><g:message
									code="diagnosis.patient.label" default="Patient" /></span> <span
							class="property-value" aria-labelledby="patient-label"><g:link
									controller="patient" action="show"
									id="${diagnosisInstance?.patient?.id}">
									${diagnosisInstance?.patient?.encodeAsHTML()}
								</g:link></span></li>
					</g:if>

				</ol>
				<g:form>
					<fieldset class="buttons">
						<g:hiddenField name="id" value="${diagnosisInstance?.id}" />
						<g:link class="edit" action="edit" id="${diagnosisInstance?.id}">
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<g:actionSubmit class="delete" action="delete"
							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</div>
		</div>
	</div>
</body>
</html>
