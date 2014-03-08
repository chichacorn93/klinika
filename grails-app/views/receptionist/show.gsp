
<%@ page import="com.itech.membership.Receptionist"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'receptionist.label', default: 'Receptionist')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Receptionist Profile <small> Create</small>
				</h1>
			</div>
			<div id="show-receptionist" class="content scaffold-show" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<ol class="property-list receptionist">

					<g:if test="${receptionistInstance?.firstName}">
						<li class="fieldcontain"><span id="firstName-label"
							class="property-label"><g:message
									code="receptionist.firstName.label" default="First Name" /></span> <span
							class="property-value" aria-labelledby="firstName-label"><g:fieldValue
									bean="${receptionistInstance}" field="firstName" /></span></li>
					</g:if>

					<g:if test="${receptionistInstance?.middleName}">
						<li class="fieldcontain"><span id="middleName-label"
							class="property-label"><g:message
									code="receptionist.middleName.label" default="Middle Name" /></span>

							<span class="property-value" aria-labelledby="middleName-label"><g:fieldValue
									bean="${receptionistInstance}" field="middleName" /></span></li>
					</g:if>

					<g:if test="${receptionistInstance?.lastName}">
						<li class="fieldcontain"><span id="lastName-label"
							class="property-label"><g:message
									code="receptionist.lastName.label" default="Last Name" /></span> <span
							class="property-value" aria-labelledby="lastName-label"><g:fieldValue
									bean="${receptionistInstance}" field="lastName" /></span></li>
					</g:if>

					<g:if test="${receptionistInstance?.address}">
						<li class="fieldcontain"><span id="address-label"
							class="property-label"><g:message
									code="receptionist.address.label" default="Address" /></span> <span
							class="property-value" aria-labelledby="address-label"><g:fieldValue
									bean="${receptionistInstance}" field="address" /></span></li>
					</g:if>

					<g:if test="${receptionistInstance?.email}">
						<li class="fieldcontain"><span id="email-label"
							class="property-label"><g:message
									code="receptionist.email.label" default="Email" /></span> <span
							class="property-value" aria-labelledby="email-label"><g:fieldValue
									bean="${receptionistInstance}" field="email" /></span></li>
					</g:if>

					<g:if test="${receptionistInstance?.mobileNum}">
						<li class="fieldcontain"><span id="mobileNum-label"
							class="property-label"><g:message
									code="receptionist.mobileNum.label" default="Mobile Num" /></span> <span
							class="property-value" aria-labelledby="mobileNum-label"><g:fieldValue
									bean="${receptionistInstance}" field="mobileNum" /></span></li>
					</g:if>

					<g:if test="${receptionistInstance?.telNum}">
						<li class="fieldcontain"><span id="telNum-label"
							class="property-label"><g:message
									code="receptionist.telNum.label" default="Tel Num" /></span> <span
							class="property-value" aria-labelledby="telNum-label"><g:fieldValue
									bean="${receptionistInstance}" field="telNum" /></span></li>
					</g:if>

					<g:if test="${receptionistInstance?.registrationDate}">
						<li class="fieldcontain"><span id="registrationDate-label"
							class="property-label"><g:message
									code="receptionist.registrationDate.label"
									default="Registration Date" /></span> <span class="property-value"
							aria-labelledby="registrationDate-label"><g:formatDate
									date="${receptionistInstance?.registrationDate}" /></span></li>
					</g:if>

					<g:if test="${receptionistInstance?.secQuestion}">
						<li class="fieldcontain"><span id="secQuestion-label"
							class="property-label"><g:message
									code="receptionist.secQuestion.label" default="Sec Question" /></span>

							<span class="property-value" aria-labelledby="secQuestion-label"><g:fieldValue
									bean="${receptionistInstance}" field="secQuestion" /></span></li>
					</g:if>

					<g:if test="${receptionistInstance?.secAnswer}">
						<li class="fieldcontain"><span id="secAnswer-label"
							class="property-label"><g:message
									code="receptionist.secAnswer.label" default="Sec Answer" /></span> <span
							class="property-value" aria-labelledby="secAnswer-label"><g:fieldValue
									bean="${receptionistInstance}" field="secAnswer" /></span></li>
					</g:if>

					<g:if test="${receptionistInstance?.username}">
						<li class="fieldcontain"><span id="username-label"
							class="property-label"><g:message
									code="receptionist.username.label" default="Username" /></span> <span
							class="property-value" aria-labelledby="username-label"><g:fieldValue
									bean="${receptionistInstance}" field="username" /></span></li>
					</g:if>

					<g:if test="${receptionistInstance?.password}">
						<li class="fieldcontain"><span id="password-label"
							class="property-label"><g:message
									code="receptionist.password.label" default="Password" /></span> <span
							class="property-value" aria-labelledby="password-label"><g:fieldValue
									bean="${receptionistInstance}" field="password" /></span></li>
					</g:if>

					<g:if test="${receptionistInstance?.accountExpired}">
						<li class="fieldcontain"><span id="accountExpired-label"
							class="property-label"><g:message
									code="receptionist.accountExpired.label"
									default="Account Expired" /></span> <span class="property-value"
							aria-labelledby="accountExpired-label"><g:formatBoolean
									boolean="${receptionistInstance?.accountExpired}" /></span></li>
					</g:if>

					<g:if test="${receptionistInstance?.accountLocked}">
						<li class="fieldcontain"><span id="accountLocked-label"
							class="property-label"><g:message
									code="receptionist.accountLocked.label"
									default="Account Locked" /></span> <span class="property-value"
							aria-labelledby="accountLocked-label"><g:formatBoolean
									boolean="${receptionistInstance?.accountLocked}" /></span></li>
					</g:if>

					<g:if test="${receptionistInstance?.doctors}">
						<li class="fieldcontain"><span id="doctors-label"
							class="property-label"><g:message
									code="receptionist.doctors.label" default="Doctors" /></span> <g:each
								in="${receptionistInstance.doctors}" var="d">
								<span class="property-value" aria-labelledby="doctors-label"><g:link
										controller="doctor" action="show" id="${d.id}">
										${d?.encodeAsHTML()}
									</g:link></span>
							</g:each></li>
					</g:if>

					<g:if test="${receptionistInstance?.enabled}">
						<li class="fieldcontain"><span id="enabled-label"
							class="property-label"><g:message
									code="receptionist.enabled.label" default="Enabled" /></span> <span
							class="property-value" aria-labelledby="enabled-label"><g:formatBoolean
									boolean="${receptionistInstance?.enabled}" /></span></li>
					</g:if>

					<g:if test="${receptionistInstance?.isDeleted}">
						<li class="fieldcontain"><span id="isDeleted-label"
							class="property-label"><g:message
									code="receptionist.isDeleted.label" default="Is Deleted" /></span> <span
							class="property-value" aria-labelledby="isDeleted-label"><g:formatBoolean
									boolean="${receptionistInstance?.isDeleted}" /></span></li>
					</g:if>

					<g:if test="${receptionistInstance?.passwordExpired}">
						<li class="fieldcontain"><span id="passwordExpired-label"
							class="property-label"><g:message
									code="receptionist.passwordExpired.label"
									default="Password Expired" /></span> <span class="property-value"
							aria-labelledby="passwordExpired-label"><g:formatBoolean
									boolean="${receptionistInstance?.passwordExpired}" /></span></li>
					</g:if>

				</ol>
				<g:form>
					<fieldset class="buttons">
						<g:hiddenField name="id" value="${receptionistInstance?.id}" />
						<g:link class="edit" action="edit"
							id="${receptionistInstance?.id}">
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
