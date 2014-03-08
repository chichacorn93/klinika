
<%@ page import="com.itech.patient.MedicalHistory"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'medicalHistory.label', default: 'MedicalHistory')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Medical History <small>Records</small>
				</h1>
			</div>
			<div class="row">
				<div class="span3" >
					<a href="${createLink(uri: '/medicalHistory-create')}"
						class="btn btn-success btn-mini" >
						<h5>
							<span class="cus-user_add"></span> New Record
						</h5>
					</a>
				</div>
			</div>
			<div id="list-medicalHistory" class="content scaffold-list"
				role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<table class="table table-bordered table-hover table-striped" id="dataTablesList">
					<thead>
						<tr>

							<g:sortableColumn property="pastIllness"
								title="${message(code: 'medicalHistory.pastIllness.label', default: 'Past Illness')}" />

							<g:sortableColumn property="pastMedications"
								title="${message(code: 'medicalHistory.pastMedications.label', default: 'Past Medications')}" />

							<th><g:message code="medicalHistory.patient.label"
									default="Patient" /></th>

						</tr>
					</thead>
					<tbody>
						<g:each in="${medicalHistoryInstanceList}" status="i"
							var="medicalHistoryInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

								<td><g:link action="show" id="${medicalHistoryInstance.id}">
										${fieldValue(bean: medicalHistoryInstance, field: "pastIllness")}
									</g:link></td>

								<td>
									${fieldValue(bean: medicalHistoryInstance, field: "pastMedications")}
								</td>

								<td>
									${fieldValue(bean: medicalHistoryInstance, field: "patient")}
								</td>

							</tr>
						</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${medicalHistoryInstanceTotal}" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>
