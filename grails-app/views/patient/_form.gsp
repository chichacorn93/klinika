<%@ page import="com.itech.patient.Patient"%>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'lastName', 'error')} required">
	<label class="control-label" for="lastName"> <g:message
			code="patient.lastName.label" default="Last Name" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="lastName"
			pattern="${patientInstance.constraints.lastName.matches}" required=""
			value="${patientInstance?.lastName}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'firstName', 'error')} required">
	<label class="control-label" for="firstName"> <g:message
			code="patient.firstName.label" default="First Name" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="firstName"
			pattern="${patientInstance.constraints.firstName.matches}"
			required="" value="${patientInstance?.firstName}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'middleName', 'error')} required">
	<label class="control-label" class="control-label" for="middleName">
		<g:message code="patient.middleName.label" default="Middle Name" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="middleName"
			pattern="${patientInstance.constraints.middleName.matches}"
			required="" value="${patientInstance?.middleName}" />
	</div>
</div>



<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'birthDate', 'error')} required">
	<label class="control-label" for="birthDate"> <g:message
			code="patient.birthDate.label" default="Birth Date" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:datePicker name="birthDate" precision="day"
			value="${patientInstance?.birthDate}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'gender', 'error')} required">
	<label class="control-label" for="gender"> <g:message
			code="patient.gender.label" default="Gender" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:select name="gender" from="${enums.Gender?.values()}"
			keys="${enums.Gender.values()*.name()}" required=""
			value="${patientInstance?.gender?.name()}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'maritalStatus', 'error')} required">
	<label class="control-label" for="maritalStatus"> <g:message
			code="patient.maritalStatus.label" default="Marital Status" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:select name="maritalStatus" from="${enums.MaritalStatus?.values()}"
			keys="${enums.MaritalStatus.values()*.name()}" required=""
			value="${patientInstance?.maritalStatus?.name()}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'emailAddress', 'error')} ">
	<label class="control-label" for="emailAddress"> <g:message
			code="patient.emailAddress.label" default="Email Address" />

	</label>
	<div class="controls">
		<g:field type="email" name="emailAddress"
			value="${patientInstance?.emailAddress}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'city', 'error')} ">
	<label class="control-label" for="city"> <g:message
			code="patient.city.label" default="City" />

	</label>
	<div class="controls">
		<g:textField name="city" value="${patientInstance?.city}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'street', 'error')} ">
	<label class="control-label" for="street"> <g:message
			code="patient.street.label" default="Street" />

	</label>
	<div class="controls">
		<g:textField name="street" value="${patientInstance?.street}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'town', 'error')} required">
	<label class="control-label" for="town"> <g:message
			code="patient.town.label" default="Town" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="town" required="" value="${patientInstance?.town}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'province', 'error')} required">
	<label class="control-label" for="province"> <g:message
			code="patient.province.label" default="Province" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="province" required=""
			value="${patientInstance?.province}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'mobileNumber', 'error')} ">
	<label class="control-label" for="mobileNumber"> <g:message
			code="patient.mobileNumber.label" default="Mobile Number" />

	</label>
	<div class="controls">
		<g:textField name="mobileNumber"
			pattern="${patientInstance.constraints.mobileNumber.matches}"
			value="${patientInstance?.mobileNumber}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'dateOfRegistration', 'error')} required">
	<label class="control-label" for="dateOfRegistration"> <g:message
			code="patient.dateOfRegistration.label"
			default="Date Of Registration" /> <span class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:datePicker name="dateOfRegistration" precision="day"
			value="${patientInstance?.dateOfRegistration}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'diagnoses', 'error')} ">
	<label class="control-label" for="diagnoses"> <g:message
			code="patient.diagnoses.label" default="Diagnoses" />

	</label>
	<div class="controls">

		<ul class="one-to-many">
			<g:each in="${patientInstance?.diagnoses?}" var="d">
				<li><g:link controller="diagnosis" action="show" id="${d.id}">
						${d?.encodeAsHTML()}
					</g:link></li>
			</g:each>
			<li class="add"><g:link controller="diagnosis" action="create"
					params="['patient.id': patientInstance?.id]">
					${message(code: 'default.add.label', args: [message(code: 'diagnosis.label', default: 'Diagnosis')])}
				</g:link></li>
		</ul>

	</div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'doctors', 'error')} ">
	<label class="control-label" for="doctors"> <g:message
			code="patient.doctors.label" default="Doctors" />

	</label>
	<div class="controls"></div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'invoices', 'error')} ">
	<label class="control-label" for="invoices"> <g:message
			code="patient.invoices.label" default="Invoices" />

	</label>
	<div class="controls">

		<ul class="one-to-many">
			<g:each in="${patientInstance?.invoices?}" var="i">
				<li><g:link controller="invoice" action="show" id="${i.id}">
						${i?.encodeAsHTML()}
					</g:link></li>
			</g:each>
			<li class="add"><g:link controller="invoice" action="create"
					params="['patient.id': patientInstance?.id]">
					${message(code: 'default.add.label', args: [message(code: 'invoice.label', default: 'Invoice')])}
				</g:link></li>
		</ul>

	</div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'isActive', 'error')} ">
	<label class="control-label" for="isActive"> <g:message
			code="patient.isActive.label" default="Is Active" />

	</label>
	<div class="controls">
		<g:checkBox name="isActive" value="${patientInstance?.isActive}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'isDeleted', 'error')} ">
	<label class="control-label" for="isDeleted"> <g:message
			code="patient.isDeleted.label" default="Is Deleted" />

	</label>
	<div class="controls">
		<g:checkBox name="isDeleted" value="${patientInstance?.isDeleted}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'laboratoryResults', 'error')} ">
	<label class="control-label" for="laboratoryResults"> <g:message
			code="patient.laboratoryResults.label" default="Laboratory Results" />

	</label>
	<div class="controls">

		<ul class="one-to-many">
			<g:each in="${patientInstance?.laboratoryResults?}" var="l">
				<li><g:link controller="laboratoryResult" action="show"
						id="${l.id}">
						${l?.encodeAsHTML()}
					</g:link></li>
			</g:each>
			<li class="add"><g:link controller="laboratoryResult"
					action="create" params="['patient.id': patientInstance?.id]">
					${message(code: 'default.add.label', args: [message(code: 'laboratoryResult.label', default: 'LaboratoryResult')])}
				</g:link></li>
		</ul>

	</div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'medicalHistories', 'error')} ">
	<label class="control-label" for="medicalHistories"> <g:message
			code="patient.medicalHistories.label" default="Medical Histories" />

	</label>
	<div class="controls">

		<ul class="one-to-many">
			<g:each in="${patientInstance?.medicalHistories?}" var="m">
				<li><g:link controller="medicalHistory" action="show"
						id="${m.id}">
						${m?.encodeAsHTML()}
					</g:link></li>
			</g:each>
			<li class="add"><g:link controller="medicalHistory"
					action="create" params="['patient.id': patientInstance?.id]">
					${message(code: 'default.add.label', args: [message(code: 'medicalHistory.label', default: 'MedicalHistory')])}
				</g:link></li>
		</ul>

	</div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'prescriptions', 'error')} ">
	<label class="control-label" for="prescriptions"> <g:message
			code="patient.prescriptions.label" default="Prescriptions" />

	</label>
	<div class="controls">

		<ul class="one-to-many">
			<g:each in="${patientInstance?.prescriptions?}" var="p">
				<li><g:link controller="prescription" action="show"
						id="${p.id}">
						${p?.encodeAsHTML()}
					</g:link></li>
			</g:each>
			<li class="add"><g:link controller="prescription"
					action="create" params="['patient.id': patientInstance?.id]">
					${message(code: 'default.add.label', args: [message(code: 'prescription.label', default: 'Prescription')])}
				</g:link></li>
		</ul>

	</div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'referrals', 'error')} ">
	<label class="control-label" for="referrals"> <g:message
			code="patient.referrals.label" default="Referrals" />

	</label>
	<div class="controls">

		<ul class="one-to-many">
			<g:each in="${patientInstance?.referrals?}" var="r">
				<li><g:link controller="referral" action="show" id="${r.id}">
						${r?.encodeAsHTML()}
					</g:link></li>
			</g:each>
			<li class="add"><g:link controller="referral" action="create"
					params="['patient.id': patientInstance?.id]">
					${message(code: 'default.add.label', args: [message(code: 'referral.label', default: 'Referral')])}
				</g:link></li>
		</ul>

	</div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'telNumber', 'error')} ">
	<label class="control-label" for="telNumber"> <g:message
			code="patient.telNumber.label" default="Tel Number" />

	</label>
	<div class="controls">
		<g:textField name="telNumber" value="${patientInstance?.telNumber}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'vitalSigns', 'error')} ">
	<label class="control-label" for="vitalSigns"> <g:message
			code="patient.vitalSigns.label" default="Vital Signs" />

	</label>
	<div class="controls">

		<ul class="one-to-many">
			<g:each in="${patientInstance?.vitalSigns?}" var="v">
				<li><g:link controller="vitalSigns" action="show" id="${v.id}">
						${v?.encodeAsHTML()}
					</g:link></li>
			</g:each>
			<li class="add"><g:link controller="vitalSigns" action="create"
					params="['patient.id': patientInstance?.id]">
					${message(code: 'default.add.label', args: [message(code: 'vitalSigns.label', default: 'VitalSigns')])}
				</g:link></li>
		</ul>

	</div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'lastUpdate', 'error')} required">
	<label class="control-label" for="lastUpdate"> <g:message
			code="patient.lastUpdate.label" default="Last Update" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:datePicker name="lastUpdate" precision="day"
			value="${patientInstance?.lastUpdate}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'lastUpdatedBy', 'error')} ">
	<label class="control-label" for="lastUpdatedBy"> <g:message
			code="patient.lastUpdatedBy.label" default="Last Updated By" />

	</label>
	<div class="controls">
		<g:textField name="lastUpdatedBy"
			value="${patientInstance?.lastUpdatedBy}" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: patientInstance, field: 'patientLog', 'error')} ">
	<label class="control-label" for="patientLog"> <g:message
			code="patient.patientLog.label" default="Patient Log" />
	</label>
	<div class="controls">
		<ul class="one-to-many">
			<g:each in="${patientInstance?.patientLog?}" var="p">
				<li><g:link controller="patientLog" action="show" id="${p.id}">
						${p?.encodeAsHTML()}
					</g:link></li>
			</g:each>
			<li class="add"><g:link controller="patientLog" action="create"
					params="['patient.id': patientInstance?.id]">
					${message(code: 'default.add.label', args: [message(code: 'patientLog.label', default: 'PatientLog')])}
				</g:link></li>
		</ul>
	</div>
</div>