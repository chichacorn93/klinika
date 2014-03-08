
<%@ page import="com.itech.revenue.CheckUpInvoice"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'checkUpInvoice.label', default: 'CheckUpInvoice')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					CheckUp <small>Records</small>
				</h1>
			</div>
			<div class="row">
				<div class="span3">
					<a href="${createLink(uri: '/checkUpInvoice/create')}"
						class="btn btn-success btn-mini">
						<h5>
							<span class="cus-user_add"></span> New Record
						</h5>
					</a>
				</div>
			</div>
			<div id="list-checkUpInvoice" class="content scaffold-list"
				role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<table class="table table-bordered table-hover table-striped" id="dataTablesList">
					<thead>
						<tr>

							<g:sortableColumn property="number"
								title="${message(code: 'checkUpInvoice.number.label', default: 'Number')}" />

							<g:sortableColumn property="description"
								title="${message(code: 'checkUpInvoice.description.label', default: 'Description')}" />

							<g:sortableColumn property="date"
								title="${message(code: 'checkUpInvoice.date.label', default: 'Date')}" />

							<th><g:message code="checkUpInvoice.doctor.label"
									default="Doctor" /></th>

							<g:sortableColumn property="hasBalance"
								title="${message(code: 'checkUpInvoice.hasBalance.label', default: 'Has Balance')}" />

							<th><g:message code="checkUpInvoice.patient.label"
									default="Patient" /></th>

						</tr>
					</thead>
					<tbody>
						<g:each in="${checkUpInvoiceInstanceList}" status="i"
							var="checkUpInvoiceInstance">
							<tr>

								<td><g:link action="show" id="${checkUpInvoiceInstance.id}">
										${fieldValue(bean: checkUpInvoiceInstance, field: "number")}
									</g:link></td>
								<td>
									${fieldValue(bean: checkUpInvoiceInstance, field: "description")}
								</td>

								<td><g:formatDate date="${checkUpInvoiceInstance.date}" /></td>
								
								<td>
									${fieldValue(bean: checkUpInvoiceInstance, field: "doctor")}
								</td>

								<td><g:formatBoolean
										boolean="${checkUpInvoiceInstance.hasBalance}" /></td>

								<td>
									${fieldValue(bean: checkUpInvoiceInstance, field: "patient")}
								</td>

							</tr>
						</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${checkUpInvoiceInstanceTotal}" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>
