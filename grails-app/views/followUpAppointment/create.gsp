<%@ page import="com.itech.schedule.FollowUpAppointment"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'followUpAppointment.label', default: 'FollowUpAppointment')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Follow-up <small> Create</small>
				</h1>
			</div>
			<div id="create-followUpAppointment" class="content scaffold-create"
				role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<g:hasErrors bean="${followUpAppointmentInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${followUpAppointmentInstance}" var="error">
							<li
								<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
									error="${error}" /></li>
						</g:eachError>
					</ul>
				</g:hasErrors>
				<g:form action="save" class="form-horizontal">
					<fieldset class="form" style="padding-left: 300px">
						<g:render template="form" />
					</fieldset>
					<fieldset class="buttons">
						<g:submitButton name="create" class="save"
							value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</fieldset>
				</g:form>
			</div>
		</div>
	</div>
</body>
</html>
