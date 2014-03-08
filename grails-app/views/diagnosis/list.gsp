
<%@ page import="com.itech.patient.Diagnosis"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'diagnosis.label', default: 'Diagnosis')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Patient <small>Diagnosis</small>
				</h1>
			</div>
			<div class="row">
				<div class="span3">
					<a href="${createLink(uri: '/diagnosis-create')}"
						class="btn btn-success btn-mini">
						<h5>
							<span class="cus-user_add"></span> New Record
						</h5>
					</a>
				</div>
			</div>
			<div id="list-diagnosis" class="content scaffold-list" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<table class="table table-bordered table-hover table-striped" id="dataTablesList">
					<thead>
						<tr>

							<g:sortableColumn property="details"
								title="${message(code: 'diagnosis.details.label', default: 'Details')}" />

							<th><g:message code="diagnosis.doctor.label"
									default="Doctor" /></th>

							<g:sortableColumn property="date"
								title="${message(code: 'diagnosis.date.label', default: 'Date')}" />

							<th><g:message code="diagnosis.patient.label"
									default="Patient" /></th>

						</tr>
					</thead>
					<tbody>
						<g:each in="${diagnosisInstanceList}" status="i"
							var="diagnosisInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

								<td><g:link action="show" id="${diagnosisInstance.id}">
										${fieldValue(bean: diagnosisInstance, field: "details")}
									</g:link></td>

								<td>
									${fieldValue(bean: diagnosisInstance, field: "doctor")}
								</td>

								<td><g:formatDate date="${diagnosisInstance.date}" /></td>

								<td>
									${fieldValue(bean: diagnosisInstance, field: "patient")}
								</td>

							</tr>
						</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${diagnosisInstanceTotal}" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>
