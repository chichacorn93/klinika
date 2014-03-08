<%@ page import="com.itech.membership.Doctor"%>



<div
	class="control-group ${hasErrors(bean: doctorInstance, field: 'firstName', 'error')} required">
	<label class="control-label" for="firstName"> <g:message
			code="doctor.firstName.label" default="First Name" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="firstName" required=""
			value="${doctorInstance?.firstName}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: doctorInstance, field: 'middleName', 'error')} required">
	<label class="control-label" for="middleName"> <g:message
			code="doctor.middleName.label" default="Middle Name" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="middleName" required=""
			value="${doctorInstance?.middleName}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: doctorInstance, field: 'lastName', 'error')} required">
	<label class="control-label" for="lastName"> <g:message
			code="doctor.lastName.label" default="Last Name" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="lastName" required=""
			value="${doctorInstance?.lastName}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: doctorInstance, field: 'address', 'error')} required">
	<label class="control-label" for="address"> <g:message
			code="doctor.address.label" default="Address" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="address" required=""
			value="${doctorInstance?.address}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: doctorInstance, field: 'email', 'error')} ">
	<label class="control-label" for="email"> <g:message
			code="doctor.email.label" default="Email" />

	</label>
	<div class="controls">
		<g:textField name="email" value="${doctorInstance?.email}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: doctorInstance, field: 'mobileNum', 'error')} ">
	<label class="control-label" for="mobileNum"> <g:message
			code="doctor.mobileNum.label" default="Mobile Num" />

	</label>
	<div class="controls">

		<g:textField name="mobileNum"
			pattern="${doctorInstance.constraints.mobileNum.matches}"
			value="${doctorInstance?.mobileNum}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: doctorInstance, field: 'telNum', 'error')} ">
	<label class="control-label" for="telNum"> <g:message
			code="doctor.telNum.label" default="Tel Num" />

	</label>
	<div class="controls">
		<g:textField name="telNum" value="${doctorInstance?.telNum}" />
	</div>
</div>

<%--<div class="fieldcontain ${hasErrors(bean: doctorInstance, field: 'registrationDate', 'error')} required">--%>
<%--	<label for="registrationDate">--%>
<%--		<g:message code="doctor.registrationDate.label" default="Registration Date" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label><div class="controls">--%>
<%--	<g:datePicker name="registrationDate" precision="day"  value="${doctorInstance?.registrationDate}"  />--%>
<%--</div>--%>

<div
	class="control-group ${hasErrors(bean: doctorInstance, field: 'secQuestion', 'error')} required">
	<label class="control-label" for="secQuestion"> <g:message
			code="doctor.secQuestion.label" default="Sec Question" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:select name="secQuestion"
			from="${enums.SecurityQuestion?.values()}"
			keys="${enums.SecurityQuestion.values()*.name()}" required=""
			value="${doctorInstance?.secQuestion?.name()}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: doctorInstance, field: 'secAnswer', 'error')} required">
	<label class="control-label" for="secAnswer"> <g:message
			code="doctor.secAnswer.label" default="Sec Answer" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="secAnswer" required=""
			value="${doctorInstance?.secAnswer}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: doctorInstance, field: 'username', 'error')} required">
	<label class="control-label" for="username"> <g:message
			code="doctor.username.label" default="Username" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="username" required=""
			value="${doctorInstance?.username}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: doctorInstance, field: 'password', 'error')} required">
	<label class="control-label" for="password"> <g:message
			code="doctor.password.label" default="Password" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:field type="password" name="password" required=""
			value="${doctorInstance?.password}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: doctorInstance, field: 'background', 'error')} required">
	<label class="control-label" for="background"> <g:message
			code="doctor.background.label" default="Background" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="background" required=""
			value="${doctorInstance?.background}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: doctorInstance, field: 'clinicHourStart', 'error')} required">
	<label class="control-label" for="clinicHourStart"> <g:message
			code="doctor.clinicHourStart.label" default="Clinic Hour Start" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="clinicHourStart" required=""
			value="${doctorInstance?.clinicHourStart}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: doctorInstance, field: 'clinicHourEnd', 'error')} required">
	<label class="control-label" for="clinicHourEnd"> <g:message
			code="doctor.clinicHourEnd.label" default="Clinic Hour End" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="clinicHourEnd" required=""
			value="${doctorInstance?.clinicHourEnd}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: doctorInstance, field: 'accountExpired', 'error')} ">
	<label class="control-label" for="accountExpired"> <g:message
			code="doctor.accountExpired.label" default="Account Expired" />

	</label>
	<div class="controls">
		<g:checkBox name="accountExpired"
			value="${doctorInstance?.accountExpired}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: doctorInstance, field: 'accountLocked', 'error')} ">
	<label class="control-label" for="accountLocked"> <g:message
			code="doctor.accountLocked.label" default="Account Locked" />

	</label>
	<div class="controls">
		<g:checkBox name="accountLocked"
			value="${doctorInstance?.accountLocked}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: doctorInstance, field: 'enabled', 'error')} ">
	<label class="control-label" for="enabled"> <g:message
			code="doctor.enabled.label" default="Enabled" />

	</label>
	<div class="controls">
		<g:checkBox name="enabled" value="${doctorInstance?.enabled}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: doctorInstance, field: 'isDeleted', 'error')} ">
	<label class="control-label" for="isDeleted"> <g:message
			code="doctor.isDeleted.label" default="Is Deleted" />

	</label>
	<div class="controls">
		<g:checkBox name="isDeleted" value="${doctorInstance?.isDeleted}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: doctorInstance, field: 'passwordExpired', 'error')} ">
	<label class="control-label" for="passwordExpired"> <g:message
			code="doctor.passwordExpired.label" default="Password Expired" />

	</label>
	<div class="controls">
		<g:checkBox name="passwordExpired"
			value="${doctorInstance?.passwordExpired}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: doctorInstance, field: 'isActive', 'error')} ">
	<label class="control-label" for="isActive"> <g:message
			code="doctor.isActive.label" default="Is Active" />

	</label>
	<div class="controls">
		<g:checkBox name="isActive" value="${doctorInstance?.isActive}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: doctorInstance, field: 'lastUpdate', 'error')} required">
	<label class="control-label" for="lastUpdate"> <g:message
			code="doctor.lastUpdate.label" default="Last Update" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:datePicker name="lastUpdate" precision="day"
			value="${doctorInstance?.lastUpdate}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: doctorInstance, field: 'patients', 'error')} ">
	<label class="control-label" for="patients"> <g:message
			code="doctor.patients.label" default="Patients" />

	</label>
	<div class="controls">
		<g:select name="patients" from="${com.itech.patient.Patient.list()}"
			multiple="multiple" optionKey="id" size="5"
			value="${doctorInstance?.patients*.id}" class="many-to-many" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: doctorInstance, field: 'receptionists', 'error')} ">
	<label class="control-label" for="receptionists"> <g:message
			code="doctor.receptionists.label" default="Receptionists" />

	</label>
	<div class="controls">
		<g:select name="receptionists"
			from="${com.itech.membership.Receptionist.list()}"
			multiple="multiple" optionKey="id" size="5"
			value="${doctorInstance?.receptionists*.id}" class="many-to-many" />
	</div>
</div>