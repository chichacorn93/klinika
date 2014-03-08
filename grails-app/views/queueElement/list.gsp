
<%@ page import="com.itech.queue.QueueElement"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'queueElement.label', default: 'QueueElement')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Queue <small>List</small>
				</h1>
			</div>
			<div class="row">
				<div class="span3">
					<a href="${createLink(uri: '/queueElement/create')}"
						class="btn btn-success btn-mini">
						<h5>
							<span class="cus-user_add"></span> Add Queue
						</h5>
					</a>
					<g:link class="btn btn-info" controller="queueElement" action="clear">Clear</g:link>
				</div>
			</div>
			<div id="list-queueElement" class="content scaffold-list" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<table class="table table-bordered table-hover table-striped"
					id="dataTablesList">
					<thead>
						<tr>

							<g:sortableColumn property="date"
								title="${message(code: 'queueElement.date.label', default: 'Date')}" />

							<g:sortableColumn property="appointmentType"
								title="${message(code: 'queueElement.appointmentType.label', default: 'Appointment Type')}" />

							<th><g:message code="queueElement.patient.label"
									default="Patient" /></th>

							<g:sortableColumn property="timeAdmitted"
								title="${message(code: 'queueElement.timeAdmitted.label', default: 'Time Admitted')}" />

							<g:sortableColumn property="complaints"
								title="${message(code: 'queueElement.complaints.label', default: 'Complaints')}" />

							<th><g:message code="queueElement.doctor.label"
									default="Doctor" /></th>

						</tr>
					</thead>
					<tbody>
						<g:each in="${queueElementInstanceList}" status="i"
							var="queueElementInstance">
							<g:if test="${queueElementInstance.isDone == false }">
								<tr>
									<td><g:link action="show" id="${queueElementInstance.id}">
											${fieldValue(bean: queueElementInstance, field: "date")}
										</g:link></td>

									<td>
										${fieldValue(bean: queueElementInstance, field: "appointmentType")}
									</td>

									<td>
										${fieldValue(bean: queueElementInstance, field: "patient")}
									</td>

									<td>
										${fieldValue(bean: queueElementInstance, field: "timeAdmitted")}
									</td>

									<td>
										${fieldValue(bean: queueElementInstance, field: "complaints")}
									</td>

									<td>
										${fieldValue(bean: queueElementInstance, field: "doctor")}
									</td>

								</tr>
							</g:if>
						</g:each>
					</tbody>
				</table>
				<div class="pagination">
<%--					<g:paginate total="${queueElementInstanceTotal}" />--%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
