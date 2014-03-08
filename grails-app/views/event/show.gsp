
<%@ page import="com.itech.schedule.Event"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'event.label', default: 'Event')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Event <small> Details</small>
				</h1>
			</div>
			<div id="show-event" class="content scaffold-show" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<ol class="property-list event">

					<g:if test="${eventInstance?.name}">
						<li class="fieldcontain"><span id="name-label"
							class="property-label"><g:message code="event.name.label"
									default="Name" /></span> <span class="property-value"
							aria-labelledby="name-label"><g:fieldValue
									bean="${eventInstance}" field="name" /></span></li>
					</g:if>

					<g:if test="${eventInstance?.location}">
						<li class="fieldcontain"><span id="location-label"
							class="property-label"><g:message
									code="event.location.label" default="Location" /></span> <span
							class="property-value" aria-labelledby="location-label"><g:fieldValue
									bean="${eventInstance}" field="location" /></span></li>
					</g:if>

					<g:if test="${eventInstance?.details}">
						<li class="fieldcontain"><span id="details-label"
							class="property-label"><g:message
									code="event.details.label" default="Details" /></span> <span
							class="property-value" aria-labelledby="details-label"><g:fieldValue
									bean="${eventInstance}" field="details" /></span></li>
					</g:if>

					<g:if test="${eventInstance?.doctor}">
						<li class="fieldcontain"><span id="doctor-label"
							class="property-label"><g:message
									code="event.doctor.label" default="Doctor" /></span> <span
							class="property-value" aria-labelledby="doctor-label"><g:link
									controller="doctor" action="show"
									id="${eventInstance?.doctor?.id}">
									${eventInstance?.doctor?.encodeAsHTML()}
								</g:link></span></li>
					</g:if>

					<g:if test="${eventInstance?.startDate}">
						<li class="fieldcontain"><span id="startDate-label"
							class="property-label"><g:message
									code="event.startDate.label" default="Start Date" /></span> <span
							class="property-value" aria-labelledby="startDate-label"><g:formatDate
									date="${eventInstance?.startDate}" /></span></li>
					</g:if>

					<g:if test="${eventInstance?.endDate}">
						<li class="fieldcontain"><span id="endDate-label"
							class="property-label"><g:message
									code="event.endDate.label" default="End Date" /></span> <span
							class="property-value" aria-labelledby="endDate-label"><g:formatDate
									date="${eventInstance?.endDate}" /></span></li>
					</g:if>

				</ol>
				<g:form>
					<fieldset class="buttons">
						<g:hiddenField name="id" value="${eventInstance?.id}" />
						<g:link class="edit" action="edit" id="${eventInstance?.id}">
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
