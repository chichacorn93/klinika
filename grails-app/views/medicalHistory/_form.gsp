<%@ page import="com.itech.patient.MedicalHistory" %>



<div class="control-group ${hasErrors(bean: medicalHistoryInstance, field: 'pastIllness', 'error')} required">
	<label class="control-label" for="pastIllness">
		<g:message code="medicalHistory.pastIllness.label" default="Past Illness" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:textField name="pastIllness" required="" value="${medicalHistoryInstance?.pastIllness}"/>
</div></div>

<div class="control-group ${hasErrors(bean: medicalHistoryInstance, field: 'pastMedications', 'error')} required">
	<label class="control-label" for="pastMedications">
		<g:message code="medicalHistory.pastMedications.label" default="Past Medications" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:textField name="pastMedications" required="" value="${medicalHistoryInstance?.pastMedications}"/>
</div></div>

<div class="control-group ${hasErrors(bean: medicalHistoryInstance, field: 'patient', 'error')} required">
	<label class="control-label" for="patient">
		<g:message code="medicalHistory.patient.label" default="Patient" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:select id="patient" name="patient.id" from="${com.itech.patient.Patient.list()}" optionKey="id" required="" value="${medicalHistoryInstance?.patient?.id}" class="many-to-one"/>
</div></div>

