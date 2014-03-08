
<%@ page import="com.itech.queue.QueueElement"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'queueElement.label', default: 'QueueElement')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Details<small> QueueElement</small>
				</h1>
			</div>
			<div id="show-queueElement" class="content scaffold-show" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<ol class="property-list queueElement">

					<g:if test="${queueElementInstance?.date}">
						<li class="fieldcontain"><span id="date-label"
							class="property-label"><g:message
									code="queueElement.date.label" default="Date" /></span> <span
							class="property-value" aria-labelledby="date-label"><g:formatDate
									date="${queueElementInstance?.date}" /></span></li>
					</g:if>

					<g:if test="${queueElementInstance?.appointmentType}">
						<li class="fieldcontain"><span id="appointmentType-label"
							class="property-label"><g:message
									code="queueElement.appointmentType.label"
									default="Appointment Type" /></span> <span class="property-value"
							aria-labelledby="appointmentType-label"><g:fieldValue
									bean="${queueElementInstance}" field="appointmentType" /></span></li>
					</g:if>

					<g:if test="${queueElementInstance?.patient}">
						<li class="fieldcontain"><span id="patient-label"
							class="property-label"><g:message
									code="queueElement.patient.label" default="Patient" /></span> <span
							class="property-value" aria-labelledby="patient-label"><g:link
									controller="patient" action="show"
									id="${queueElementInstance?.patient?.id}">
									${queueElementInstance?.patient?.encodeAsHTML()}
								</g:link></span></li>
					</g:if>

					<g:if test="${queueElementInstance?.timeAdmitted}">
						<li class="fieldcontain"><span id="timeAdmitted-label"
							class="property-label"><g:message
									code="queueElement.timeAdmitted.label" default="Time Admitted" /></span>

							<span class="property-value" aria-labelledby="timeAdmitted-label"><g:fieldValue
									bean="${queueElementInstance}" field="timeAdmitted" /></span></li>
					</g:if>

					<g:if test="${queueElementInstance?.complaints}">
						<li class="fieldcontain"><span id="complaints-label"
							class="property-label"><g:message
									code="queueElement.complaints.label" default="Complaints" /></span> <span
							class="property-value" aria-labelledby="complaints-label"><g:fieldValue
									bean="${queueElementInstance}" field="complaints" /></span></li>
					</g:if>

					<g:if test="${queueElementInstance?.doctor}">
						<li class="fieldcontain"><span id="doctor-label"
							class="property-label"><g:message
									code="queueElement.doctor.label" default="Doctor" /></span> <span
							class="property-value" aria-labelledby="doctor-label"><g:link
									controller="doctor" action="show"
									id="${queueElementInstance?.doctor?.id}">
									${queueElementInstance?.doctor?.encodeAsHTML()}
								</g:link></span></li>
					</g:if>

					<g:if test="${queueElementInstance?.hasTransaction}">
						<li class="fieldcontain"><span id="hasTransaction-label"
							class="property-label"><g:message
									code="queueElement.hasTransaction.label"
									default="Has Transaction" /></span> <span class="property-value"
							aria-labelledby="hasTransaction-label"><g:formatBoolean
									boolean="${queueElementInstance?.hasTransaction}" /></span></li>
					</g:if>

					<g:if test="${queueElementInstance?.isDone}">
						<li class="fieldcontain"><span id="isDone-label"
							class="property-label"><g:message
									code="queueElement.isDone.label" default="Is Done" /></span> <span
							class="property-value" aria-labelledby="isDone-label"><g:formatBoolean
									boolean="${queueElementInstance?.isDone}" /></span></li>
					</g:if>

				</ol>
				<g:form>
					<fieldset class="buttons">
						<g:hiddenField name="id" value="${queueElementInstance?.id}" />
						<g:link class="edit" action="edit"
							id="${queueElementInstance?.id}">
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<g:actionSubmit class="btn" action="remove"
							value="Remove" onclick="return confirm('Are you sure?')" />
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
