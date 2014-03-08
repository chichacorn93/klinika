
<%@ page import="com.itech.schedule.FollowUpAppointment"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'followUpAppointment.label', default: 'FollowUpAppointment')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Details<small>follow-up</small>
				</h1>
			</div>
			<div id="show-followUpAppointment" class="content scaffold-show"
				role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<ol class="property-list followUpAppointment">

					<g:if test="${followUpAppointmentInstance?.appointmentDate}">
						<li class="fieldcontain"><span id="appointmentDate-label"
							class="property-label"><g:message
									code="followUpAppointment.appointmentDate.label"
									default="Appointment Date" /></span> <span class="property-value"
							aria-labelledby="appointmentDate-label"><g:formatDate
									date="${followUpAppointmentInstance?.appointmentDate}" /></span></li>
					</g:if>

					<g:if test="${followUpAppointmentInstance?.description}">
						<li class="fieldcontain"><span id="description-label"
							class="property-label"><g:message
									code="followUpAppointment.description.label"
									default="Description" /></span> <span class="property-value"
							aria-labelledby="description-label"><g:fieldValue
									bean="${followUpAppointmentInstance}" field="description" /></span></li>
					</g:if>

					<g:if test="${followUpAppointmentInstance?.doctor}">
						<li class="fieldcontain"><span id="doctor-label"
							class="property-label"><g:message
									code="followUpAppointment.doctor.label" default="Doctor" /></span> <span
							class="property-value" aria-labelledby="doctor-label"><g:link
									controller="doctor" action="show"
									id="${followUpAppointmentInstance?.doctor?.id}">
									${followUpAppointmentInstance?.doctor?.encodeAsHTML()}
								</g:link></span></li>
					</g:if>

					<g:if test="${followUpAppointmentInstance?.patient}">
						<li class="fieldcontain"><span id="patient-label"
							class="property-label"><g:message
									code="followUpAppointment.patient.label" default="Patient" /></span>

							<span class="property-value" aria-labelledby="patient-label"><g:link
									controller="patient" action="show"
									id="${followUpAppointmentInstance?.patient?.id}">
									${followUpAppointmentInstance?.patient?.encodeAsHTML()}
								</g:link></span></li>
					</g:if>

				</ol>
				<g:form>
					<fieldset class="buttons">
						<g:hiddenField name="id"
							value="${followUpAppointmentInstance?.id}" />
						<g:link class="edit" action="edit"
							id="${followUpAppointmentInstance?.id}">
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
