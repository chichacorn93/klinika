
<%@ page import="com.itech.membership.Doctor"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'doctor.label', default: 'Doctor')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Details<small> ${doctorInstance}</small>
				</h1>
				<i>Last update:
					<g:if test="${doctorInstance.lastUpdate == doctorInstance.registrationDate }"> (has not been updated)</g:if>
					<g:if test="${doctorInstance.lastUpdate != doctorInstance.registrationDate}"> ${doctorInstance.lastUpdate}</g:if>
				</i>
			</div>
			<div id="show-doctor" class="content scaffold-show" role="main"
				style="padding-left: 100px">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<div class="row">
					<div class="span5">
						<table align="center" class="table"
							style="width: 100%; max-width: 500px; table-layout: fixed;">
							<tbody>

								<g:if test="${doctorInstance?.firstName}">
									<tr class="prop" style="width: 45%">
										<td valign="top" class="name" style="padding-left: 60px"><strong>
												<span id="firstName-label" class="property-label"> <g:message
														code="doctor.firstName.label" default="First Name" /></span>
										</strong></td>
										<td valign="top" class="value" style="width: 55%"><span
											class="property-value" aria-labelledby="firstName-label"><g:fieldValue
													bean="${doctorInstance}" field="firstName" /></span></td>
									</tr>
								</g:if>

								<g:if test="${doctorInstance?.middleName}">
									<tr class="prop" style="width: 45%">
										<td valign="top" class="name" style="padding-left: 60px"><strong>
												<span id="middleName-label" class="property-label"><g:message
														code="doctor.middleName.label" default="Middle Name" /></span>
										</strong></td>
										<td valign="top" class="value" style="width: 55%"><span
											class="property-value" aria-labelledby="middleName-label"><g:fieldValue
													bean="${doctorInstance}" field="middleName" /></span></td>
									</tr>
								</g:if>

								<g:if test="${doctorInstance?.lastName}">
									<tr class="prop" style="width: 45%">
										<td valign="top" class="name" style="padding-left: 60px"><strong>
												<span id="lastName-label" class="property-label"> <g:message
														code="doctor.lastName.label" default="Last Name" /></span>
										</strong></td>
										<td valign="top" class="value" style="width: 55%"><span
											class="property-value" aria-labelledby="lastName-label">
												<g:fieldValue bean="${doctorInstance}" field="lastName" />
										</span></td>
								</g:if>

								<g:if test="${doctorInstance?.address}">
									<tr class="prop" style="width: 45%">
										<td valign="top" class="name" style="padding-left: 60px"><strong>
												<span id="address-label" class="property-label"><g:message
														code="doctor.address.label" default="Address" /></span>
										</strong></td>
										<td valign="top" class="value" style="width: 55%"><span
											class="property-value" aria-labelledby="address-label"><g:fieldValue
													bean="${doctorInstance}" field="address" /></span></td>
								</g:if>

								<g:if test="${doctorInstance?.email}">
									<tr class="prop" style="width: 45%">
										<td valign="top" class="name" style="padding-left: 60px"><strong>
												<span id="email-label" class="property-label"><g:message
														code="doctor.email.label" default="Email" /></span>
										</strong></td>
										<td valign="top" class="value" style="width: 55%"><span
											class="property-value" aria-labelledby="email-label"><g:fieldValue
													bean="${doctorInstance}" field="email" /></span></td>
								</g:if>

								<g:if test="${doctorInstance?.mobileNum}">
									<tr class="prop" style="width: 45%">
										<td valign="top" class="name" style="padding-left: 60px"><strong>
												<span id="mobileNum-label" class="property-label"><g:message
														code="doctor.mobileNum.label" default="Mobile Num" /></span>
										</strong></td>
										<td valign="top" class="value" style="width: 55%"><span
											class="property-value" aria-labelledby="mobileNum-label"><g:fieldValue
													bean="${doctorInstance}" field="mobileNum" /></span></td>
								</g:if>

								<g:if test="${doctorInstance?.telNum}">
									<tr class="prop" style="width: 45%">
										<td valign="top" class="name" style="padding-left: 60px"><strong>
												<span id="telNum-label" class="property-label"><g:message
														code="doctor.telNum.label" default="Tel Num" /></span>
										</strong></td>
										<td valign="top" class="value" style="width: 55%"><span
											class="property-value" aria-labelledby="telNum-label"><g:fieldValue
													bean="${doctorInstance}" field="telNum" /></span></td>
								</g:if>

								<g:if test="${doctorInstance?.registrationDate}">
									<tr class="prop" style="width: 45%">
										<td valign="top" class="name" style="padding-left: 60px"><strong>
												<span id="registrationDate-label" class="property-label"><g:message
														code="doctor.registrationDate.label"
														default="Registration Date" /></span>
										</strong></td>
										<td valign="top" class="value" style="width: 55%"><span
											class="property-value"
											aria-labelledby="registrationDate-label"><g:formatDate
													date="${doctorInstance?.registrationDate}" /></span></td>
								</g:if>

								<g:if test="${doctorInstance?.secQuestion}">
									<tr class="prop" style="width: 45%">
										<td valign="top" class="name" style="padding-left: 60px"><strong>
												<span id="secQuestion-label" class="property-label"><g:message
														code="doctor.secQuestion.label" default="Sec Question" /></span>
										</strong></td>
										<td valign="top" class="value" style="width: 55%"><span
											class="property-value" aria-labelledby="secQuestion-label"><g:fieldValue
													bean="${doctorInstance}" field="secQuestion" /></span></td>
								</g:if>

								<g:if test="${doctorInstance?.secAnswer}">
									<tr class="prop" style="width: 45%">
										<td valign="top" class="name" style="padding-left: 60px"><strong>
												<span id="secAnswer-label" class="property-label"><g:message
														code="doctor.secAnswer.label" default="Sec Answer" /></span>
										</strong></td>
										<td valign="top" class="value" style="width: 55%"><span
											class="property-value" aria-labelledby="secAnswer-label"><g:fieldValue
													bean="${doctorInstance}" field="secAnswer" /></span></td>
								</g:if>
							</tbody>
						</table>
					</div>
					<div class="span5">
						<table align="center" class="table"
							style="width: 100%; max-width: 500px; table-layout: fixed;">
							<tbody>

								<g:if test="${doctorInstance?.username}">
									<tr class="prop" style="width: 45%">
										<td valign="top" class="name" style="padding-left: 60px"><strong>
												<span id="username-label" class="property-label"><g:message
														code="doctor.username.label" default="Username" /></span>
										</strong></td>
										<td valign="top" class="value" style="width: 55%"><span
											class="property-value" aria-labelledby="username-label"><g:fieldValue
													bean="${doctorInstance}" field="username" /></span></td>
								</g:if>

								<g:if test="${doctorInstance?.password}">
									<tr class="prop" style="width: 45%">
										<td valign="top" class="name" style="padding-left: 60px"><strong>
												<span id="password-label" class="property-label"><g:message
														code="doctor.password.label" default="Password" /></span>
										</strong></td>
										<td valign="top" class="value" style="width: 55%"><span
											class="property-value" aria-labelledby="password-label"><g:fieldValue
													bean="${doctorInstance}" field="password" /></span></td>
								</g:if>

								<g:if test="${doctorInstance?.background}">
									<tr class="prop" style="width: 45%">
										<td valign="top" class="name" style="padding-left: 60px"><strong>
												<span id="background-label" class="property-label"><g:message
														code="doctor.background.label" default="Background" /></span>
										</strong></td>
										<td valign="top" class="value" style="width: 55%"><span
											class="property-value" aria-labelledby="background-label"><g:fieldValue
													bean="${doctorInstance}" field="background" /></span></td>
								</g:if>

								<g:if test="${doctorInstance?.clinicHourStart}">
									<tr class="prop" style="width: 45%">
										<td valign="top" class="name" style="padding-left: 60px"><strong>
												<span id="clinicHourStart-label" class="property-label"><g:message
														code="doctor.clinicHourStart.label"
														default="Clinic Hour Start" /></span>
										</strong></td>
										<td valign="top" class="value" style="width: 55%"><span
											class="property-value"
											aria-labelledby="clinicHourStart-label"><g:fieldValue
													bean="${doctorInstance}" field="clinicHourStart" /></span></td>
								</g:if>

								<g:if test="${doctorInstance?.clinicHourEnd}">
									<tr class="prop" style="width: 45%">
										<td valign="top" class="name" style="padding-left: 60px"><strong>
												<span id="clinicHourEnd-label" class="property-label"><g:message
														code="doctor.clinicHourEnd.label"
														default="Clinic Hour End" /></span>
										</strong></td>
										<td valign="top" class="value" style="width: 55%"><span
											class="property-value" aria-labelledby="clinicHourEnd-label"><g:fieldValue
													bean="${doctorInstance}" field="clinicHourEnd" /></span></td>
								</g:if>

								<g:if test="${doctorInstance?.accountExpired}">
									<tr class="prop" style="width: 45%">
										<td valign="top" class="name" style="padding-left: 60px"><strong>
												<span id="accountExpired-label" class="property-label"><g:message
														code="doctor.accountExpired.label"
														default="Account Expired" /></span>
										</strong></td>

										<td valign="top" class="value" style="width: 55%"><span
											class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean
													boolean="${doctorInstance?.accountExpired}" /></span>
									</tr>
								</g:if>

								<g:if test="${doctorInstance?.accountLocked}">
									<tr class="prop" style="width: 45%">
										<td valign="top" class="name" style="padding-left: 60px"><strong>
												<span id="accountLocked-label" class="property-label"><g:message
														code="doctor.accountLocked.label" default="Account Locked" /></span>
										</strong></td>
										<td valign="top" class="value" style="width: 55%"><span
											class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean
													boolean="${doctorInstance?.accountLocked}" /></span></td>
								</g:if>

								<g:if test="${doctorInstance?.enabled}">
									<tr class="prop" style="width: 45%">
										<td valign="top" class="name" style="padding-left: 60px"><strong>
												<span id="enabled-label" class="property-label"><g:message
														code="doctor.enabled.label" default="Enabled" /></span>
										</strong></td>
										<td valign="top" class="value" style="width: 55%"><span
											class="property-value" aria-labelledby="enabled-label"><g:formatBoolean
													boolean="${doctorInstance?.enabled}" /></span></td>
								</g:if>

								<g:if test="${doctorInstance?.isDeleted}">
									<tr class="prop" style="width: 45%">
										<td valign="top" class="name" style="padding-left: 60px"><strong>
												<span id="isDeleted-label" class="property-label"><g:message
														code="doctor.isDeleted.label" default="Is Deleted" /></span>
										</strong></td>
										<td valign="top" class="value" style="width: 55%"><span
											class="property-value" aria-labelledby="isDeleted-label"><g:formatBoolean
													boolean="${doctorInstance?.isDeleted}" /></span></td>
								</g:if>

								<g:if test="${doctorInstance?.passwordExpired}">
									<tr class="prop" style="width: 45%">
										<td valign="top" class="name" style="padding-left: 60px"><strong>
												<span id="passwordExpired-label" class="property-label"><g:message
														code="doctor.passwordExpired.label"
														default="Password Expired" /></span>
										</strong></td>
										<td valign="top" class="value" style="width: 55%"><span
											class="property-value"
											aria-labelledby="passwordExpired-label"><g:formatBoolean
													boolean="${doctorInstance?.passwordExpired}" /></span></td>
								</g:if>

								<g:if test="${doctorInstance?.isActive}">
									<tr class="prop" style="width: 45%">
										<td valign="top" class="name" style="padding-left: 60px"><strong>
												<span id="isActive-label" class="property-label"><g:message
														code="doctor.isActive.label" default="Is Active" /></span>
										</strong></td>
										<td valign="top" class="value" style="width: 55%"><span
											class="property-value" aria-labelledby="isActive-label"><g:formatBoolean
													boolean="${doctorInstance?.isActive}" /></span></td>
								</g:if>

								<g:if test="${doctorInstance?.lastUpdate}">
									<tr class="prop" style="width: 45%">
										<td valign="top" class="name" style="padding-left: 60px"><strong>
												<span id="lastUpdate-label" class="property-label"><g:message
														code="doctor.lastUpdate.label" default="Last Update" /></span>
										</strong></td>
										<td valign="top" class="value" style="width: 55%"><span
											class="property-value" aria-labelledby="lastUpdate-label"><g:formatDate
													date="${doctorInstance?.lastUpdate}" /></span></td>
								</g:if>
							</tbody>
						</table>
					</div>
				</div>
				<div style="padding-top: 20px">
					<table class="table table-bordered table-hover table-striped">
						<thead>
							<tr>

								<g:message code="doctor.patients.label" default="Patients" />

							</tr>
						</thead>
						<tbody>
							<g:each in="${doctorInstance.patients}" var="p">
								<tr>

									<td><g:link controller="patient" action="show"
											id="${p.id}">
											${p?.encodeAsHTML()}
										</g:link></td>


								</tr>
							</g:each>
						</tbody>
					</table>

					<%--					<g:if test="${doctorInstance?.patients}">--%>
					<%--						<span id="patients-label"--%>
					<%--							class="property-label"><g:message--%>
					<%--									code="doctor.patients.label" default="Patients" /></span> <g:each--%>
					<%--								in="${doctorInstance.patients}" var="p">--%>
					<%--								<span class="property-value" aria-labelledby="patients-label"><g:link--%>
					<%--										controller="patient" action="show" id="${p.id}">--%>
					<%--										${p?.encodeAsHTML()}--%>
					<%--									</g:link></span>--%>
					<%--							</g:each>--%>
					<%--					</g:if>--%>

				</div>
				<div>
					<g:if test="${doctorInstance?.receptionists}">
						<li class="fieldcontain"><span id="receptionist-label"
							class="property-label"><g:message
									code="doctor.receptionists.label" default="Receptionist" /></span> <g:each
								in="${doctorInstance.receptionists}" var="r">
								<span class="property-value"
									aria-labelledby="receptionists-label"><g:link
										controller="receptionist" action="show" id="${r.id}">
										${r?.encodeAsHTML()}
									</g:link></span>
							</g:each></li>
					</g:if>
				</div>
				<g:form>
					<fieldset class="buttons">
						<g:hiddenField name="id" value="${doctorInstance?.id}" />
						<g:link class="btn btn-primary" action="edit" id="${doctorInstance?.id}">
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						
						<g:if test="${doctorInstance.isActive == true}">
							<g:actionSubmit class="btn btn-warning" action="deactivate"
								value="Deactivate" onclick="return confirm('Are you sure?')" />
						</g:if>

						<g:if test="${doctorInstance.isActive == false}">
							<g:actionSubmit class="btn btn-info" action="activate"
								value="Activate" onclick="return confirm('Are you sure?')" />
						</g:if>

						<g:if test="${doctorInstance.isDeleted == false}">
							<g:actionSubmit class="btn btn-inverse" action="remove"
								value="Remove" onclick="return confirm('Are you sure?')" />
						</g:if>

						<g:if test="${doctorInstance.isDeleted == true}">
							<g:actionSubmit class="btn btn-success" action="restore"
								value="Restore" onclick="return confirm('Are you sure?')" />
						</g:if>
						<g:actionSubmit class="btn btn-danger" action="delete"
							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</div>
		</div>
	</div>
</body>
</html>
