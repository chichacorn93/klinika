<%@ page import="com.itech.schedule.NewAppointment"%>



<%--<div--%>
<%--	class="control-group ${hasErrors(bean: newAppointmentInstance, field: 'isAffirmed', 'error')} ">--%>
<%--	<label class="control-label" for="isAffirmed"> <g:message--%>
<%--			code="newAppointment.isAffirmed.label" default="Is Affirmed" />--%>
<%----%>
<%--	</label>--%>
<%--	<div class="controls">--%>
<%--		<g:checkBox name="isAffirmed"--%>
<%--			value="${newAppointmentInstance?.isAffirmed}" />--%>
<%--	</div>--%>
<%--</div>--%>

<div
	class="control-group ${hasErrors(bean: newAppointmentInstance, field: 'appointmentDate', 'error')} required">
	<label class="control-label" for="appointmentDate"> <g:message
			code="newAppointment.appointmentDate.label"
			default="Appointment Date" /> <span class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:datePicker name="appointmentDate" precision="minute"
			value="${newAppointmentInstance?.appointmentDate}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: newAppointmentInstance, field: 'firstName', 'error')} required">
	<label class="control-label" for="firstName"> <g:message
			code="newAppointment.firstName.label" default="First Name" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="firstName" required=""
			value="${newAppointmentInstance?.firstName}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: newAppointmentInstance, field: 'middleName', 'error')} required">
	<label class="control-label" for="middleName"> <g:message
			code="newAppointment.middleName.label" default="Middle Name" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="middleName" required=""
			value="${newAppointmentInstance?.middleName}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: newAppointmentInstance, field: 'lastName', 'error')} required">
	<label class="control-label" for="lastName"> <g:message
			code="newAppointment.lastName.label" default="Last Name" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="lastName" required=""
			value="${newAppointmentInstance?.lastName}" />
	</div>
</div>

<div
	class="control-group  ${hasErrors(bean: newAppointmentInstance, field: 'description', 'error')} ">
	<label class="control-label" for="description"> <g:message
			code="newAppointment.description.label" default="Description" />

	</label>
	<div class="controls">
		<g:textField name="description"
			value="${newAppointmentInstance?.description}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: newAppointmentInstance, field: 'mobileNum', 'error')} required">
	<label class="control-label" for="mobileNum"> <g:message
			code="newAppointment.mobileNum.label" default="Mobile Num" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="mobileNum" required=""
			value="${newAppointmentInstance?.mobileNum}" />
	</div>
</div>


<div
	class="control-group ${hasErrors(bean: newAppointmentInstance, field: 'doctor', 'error')} required">
	<label class="control-label" for="doctor"> <g:message
			code="newAppointment.doctor.label" default="Doctor" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:select id="doctor" name="doctor.id"
			from="${com.itech.membership.Doctor.list()}" optionKey="id"
			required="" value="${newAppointmentInstance?.doctor?.id}"
			class="many-to-one" />
	</div>
</div>

