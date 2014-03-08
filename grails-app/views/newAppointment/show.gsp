
<%@ page import="com.itech.schedule.NewAppointment"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'newAppointment.label', default: 'NewAppointment')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Details<small> Apointment</small>
				</h1>
			</div>
			<div id="show-newAppointment" class="content scaffold-show"
				role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
						<g:if test="${flash.exist }">${flash.exist }</g:if>
					</div>
				</g:if>
				<ol class="property-list newAppointment">

					<g:if test="${newAppointmentInstance?.isAffirmed}">
						<li class="fieldcontain"><span id="isAffirmed-label"
							class="property-label"><g:message
									code="newAppointment.isAffirmed.label" default="Is Affirmed" /></span>

							<span class="property-value" aria-labelledby="isAffirmed-label"><g:formatBoolean
									boolean="${newAppointmentInstance?.isAffirmed}" /></span></li>
					</g:if>

					<g:if test="${newAppointmentInstance?.appointmentDate}">
						<li class="fieldcontain"><span id="appointmentDate-label"
							class="property-label"><g:message
									code="newAppointment.appointmentDate.label"
									default="Appointment Date" /></span> <span class="property-value"
							aria-labelledby="appointmentDate-label"><g:formatDate
									date="${newAppointmentInstance?.appointmentDate}" /></span></li>
					</g:if>

					<g:if test="${newAppointmentInstance?.firstName}">
						<li class="fieldcontain"><span id="firstName-label"
							class="property-label"><g:message
									code="newAppointment.firstName.label" default="First Name" /></span>

							<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue
									bean="${newAppointmentInstance}" field="firstName" /></span></li>
					</g:if>

					<g:if test="${newAppointmentInstance?.middleName}">
						<li class="fieldcontain"><span id="middleName-label"
							class="property-label"><g:message
									code="newAppointment.middleName.label" default="Middle Name" /></span>

							<span class="property-value" aria-labelledby="middleName-label"><g:fieldValue
									bean="${newAppointmentInstance}" field="middleName" /></span></li>
					</g:if>

					<g:if test="${newAppointmentInstance?.lastName}">
						<li class="fieldcontain"><span id="lastName-label"
							class="property-label"><g:message
									code="newAppointment.lastName.label" default="Last Name" /></span> <span
							class="property-value" aria-labelledby="lastName-label"><g:fieldValue
									bean="${newAppointmentInstance}" field="lastName" /></span></li>
					</g:if>

					<g:if test="${newAppointmentInstance?.description}">
						<li class="fieldcontain"><span id="description-label"
							class="property-label"><g:message
									code="newAppointment.description.label" default="Description" /></span>

							<span class="property-value" aria-labelledby="description-label"><g:fieldValue
									bean="${newAppointmentInstance}" field="description" /></span></li>
					</g:if>

					<g:if test="${newAppointmentInstance?.mobileNum}">
						<li class="fieldcontain"><span id="mobileNum-label"
							class="property-label"><g:message
									code="newAppointment.mobileNum.label" default="Mobile Num" /></span>

							<span class="property-value" aria-labelledby="mobileNum-label"><g:fieldValue
									bean="${newAppointmentInstance}" field="mobileNum" /></span></li>
					</g:if>

					<g:if test="${newAppointmentInstance?.doctor}">
						<li class="fieldcontain"><span id="doctor-label"
							class="property-label"><g:message
									code="newAppointment.doctor.label" default="Doctor" /></span> <span
							class="property-value" aria-labelledby="doctor-label"><g:link
									controller="doctor" action="show"
									id="${newAppointmentInstance?.doctor?.id}">
									${newAppointmentInstance?.doctor?.encodeAsHTML()}
								</g:link></span></li>
					</g:if>

				</ol>
				<g:form>
					<fieldset class="buttons">
						<g:hiddenField name="id" value="${newAppointmentInstance?.id}" />
						<g:link class="edit" action="edit"
							id="${newAppointmentInstance?.id}">
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<g:link class="btn " action='addToQueue'
							id="${newAppointmentInstance?.id}"
							onclick="return confirm('Are you sure?')">Add to Queue</g:link>
						<g:actionSubmit class="btn btn-warning" action="cancel"
							value="Cancel" onclick="return confirm('Are you sure?')" />
						<g:actionSubmit class="btn btn-info" action="affirm"
							value="Affirm" onclick="return confirm('Are you sure?')" />
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
