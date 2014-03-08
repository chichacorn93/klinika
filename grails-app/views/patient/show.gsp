
<%@ page import="com.itech.patient.Patient"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'patient.label', default: 'Patient')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
<r:require module="export"/>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Details<small> ${patientInstance}, ${age}</small>
				</h1>
				<i>Last update: <g:if test="${patientInstance.lastUpdate == patientInstance.dateOfRegistration }"> (has not been updated)</g:if>
					<g:if test="${patientInstance.lastUpdate != patientInstance.dateOfRegistration }">
						${patientInstance.lastUpdate} by ${patientInstance.lastUpdatedBy}
					</g:if>
				</i>
			</div>
			<div id="show-patient" class="content scaffold-show" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<ol class="property-list patient">

					<g:if test="${patientInstance?.firstName}">
						<li class="fieldcontain"><span id="firstName-label"
							class="property-label"><g:message
									code="patient.firstName.label" default="First Name" /></span> <span
							class="property-value" aria-labelledby="firstName-label"><g:fieldValue
									bean="${patientInstance}" field="firstName" /></span></li>
					</g:if>

					<g:if test="${patientInstance?.middleName}">
						<li class="fieldcontain"><span id="middleName-label"
							class="property-label"><g:message
									code="patient.middleName.label" default="Middle Name" /></span> <span
							class="property-value" aria-labelledby="middleName-label"><g:fieldValue
									bean="${patientInstance}" field="middleName" /></span></li>
					</g:if>

					<g:if test="${patientInstance?.lastName}">
						<li class="fieldcontain"><span id="lastName-label"
							class="property-label"><g:message
									code="patient.lastName.label" default="Last Name" /></span> <span
							class="property-value" aria-labelledby="lastName-label"><g:fieldValue
									bean="${patientInstance}" field="lastName" /></span></li>
					</g:if>

					<g:if test="${patientInstance?.birthDate}">
						<li class="fieldcontain"><span id="birthDate-label"
							class="property-label"><g:message
									code="patient.birthDate.label" default="Birth Date" /></span> <span
							class="property-value" aria-labelledby="birthDate-label"><g:formatDate
									date="${patientInstance?.birthDate}" /></span></li>
					</g:if>

					<g:if test="${patientInstance?.gender}">
						<li class="fieldcontain"><span id="gender-label"
							class="property-label"><g:message
									code="patient.gender.label" default="Gender" /></span> <span
							class="property-value" aria-labelledby="gender-label"><g:fieldValue
									bean="${patientInstance}" field="gender" /></span></li>
					</g:if>

					<g:if test="${patientInstance?.maritalStatus}">
						<li class="fieldcontain"><span id="maritalStatus-label"
							class="property-label"><g:message
									code="patient.maritalStatus.label" default="Marital Status" /></span>

							<span class="property-value"
							aria-labelledby="maritalStatus-label"><g:fieldValue
									bean="${patientInstance}" field="maritalStatus" /></span></li>
					</g:if>

					<g:if test="${patientInstance?.emailAddress}">
						<li class="fieldcontain"><span id="emailAddress-label"
							class="property-label"><g:message
									code="patient.emailAddress.label" default="Email Address" /></span> <span
							class="property-value" aria-labelledby="emailAddress-label"><g:fieldValue
									bean="${patientInstance}" field="emailAddress" /></span></li>
					</g:if>

					<g:if test="${patientInstance?.city}">
						<li class="fieldcontain"><span id="city-label"
							class="property-label"><g:message
									code="patient.city.label" default="City" /></span> <span
							class="property-value" aria-labelledby="city-label"><g:fieldValue
									bean="${patientInstance}" field="city" /></span></li>
					</g:if>

					<g:if test="${patientInstance?.street}">
						<li class="fieldcontain"><span id="street-label"
							class="property-label"><g:message
									code="patient.street.label" default="Street" /></span> <span
							class="property-value" aria-labelledby="street-label"><g:fieldValue
									bean="${patientInstance}" field="street" /></span></li>
					</g:if>

					<g:if test="${patientInstance?.town}">
						<li class="fieldcontain"><span id="town-label"
							class="property-label"><g:message
									code="patient.town.label" default="Town" /></span> <span
							class="property-value" aria-labelledby="town-label"><g:fieldValue
									bean="${patientInstance}" field="town" /></span></li>
					</g:if>

					<g:if test="${patientInstance?.province}">
						<li class="fieldcontain"><span id="province-label"
							class="property-label"><g:message
									code="patient.province.label" default="Province" /></span> <span
							class="property-value" aria-labelledby="province-label"><g:fieldValue
									bean="${patientInstance}" field="province" /></span></li>
					</g:if>

					<g:if test="${patientInstance?.mobileNumber}">
						<li class="fieldcontain"><span id="mobileNumber-label"
							class="property-label"><g:message
									code="patient.mobileNumber.label" default="Mobile Number" /></span> <span
							class="property-value" aria-labelledby="mobileNumber-label"><g:fieldValue
									bean="${patientInstance}" field="mobileNumber" /></span></li>
					</g:if>

					<g:if test="${patientInstance?.dateOfRegistration}">
						<li class="fieldcontain"><span id="dateOfRegistration-label"
							class="property-label"><g:message
									code="patient.dateOfRegistration.label"
									default="Date Of Registration" /></span> <span class="property-value"
							aria-labelledby="dateOfRegistration-label"><g:formatDate
									date="${patientInstance?.dateOfRegistration}" /></span></li>
					</g:if>

					<g:if test="${patientInstance?.diagnoses}">
						<li class="fieldcontain"><span id="diagnoses-label"
							class="property-label"><g:message
									code="patient.diagnoses.label" default="Diagnoses" /></span> <g:each
								in="${patientInstance.diagnoses}" var="d">
								<span class="property-value" aria-labelledby="diagnoses-label"><g:link
										controller="diagnosis" action="show" id="${d.id}">
										${d?.encodeAsHTML()}
									</g:link></span>
							</g:each></li>
					</g:if>

					<g:if test="${patientInstance?.doctors}">
						<li class="fieldcontain"><span id="doctors-label"
							class="property-label"><g:message
									code="patient.doctors.label" default="Doctors" /></span> <g:each
								in="${patientInstance.doctors}" var="d">
								<span class="property-value" aria-labelledby="doctors-label"><g:link
										controller="doctor" action="show" id="${d.id}">
										${d?.encodeAsHTML()}
									</g:link></span>
							</g:each></li>
					</g:if>

					<g:if test="${patientInstance?.invoices}">
						<li class="fieldcontain"><span id="invoices-label"
							class="property-label"><g:message
									code="patient.invoices.label" default="Invoices" /></span> <g:each
								in="${patientInstance.invoices}" var="i">
								<span class="property-value" aria-labelledby="invoices-label"><g:link
										controller="invoice" action="show" id="${i.id}">
										${i?.encodeAsHTML()}
									</g:link></span>
							</g:each></li>
					</g:if>

					<g:if test="${patientInstance?.isActive}">
						<li class="fieldcontain"><span id="isActive-label"
							class="property-label"><g:message
									code="patient.isActive.label" default="Is Active" /></span> <span
							class="property-value" aria-labelledby="isActive-label"><g:formatBoolean
									boolean="${patientInstance?.isActive}" /></span></li>
					</g:if>

					<g:if test="${patientInstance?.isDeleted}">
						<li class="fieldcontain"><span id="isDeleted-label"
							class="property-label"><g:message
									code="patient.isDeleted.label" default="Is Deleted" /></span> <span
							class="property-value" aria-labelledby="isDeleted-label"><g:formatBoolean
									boolean="${patientInstance?.isDeleted}" /></span></li>
					</g:if>

					<g:if test="${patientInstance?.laboratoryResults}">
						<li class="fieldcontain"><span id="laboratoryResults-label"
							class="property-label"><g:message
									code="patient.laboratoryResults.label"
									default="Laboratory Results" /></span> <g:each
								in="${patientInstance.laboratoryResults}" var="l">
								<span class="property-value"
									aria-labelledby="laboratoryResults-label"><g:link
										controller="laboratoryResult" action="show" id="${l.id}">
										${l?.encodeAsHTML()}
									</g:link></span>
							</g:each></li>
					</g:if>

					<g:if test="${patientInstance?.medicalHistories}">
						<li class="fieldcontain"><span id="medicalHistories-label"
							class="property-label"><g:message
									code="patient.medicalHistories.label"
									default="Medical Histories" /></span> <g:each
								in="${patientInstance.medicalHistories}" var="m">
								<span class="property-value"
									aria-labelledby="medicalHistories-label"><g:link
										controller="medicalHistory" action="show" id="${m.id}">
										${m?.encodeAsHTML()}
									</g:link></span>
							</g:each></li>
					</g:if>

					<g:if test="${patientInstance?.prescriptions}">
						<li class="fieldcontain"><span id="prescriptions-label"
							class="property-label"><g:message
									code="patient.prescriptions.label" default="Prescriptions" /></span>

							<g:each in="${patientInstance.prescriptions}" var="p">
								<span class="property-value"
									aria-labelledby="prescriptions-label"><g:link
										controller="prescription" action="show" id="${p.id}">
										${p?.encodeAsHTML()}
									</g:link></span>
							</g:each></li>
					</g:if>

					<g:if test="${patientInstance?.referrals}">
						<li class="fieldcontain"><span id="referrals-label"
							class="property-label"><g:message
									code="patient.referrals.label" default="Referrals" /></span> <g:each
								in="${patientInstance.referrals}" var="r">
								<span class="property-value" aria-labelledby="referrals-label"><g:link
										controller="referral" action="show" id="${r.id}">
										${r?.encodeAsHTML()}
									</g:link></span>
							</g:each></li>
					</g:if>

					<g:if test="${patientInstance?.telNumber}">
						<li class="fieldcontain"><span id="telNumber-label"
							class="property-label"><g:message
									code="patient.telNumber.label" default="Tel Number" /></span> <span
							class="property-value" aria-labelledby="telNumber-label"><g:fieldValue
									bean="${patientInstance}" field="telNumber" /></span></li>
					</g:if>

					<g:if test="${patientInstance?.vitalSigns}">
						<li class="fieldcontain"><span id="vitalSigns-label"
							class="property-label"><g:message
									code="patient.vitalSigns.label" default="Vital Signs" /></span> <g:each
								in="${patientInstance.vitalSigns}" var="v">
								<span class="property-value" aria-labelledby="vitalSigns-label"><g:link
										controller="vitalSigns" action="show" id="${v.id}">
										${v?.encodeAsHTML()}
									</g:link></span>
							</g:each></li>
					</g:if>

				</ol>
				<g:form>
					<fieldset class="buttons">
						<g:hiddenField name="id" value="${patientInstance?.id}" />
						<g:link class="btn btn-primary" action="edit"
							id="${patientInstance?.id}">
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>

						<g:if test="${patientInstance.isActive == true}">
							<g:actionSubmit class="btn btn-warning" action="deactivate"
								value="Deactivate" onclick="return confirm('Are you sure?')" />
						</g:if>

						<g:if test="${patientInstance.isActive == false}">
							<g:actionSubmit class="btn btn-info" action="activate"
								value="Activate" onclick="return confirm('Are you sure?')" />
						</g:if>

						<g:if test="${patientInstance.isDeleted == false}">
							<g:actionSubmit class="btn btn-inverse" action="remove"
								value="Remove" onclick="return confirm('Are you sure?')" />
						</g:if>

						<g:if test="${patientInstance.isDeleted == true}">
							<g:actionSubmit class="btn btn-success" action="restore"
								value="Restore" onclick="return confirm('Are you sure?')" />
						</g:if>


						<g:actionSubmit class="btn btn-danger" action="delete"
							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
					<export:formats />
				</g:form>
			</div>
		</div>
	</div>
</body>
</html>
