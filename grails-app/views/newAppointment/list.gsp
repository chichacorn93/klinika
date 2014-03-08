
<%@ page import="com.itech.schedule.NewAppointment"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'newAppointment.label', default: 'NewAppointment')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					New Appointment <small>List</small>
				</h1>
			</div>
			<div class="row">
				<div class="span3">
					<a href="${createLink(uri: '/newAppointment/create')}"
						class="btn btn-success btn-mini">
						<h5>
							<span class="cus-user_add"></span> New Record
						</h5>
					</a>
				</div>
			</div>
			<div id="list-newAppointment" class="content scaffold-list"
				role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<table class="table table-bordered table-hover table-striped"
					id="dataTablesList">
					<thead>
						<tr>

							<g:sortableColumn property="lastName"
								title="${message(code: 'newAppointment.lastName.label', default: 'Last Name')}" />


							<g:sortableColumn property="firstName"
								title="${message(code: 'newAppointment.firstName.label', default: 'First Name')}" />

							<g:sortableColumn property="appointmentDate"
								title="${message(code: 'followUpAppointment.appointmentDate.label', default: 'Appointment Date')}" />

							<g:sortableColumn property="mobileNum"
								title="${message(code: 'newAppointment.mobileNum.label', default: 'Mobile #')}" />

						</tr>
					</thead>
					<tbody>
						<g:each in="${newAppointmentInstanceList}" status="i"
							var="newAppointmentInstance">
							<g:if test="${newAppointmentInstanceList.get(i).isAffirmed == false}">
							<tr>

								<td><g:link action="show" id="${newAppointmentInstance.id}">
										${fieldValue(bean: newAppointmentInstance, field: "lastName")}
									</g:link></td>

								<td>
									${fieldValue(bean: newAppointmentInstance, field: "firstName")}
								</td>

								<td><g:formatDate date="${newAppointmentInstance.appointmentDate}" /></td>

								<td>
									${fieldValue(bean: newAppointmentInstance, field: "mobileNum")}
								</td>

							</tr>
								</g:if>
						</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${newAppointmentInstanceTotal}" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>
