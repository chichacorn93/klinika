<%@ page import="com.itech.membership.Receptionist"%>



<div
	class="control-group ${hasErrors(bean: receptionistInstance, field: 'firstName', 'error')} required">
	<label class="control-label" class="control-label" for="firstName">
		<g:message code="receptionist.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="firstName"
			pattern="${receptionistInstance.constraints.firstName.matches}"
			required="" value="${receptionistInstance?.firstName}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: receptionistInstance, field: 'middleName', 'error')} required">
	<label class="control-label" class="control-label" for="middleName">
		<g:message code="receptionist.middleName.label" default="Middle Name" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="middleName"
			pattern="${receptionistInstance.constraints.middleName.matches}"
			required="" value="${receptionistInstance?.middleName}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: receptionistInstance, field: 'lastName', 'error')} required">
	<label class="control-label" for="lastName"> <g:message
			code="receptionist.lastName.label" default="Last Name" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="lastName"
			pattern="${receptionistInstance.constraints.lastName.matches}"
			required="" value="${receptionistInstance?.lastName}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: receptionistInstance, field: 'address', 'error')} required">
	<label class="control-label" for="address"> <g:message
			code="receptionist.address.label" default="Address" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="address" required=""
			value="${receptionistInstance?.address}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: receptionistInstance, field: 'email', 'error')} ">
	<label class="control-label" for="email"> <g:message
			code="receptionist.email.label" default="Email" />
	</label>
	<div class="controls">
		<g:field type="email" name="email"
			value="${receptionistInstance?.email}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: receptionistInstance, field: 'mobileNum', 'error')} ">
	<label class="control-label" for="mobileNum"> <g:message
			code="receptionist.mobileNum.label" default="Mobile Num" />

	</label>
	<div class="controls">
		<g:textField name="mobileNum"
			pattern="${receptionistInstance.constraints.mobileNum.matches}"
			value="${receptionistInstance?.mobileNum}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: receptionistInstance, field: 'telNum', 'error')} ">
	<label class="control-label" for="telNum"> <g:message
			code="receptionist.telNum.label" default="Tel Num" />

	</label>
	<div class="controls">
		<g:textField name="telNum"
			pattern="${receptionistInstance.constraints.telNum.matches}"
			value="${receptionistInstance?.telNum}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: receptionistInstance, field: 'registrationDate', 'error')} required">
	<label class="control-label" for="registrationDate"> <g:message
			code="receptionist.registrationDate.label"
			default="Registration Date" /> <span class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:datePicker name="registrationDate" precision="day"
			value="${receptionistInstance?.registrationDate}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: receptionistInstance, field: 'secQuestion', 'error')} required">
	<label class="control-label" for="secQuestion"> <g:message
			code="receptionist.secQuestion.label" default="Sec Question" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:select name="secQuestion"
			from="${enums.SecurityQuestion?.values()}"
			keys="${enums.SecurityQuestion.values()*.name()}" required=""
			value="${receptionistInstance?.secQuestion?.name()}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: receptionistInstance, field: 'secAnswer', 'error')} required">
	<label class="control-label" for="secAnswer"> <g:message
			code="receptionist.secAnswer.label" default="Sec Answer" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="secAnswer" required=""
			value="${receptionistInstance?.secAnswer}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: receptionistInstance, field: 'username', 'error')} required">
	<label class="control-label" for="username"> <g:message
			code="receptionist.username.label" default="Username" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="username" required=""
			value="${receptionistInstance?.username}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: receptionistInstance, field: 'password', 'error')} required">
	<label class="control-label" for="password"> <g:message
			code="receptionist.password.label" default="Password" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="password" required=""
			value="${receptionistInstance?.password}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: receptionistInstance, field: 'accountExpired', 'error')} ">
	<label class="control-label" for="accountExpired"> <g:message
			code="receptionist.accountExpired.label" default="Account Expired" />

	</label>
	<div class="controls">
		<g:checkBox name="accountExpired"
			value="${receptionistInstance?.accountExpired}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: receptionistInstance, field: 'accountLocked', 'error')} ">
	<label class="control-label" for="accountLocked"> <g:message
			code="receptionist.accountLocked.label" default="Account Locked" />

	</label>
	<div class="controls">
		<g:checkBox name="accountLocked"
			value="${receptionistInstance?.accountLocked}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: receptionistInstance, field: 'doctors', 'error')} ">
	<label class="control-label" for="doctors"> <g:message
			code="receptionist.doctors.label" default="Doctors" />
	</label>

</div>

<div
	class="control-group ${hasErrors(bean: receptionistInstance, field: 'enabled', 'error')} ">
	<label class="control-label" for="enabled"> <g:message
			code="receptionist.enabled.label" default="Enabled" />

	</label>
	<div class="controls">
		<g:checkBox name="enabled" value="${receptionistInstance?.enabled}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: receptionistInstance, field: 'isDeleted', 'error')} ">
	<label class="control-label" for="isDeleted"> <g:message
			code="receptionist.isDeleted.label" default="Is Deleted" />

	</label>
	<div class="controls">
		<g:checkBox name="isDeleted"
			value="${receptionistInstance?.isDeleted}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: receptionistInstance, field: 'passwordExpired', 'error')} ">
	<label class="control-label" for="passwordExpired"> <g:message
			code="receptionist.passwordExpired.label" default="Password Expired" />

	</label>
	<div class="controls">
		<g:checkBox name="passwordExpired"
			value="${receptionistInstance?.passwordExpired}" />
	</div>
</div>

