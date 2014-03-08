
<%@ page import="com.itech.schedule.FollowUpAppointment"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'followUpAppointment.label', default: 'FollowUpAppointment')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Follow-up <small>List</small>
				</h1>
			</div>
						<div class="row">
				<div class="span3">
					<a href="${createLink(uri: '/followUpAppointment/create')}"
						class="btn btn-success btn-mini">
						<h5>
							<span class="cus-user_add"></span> New Record
						</h5>
					</a>
				</div>
			</div>
			<div id="list-followUpAppointment" class="content scaffold-list"
				role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<table class="table table-bordered table-hover table-striped" id="dataTablesList">
					<thead>
						<tr>

							<g:sortableColumn property="appointmentDate"
								title="${message(code: 'followUpAppointment.appointmentDate.label', default: 'Appointment Date')}" />

							<g:sortableColumn property="description"
								title="${message(code: 'followUpAppointment.description.label', default: 'Description')}" />

							<th><g:message code="followUpAppointment.doctor.label"
									default="Doctor" /></th>

							<th><g:message code="followUpAppointment.patient.label"
									default="Patient" /></th>

						</tr>
					</thead>
					<tbody>
						<g:each in="${followUpAppointmentInstanceList}" status="i"
							var="followUpAppointmentInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

								<td><g:link action="show"
										id="${followUpAppointmentInstance.id}">
										${fieldValue(bean: followUpAppointmentInstance, field: "appointmentDate")}
									</g:link></td>

								<td>
									${fieldValue(bean: followUpAppointmentInstance, field: "description")}
								</td>

								<td>
									${fieldValue(bean: followUpAppointmentInstance, field: "doctor")}
								</td>

								<td>
									${fieldValue(bean: followUpAppointmentInstance, field: "patient")}
								</td>

							</tr>
						</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${followUpAppointmentInstanceTotal}" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>
