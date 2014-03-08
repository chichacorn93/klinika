<%@ page import="com.itech.patient.Diagnosis" %>



<div class="control-group ${hasErrors(bean: diagnosisInstance, field: 'details', 'error')} required">
	<label class="control-label" for="details">
		<g:message code="diagnosis.details.label" default="Details" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:textField name="details" required="" value="${diagnosisInstance?.details}"/>
</div></div>

<div class="control-group ${hasErrors(bean: diagnosisInstance, field: 'doctor', 'error')} required">
	<label class="control-label" for="doctor">
		<g:message code="diagnosis.doctor.label" default="Doctor" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:select id="doctor" name="doctor.id" from="${com.itech.membership.Doctor.list()}" optionKey="id" required="" value="${diagnosisInstance?.doctor?.id}" class="many-to-one"/>
</div></div>

<div class="control-group ${hasErrors(bean: diagnosisInstance, field: 'date', 'error')} required">
	<label class="control-label" for="date">
		<g:message code="diagnosis.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:datePicker name="date" precision="day"  value="${diagnosisInstance?.date}"  />
</div></div>

<div class="control-group ${hasErrors(bean: diagnosisInstance, field: 'patient', 'error')} required">
	<label class="control-label" for="patient">
		<g:message code="diagnosis.patient.label" default="Patient" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:select id="patient" name="patient.id" from="${com.itech.patient.Patient.list()}" optionKey="id" required="" value="${diagnosisInstance?.patient?.id}" class="many-to-one"/>
</div></div>

