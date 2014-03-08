
<%@ page import="com.itech.patient.MedicalHistory"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'medicalHistory.label', default: 'MedicalHistory')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Details<small> </small>
				</h1>
			</div>
			<div id="show-medicalHistory" class="content scaffold-show" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<ol class="property-list medicalHistory">

					<g:if test="${medicalHistoryInstance?.pastIllness}">
						<li class="fieldcontain"><span id="pastIllness-label"
							class="property-label"><g:message
									code="medicalHistory.pastIllness.label" default="Past Illness" /></span>

							<span class="property-value" aria-labelledby="pastIllness-label"><g:fieldValue
									bean="${medicalHistoryInstance}" field="pastIllness" /></span></li>
					</g:if>

					<g:if test="${medicalHistoryInstance?.pastMedications}">
						<li class="fieldcontain"><span id="pastMedications-label"
							class="property-label"><g:message
									code="medicalHistory.pastMedications.label"
									default="Past Medications" /></span> <span class="property-value"
							aria-labelledby="pastMedications-label"><g:fieldValue
									bean="${medicalHistoryInstance}" field="pastMedications" /></span></li>
					</g:if>

					<g:if test="${medicalHistoryInstance?.patient}">
						<li class="fieldcontain"><span id="patient-label"
							class="property-label"><g:message
									code="medicalHistory.patient.label" default="Patient" /></span> <span
							class="property-value" aria-labelledby="patient-label"><g:link
									controller="patient" action="show"
									id="${medicalHistoryInstance?.patient?.id}">
									${medicalHistoryInstance?.patient?.encodeAsHTML()}
								</g:link></span></li>
					</g:if>

				</ol>
				<g:form>
					<fieldset class="buttons">
						<g:hiddenField name="id" value="${medicalHistoryInstance?.id}" />
						<g:link class="edit" action="edit"
							id="${medicalHistoryInstance?.id}">
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
