<%@ page import="com.itech.queue.QueueElement" %>



<div class="control-group ${hasErrors(bean: queueElementInstance, field: 'date', 'error')} required">
	<label class="control-label" for="date">
		<g:message code="queueElement.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:datePicker name="date" precision="day"  value="${queueElementInstance?.date}"  />
</div></div>

<div class="control-group ${hasErrors(bean: queueElementInstance, field: 'appointmentType', 'error')} required">
	<label class="control-label" for="appointmentType">
		<g:message code="queueElement.appointmentType.label" default="Appointment Type" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:select name="appointmentType" from="${enums.AppointmentType?.values()}" keys="${enums.AppointmentType.values()*.name()}" required="" value="${queueElementInstance?.appointmentType?.name()}"/>
</div></div>

<div class="control-group ${hasErrors(bean: queueElementInstance, field: 'patient', 'error')} required">
	<label class="control-label" for="patient">
		<g:message code="queueElement.patient.label" default="Patient" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:select id="patient" name="patient.id" from="${com.itech.patient.Patient.list()}" optionKey="id" required="" value="${queueElementInstance?.patient?.id}" class="many-to-one"/>
</div></div>

<div class="control-group ${hasErrors(bean: queueElementInstance, field: 'timeAdmitted', 'error')} required">
	<label class="control-label" for="timeAdmitted">
		<g:message code="queueElement.timeAdmitted.label" default="Time Admitted" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:textField name="timeAdmitted" required="" value="${queueElementInstance?.timeAdmitted}"/>
</div></div>

<div class="control-group ${hasErrors(bean: queueElementInstance, field: 'complaints', 'error')} required">
	<label class="control-label" for="complaints">
		<g:message code="queueElement.complaints.label" default="Complaints" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:textField name="complaints" required="" value="${queueElementInstance?.complaints}"/>
</div></div>

<div class="control-group ${hasErrors(bean: queueElementInstance, field: 'doctor', 'error')} required">
	<label class="control-label" for="doctor">
		<g:message code="queueElement.doctor.label" default="Doctor" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:select id="doctor" name="doctor.id" from="${com.itech.membership.Doctor.list()}" optionKey="id" required="" value="${queueElementInstance?.doctor?.id}" class="many-to-one"/>
</div></div>

<div class="control-group ${hasErrors(bean: queueElementInstance, field: 'hasTransaction', 'error')} ">
	<label class="control-label" for="hasTransaction">
		<g:message code="queueElement.hasTransaction.label" default="Has Transaction" />
		
	</label><div class="controls">
	<g:checkBox name="hasTransaction" value="${queueElementInstance?.hasTransaction}" />
</div></div>

<div class="control-group ${hasErrors(bean: queueElementInstance, field: 'isDone', 'error')} ">
	<label class="control-label" for="isDone">
		<g:message code="queueElement.isDone.label" default="Is Done" />
		
	</label><div class="controls">
	<g:checkBox name="isDone" value="${queueElementInstance?.isDone}" />
</div></div>

