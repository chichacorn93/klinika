<%@ page import="com.itech.membership.Doctor"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'doctor.label', default: 'Doctor')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Doctor Profile <small> Create</small>
				</h1>
			</div>
			<div id="create-doctor" class="content scaffold-create" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>


				<g:hasErrors bean="${doctorInstance}">
					<div class="alert alert-danger  alert-dismissable" >
					 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
<%--						<ul class="errors" role="alert">--%>
							<g:eachError bean="${doctorInstance}" var="error">
<%--									<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>--%>
									<g:message error="${error}" />
								<br>
							</g:eachError>
							
<%--						</ul>--%>
					</div>
				</g:hasErrors>
				<g:form action="save" class="form-horizontal">
					<fieldset class="form" style="padding-left: 300px">
						<g:render template="form" />
					</fieldset>
					<fieldset class="buttons">
						<g:submitButton name="create" class="btn btn-success"
							value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</fieldset>
				</g:form>
			</div>
		</div>
	</div>
	<r:script>$(".alert").alert('close')
</r:script>
	
</body>
</html>

