
<%@ page import="com.itech.patient.LaboratoryResult"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'laboratoryResult.label', default: 'LaboratoryResult')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Patient <small>Labotatory Result</small>
				</h1>
			</div>
			<div class="row">
				<div class="span3">
					<a href="${createLink(uri: '/laboratoryResult-create')}"
						class="btn btn-success btn-mini">
						<h5>
							<span class="cus-user_add"></span> New Record
						</h5>
					</a>
				</div>
			</div>
			<div id="list-laboratoryResult" class="content scaffold-list" role="main">

				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<table  class="table table-bordered table-hover table-striped" id="dataTablesList">
					<thead>
						<tr>
							<g:sortableColumn property="details"
								title="${message(code: 'laboratoryResult.details.label', default: 'Details')}" />

							<g:sortableColumn property="date"
								title="${message(code: 'laboratoryResult.date.label', default: 'Date')}" />

							<th><g:message code="laboratoryResult.patient.label"
									default="Patient" /></th>

						</tr>
					</thead>
					<tbody>
						<g:each in="${laboratoryResultInstanceList}" status="i"
							var="laboratoryResultInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

								<td><g:link action="show"
										id="${laboratoryResultInstance.id}">
										${fieldValue(bean: laboratoryResultInstance, field: "details")}
									</g:link></td>

								<td><g:formatDate date="${laboratoryResultInstance.date}" /></td>

								<td>
									${fieldValue(bean: laboratoryResultInstance, field: "patient")}
								</td>

							</tr>
						</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${laboratoryResultInstanceTotal}" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>
