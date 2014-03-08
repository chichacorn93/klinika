<%@ page import="com.itech.schedule.Event" %>



<div class="control-group ${hasErrors(bean: eventInstance, field: 'name', 'error')} required">
	<label class="control-label" for="name">
		<g:message code="event.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:textField name="name" required="" value="${eventInstance?.name}"/>
</div></div>

<div class="control-group ${hasErrors(bean: eventInstance, field: 'location', 'error')} required">
	<label class="control-label" for="location">
		<g:message code="event.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:textField name="location" required="" value="${eventInstance?.location}"/>
</div></div>

<div class="control-group ${hasErrors(bean: eventInstance, field: 'details', 'error')} required">
	<label class="control-label" for="details">
		<g:message code="event.details.label" default="Details" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:textField name="details" required="" value="${eventInstance?.details}"/>
</div></div>

<div class="control-group ${hasErrors(bean: eventInstance, field: 'doctor', 'error')} required">
	<label class="control-label" for="doctor">
		<g:message code="event.doctor.label" default="Doctor" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:select id="doctor" name="doctor.id" from="${com.itech.membership.Doctor.list()}" optionKey="id" required="" value="${eventInstance?.doctor?.id}" class="many-to-one"/>
</div></div>

<div class="control-group ${hasErrors(bean: eventInstance, field: 'startDate', 'error')} required">
	<label class="control-label" for="startDate">
		<g:message code="event.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:datePicker name="startDate" precision="day"  value="${eventInstance?.startDate}"  />
</div></div>

<div class="control-group ${hasErrors(bean: eventInstance, field: 'endDate', 'error')} required">
	<label class="control-label" for="endDate">
		<g:message code="event.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:datePicker name="endDate" precision="day"  value="${eventInstance?.endDate}"  />
</div></div>

