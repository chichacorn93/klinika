
<%@ page import="com.itech.patient.Patient"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'patient.label', default: 'Patient')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Deactivated Patient <small>Records</small>
				</h1>
			</div>
			<div id="list-patient" class="content scaffold-list" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<table class="table table-bordered table-hover table-striped" id="dataTablesList">
					<thead>
						<tr>

							<g:sortableColumn property="firstName"
								title="${message(code: 'patient.firstName.label', default: 'First Name')}" />

							<g:sortableColumn property="middleName"
								title="${message(code: 'patient.middleName.label', default: 'Middle Name')}" />

							<g:sortableColumn property="lastName"
								title="${message(code: 'patient.lastName.label', default: 'Last Name')}" />

							<g:sortableColumn property="birthDate"
								title="${message(code: 'patient.birthDate.label', default: 'Birth Date')}" />

							<g:sortableColumn property="gender"
								title="${message(code: 'patient.gender.label', default: 'Gender')}" />

							<g:sortableColumn property="maritalStatus"
								title="${message(code: 'patient.maritalStatus.label', default: 'Marital Status')}" />

						</tr>
					</thead>
					<tbody>
						<g:each in="${patientInstanceList}" status="i" var="patientInstance">
						<g:if test="${patientInstanceList.get(i).isActive == false}">
							<tr>

								<td><g:link action="show" id="${patientInstance.id}">
										${fieldValue(bean: patientInstance, field: "firstName")}
									</g:link></td>

								<td>
									${fieldValue(bean: patientInstance, field: "middleName")}
								</td>

								<td>
									${fieldValue(bean: patientInstance, field: "lastName")}
								</td>

								<td><g:formatDate date="${patientInstance.birthDate}" /></td>

								<td>
									${fieldValue(bean: patientInstance, field: "gender")}
								</td>

								<td>
									${fieldValue(bean: patientInstance, field: "maritalStatus")}
								</td>

							</tr>
							</g:if>
						</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${patientInstanceTotal}" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>
