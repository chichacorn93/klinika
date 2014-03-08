<%@ page import="com.itech.patient.PatientLog" %>



<div class="fieldcontain ${hasErrors(bean: patientLogInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="patientLog.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${patientLogInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: patientLogInstance, field: 'patient', 'error')} required">
	<label for="patient">
		<g:message code="patientLog.patient.label" default="Patient" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="patient" name="patient.id" from="${com.itech.patient.Patient.list()}" optionKey="id" required="" value="${patientLogInstance?.patient?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientLogInstance, field: 'patientAction', 'error')} ">
	<label for="patientAction">
		<g:message code="patientLog.patientAction.label" default="Patient Action" />
		
	</label>
	<g:textField name="patientAction" value="${patientLogInstance?.patientAction}"/>
</div>

