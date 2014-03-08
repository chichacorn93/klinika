<%@ page import="com.itech.patient.VitalSigns" %>



<div class="fieldcontain ${hasErrors(bean: vitalSignsInstance, field: 'bloodPressure', 'error')} required">
	<label for="bloodPressure">
		<g:message code="vitalSigns.bloodPressure.label" default="Blood Pressure" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="bloodPressure" pattern="${vitalSignsInstance.constraints.bloodPressure.matches}" required="" value="${vitalSignsInstance?.bloodPressure}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vitalSignsInstance, field: 'pulseRate', 'error')} required">
	<label for="pulseRate">
		<g:message code="vitalSigns.pulseRate.label" default="Pulse Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="pulseRate" required="" value="${vitalSignsInstance?.pulseRate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vitalSignsInstance, field: 'height', 'error')} required">
	<label for="height">
		<g:message code="vitalSigns.height.label" default="Height" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="height" value="${fieldValue(bean: vitalSignsInstance, field: 'height')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: vitalSignsInstance, field: 'weight', 'error')} required">
	<label for="weight">
		<g:message code="vitalSigns.weight.label" default="Weight" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="weight" value="${fieldValue(bean: vitalSignsInstance, field: 'weight')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: vitalSignsInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="vitalSigns.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${vitalSignsInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: vitalSignsInstance, field: 'lastMenstruationPeriod', 'error')} required">
	<label for="lastMenstruationPeriod">
		<g:message code="vitalSigns.lastMenstruationPeriod.label" default="Last Menstruation Period" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="lastMenstruationPeriod" precision="day"  value="${vitalSignsInstance?.lastMenstruationPeriod}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: vitalSignsInstance, field: 'patient', 'error')} required">
	<label for="patient">
		<g:message code="vitalSigns.patient.label" default="Patient" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="patient" name="patient.id" from="${com.itech.patient.Patient.list()}" optionKey="id" required="" value="${vitalSignsInstance?.patient?.id}" class="many-to-one"/>
</div>

