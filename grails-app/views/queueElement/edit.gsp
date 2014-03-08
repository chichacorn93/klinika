<%@ page import="com.itech.queue.QueueElement"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'queueElement.label', default: 'QueueElement')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Update <small> Queue</small>
				</h1>
			</div>
			<div id="edit-queueElement" class="content scaffold-edit" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<g:hasErrors bean="${queueElementInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${queueElementInstance}" var="error">
							<li
								<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
									error="${error}" /></li>
						</g:eachError>
					</ul>
				</g:hasErrors>
				<g:form method="post" class="form-horizontal">
					<g:hiddenField name="id" value="${queueElementInstance?.id}" />
					<g:hiddenField name="version"
						value="${queueElementInstance?.version}" />
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
