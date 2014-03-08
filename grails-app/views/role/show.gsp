
<%@ page import="com.itech.membership.Role"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'role.label', default: 'Role')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Role <small>Show</small>
				</h1>
			</div>
			<div id="show-role" class="content scaffold-show" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<ol class="property-list role">

					<g:if test="${roleInstance?.authority}">
						<li class="fieldcontain"><span id="authority-label"
							class="property-label"><g:message
									code="role.authority.label" default="Authority" /></span> <span
							class="property-value" aria-labelledby="authority-label"><g:fieldValue
									bean="${roleInstance}" field="authority" /></span></li>
					</g:if>

				</ol>
				<g:form>
					<fieldset class="buttons">
						<g:hiddenField name="id" value="${roleInstance?.id}" />
						<g:link class="edit" action="edit" id="${roleInstance?.id}">
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
