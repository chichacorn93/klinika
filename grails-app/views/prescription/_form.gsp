<%@ page import="com.itech.patient.Prescription" %>



<div class="fieldcontain ${hasErrors(bean: prescriptionInstance, field: 'clinicAddress', 'error')} required">
	<label for="clinicAddress">
		<g:message code="prescription.clinicAddress.label" default="Clinic Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="clinicAddress" required="" value="${prescriptionInstance?.clinicAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prescriptionInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="prescription.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${prescriptionInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prescriptionInstance, field: 'clinicName', 'error')} required">
	<label for="clinicName">
		<g:message code="prescription.clinicName.label" default="Clinic Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="clinicName" required="" value="${prescriptionInstance?.clinicName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prescriptionInstance, field: 'clinicMobileNumber', 'error')} ">
	<label for="clinicMobileNumber">
		<g:message code="prescription.clinicMobileNumber.label" default="Clinic Mobile Number" />
		
	</label>
	<g:textField name="clinicMobileNumber" pattern="${prescriptionInstance.constraints.clinicMobileNumber.matches}" value="${prescriptionInstance?.clinicMobileNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prescriptionInstance, field: 'clinicTelNumber', 'error')} ">
	<label for="clinicTelNumber">
		<g:message code="prescription.clinicTelNumber.label" default="Clinic Tel Number" />
		
	</label>
	<g:textField name="clinicTelNumber" pattern="${prescriptionInstance.constraints.clinicTelNumber.matches}" value="${prescriptionInstance?.clinicTelNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prescriptionInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="prescription.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${prescriptionInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: prescriptionInstance, field: 'doctor', 'error')} required">
	<label for="doctor">
		<g:message code="prescription.doctor.label" default="Doctor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="doctor" name="doctor.id" from="${com.itech.membership.Doctor.list()}" optionKey="id" required="" value="${prescriptionInstance?.doctor?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prescriptionInstance, field: 'patient', 'error')} required">
	<label for="patient">
		<g:message code="prescription.patient.label" default="Patient" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="patient" name="patient.id" from="${com.itech.patient.Patient.list()}" optionKey="id" required="" value="${prescriptionInstance?.patient?.id}" class="many-to-one"/>
</div>

