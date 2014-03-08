
<%@ page import="com.itech.schedule.Event"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'event.label', default: 'Event')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Event <small>List</small>
				</h1>
			</div>
			<div class="row">
				<div class="span3">
					<a href="${createLink(uri: '/event/create')}"
						class="btn btn-success btn-mini">
						<h5>
							<span class="cus-user_add"></span> New Record
						</h5>
					</a>
				</div>
				<div class="row">
					<g:form method="post" class="form-horizontal">
						<fieldset class="form" style="padding-left: 300px">
							<div class="control-group">
								Start:
								<g:datePicker name="startDate" value="${new Date()}"
									precision="day" noSelection="['':'-Choose-']" />
							</div>
							<div class="control-group">
								End:
								<g:datePicker name="endDate" value="${new Date()}"
									precision="day" noSelection="['':'-Choose-']" />
								<span><g:actionSubmit class="btn btn-info" action="range"
										value="Go" /> </span>
							</div>
						</fieldset>
					</g:form>
				</div>

			</div>
			<div id="list-event" class="content scaffold-list" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<table class="table table-bordered table-hover table-striped"
					id="dataTablesList">
					<thead>
						<tr>

							<g:sortableColumn property="name"
								title="${message(code: 'event.name.label', default: 'Name')}" />

							<g:sortableColumn property="location"
								title="${message(code: 'event.location.label', default: 'Location')}" />

							<g:sortableColumn property="details"
								title="${message(code: 'event.details.label', default: 'Details')}" />

							<th><g:message code="event.doctor.label" default="Doctor" /></th>

							<g:sortableColumn property="startDate"
								title="${message(code: 'event.startDate.label', default: 'Start Date')}" />

							<g:sortableColumn property="endDate"
								title="${message(code: 'event.endDate.label', default: 'End Date')}" />

						</tr>
					</thead>
					<tbody>
						<g:each in="${eventInstanceList}" status="i" var="eventInstance">
							<tr>

								<td><g:link action="show" id="${eventInstance.id}">
										${fieldValue(bean: eventInstance, field: "name")}
									</g:link></td>

								<td>
									${fieldValue(bean: eventInstance, field: "location")}
								</td>

								<td>
									${fieldValue(bean: eventInstance, field: "details")}
								</td>

								<td>
									${fieldValue(bean: eventInstance, field: "doctor")}
								</td>

								<td><g:formatDate date="${eventInstance.startDate}" /></td>

								<td><g:formatDate date="${eventInstance.endDate}" /></td>

							</tr>
						</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${eventInstanceTotal}" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>
