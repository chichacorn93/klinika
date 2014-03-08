<%@ page import="com.itech.patient.Referral" %>



<div class="fieldcontain ${hasErrors(bean: referralInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="referral.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${referralInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: referralInstance, field: 'refferredTo', 'error')} required">
	<label for="refferredTo">
		<g:message code="referral.refferredTo.label" default="Refferred To" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="refferredTo" required="" value="${referralInstance?.refferredTo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: referralInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="referral.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${referralInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: referralInstance, field: 'patient', 'error')} required">
	<label for="patient">
		<g:message code="referral.patient.label" default="Patient" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="patient" name="patient.id" from="${com.itech.patient.Patient.list()}" optionKey="id" required="" value="${referralInstance?.patient?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: referralInstance, field: 'refferredBy', 'error')} required">
	<label for="refferredBy">
		<g:message code="referral.refferredBy.label" default="Refferred By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="refferredBy" name="refferredBy.id" from="${com.itech.membership.Doctor.list()}" optionKey="id" required="" value="${referralInstance?.refferredBy?.id}" class="many-to-one"/>
</div>

