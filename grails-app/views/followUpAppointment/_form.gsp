<%@ page import="com.itech.schedule.FollowUpAppointment" %>

<div class="control-group ${hasErrors(bean: followUpAppointmentInstance, field: 'appointmentDate', 'error')} required">
	<label class="control-label"  for="appointmentDate">
		<g:message code="followUpAppointment.appointmentDate.label" default="Appointment Date" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:datePicker name="appointmentDate" precision="minute"  value="${followUpAppointmentInstance?.appointmentDate}"  />
</div></div>

<div class="control-group ${hasErrors(bean: followUpAppointmentInstance, field: 'description', 'error')} required">
	<label class="control-label"  for="description">
		<g:message code="followUpAppointment.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:textField name="description" required="" value="${followUpAppointmentInstance?.description}"/>
</div></div>

<div class="control-group ${hasErrors(bean: followUpAppointmentInstance, field: 'doctor', 'error')} required">
	<label class="control-label"  for="doctor">
		<g:message code="followUpAppointment.doctor.label" default="Doctor" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:select id="doctor" name="doctor.id" from="${com.itech.membership.Doctor.list()}" optionKey="id" required="" value="${followUpAppointmentInstance?.doctor?.id}" class="many-to-one"/>
</div></div>

<div class="control-group ${hasErrors(bean: followUpAppointmentInstance, field: 'patient', 'error')} required">
	<label class="control-label"  for="patient">
		<g:message code="followUpAppointment.patient.label" default="Patient" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:select id="patient" name="patient.id" from="${com.itech.patient.Patient.list()}" optionKey="id" required="" value="${followUpAppointmentInstance?.patient?.id}" class="many-to-one"/>
</div></div>


