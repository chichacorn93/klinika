<%@ page import="com.itech.patient.LaboratoryResult" %>



<div class="control-group ${hasErrors(bean: laboratoryResultInstance, field: 'details', 'error')} required">
	<label class="control-label" for="details">
		<g:message code="laboratoryResult.details.label" default="Details" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:textField name="details" required="" value="${laboratoryResultInstance?.details}"/>
</div></div>

<div class="control-group ${hasErrors(bean: laboratoryResultInstance, field: 'date', 'error')} required">
	<label class="control-label" for="date">
		<g:message code="laboratoryResult.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:datePicker name="date" precision="day"  value="${laboratoryResultInstance?.date}"  />
</div></div>

<div class="control-group ${hasErrors(bean: laboratoryResultInstance, field: 'patient', 'error')} required">
	<label class="control-label" for="patient">
		<g:message code="laboratoryResult.patient.label" default="Patient" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:select id="patient" name="patient.id" from="${com.itech.patient.Patient.list()}" optionKey="id" required="" value="${laboratoryResultInstance?.patient?.id}" class="many-to-one"/>
</div></div>

