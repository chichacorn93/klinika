<%@ page import="com.itech.schedule.FollowUpAppointment"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'followUpAppointment.label', default: 'FollowUpAppointment')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Follow-up <small>Update</small>
				</h1>
			</div>
			<div id="edit-followUpAppointment" class="content scaffold-edit"
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
				<g:form method="post" class="form-horizontal">
					<g:hiddenField name="id" value="${followUpAppointmentInstance?.id}" />
					<g:hiddenField name="version"
						value="${followUpAppointmentInstance?.version}" />
					<fieldset class="form" style=padding-left:300px>
						<g:render template="form" />
					</fieldset>
					<fieldset class="buttons">
						<g:actionSubmit class="save" action="update"
							value="${message(code: 'default.button.update.label', default: 'Update')}" />
						<g:actionSubmit class="delete" action="delete"
							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
							formnovalidate=""
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</div>
		</div>
	</div>
</body>
</html>
