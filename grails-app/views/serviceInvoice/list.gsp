
<%@ page import="com.itech.revenue.ServiceInvoice" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'serviceInvoice.label', default: 'ServiceInvoice')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-serviceInvoice" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-serviceInvoice" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="number" title="${message(code: 'serviceInvoice.number.label', default: 'Number')}" />
					
						<g:sortableColumn property="payer" title="${message(code: 'serviceInvoice.payer.label', default: 'Payer')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'serviceInvoice.date.label', default: 'Date')}" />
					
						<th><g:message code="serviceInvoice.doctor.label" default="Doctor" /></th>
					
						<g:sortableColumn property="hasBalance" title="${message(code: 'serviceInvoice.hasBalance.label', default: 'Has Balance')}" />
					
						<th><g:message code="serviceInvoice.patient.label" default="Patient" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${serviceInvoiceInstanceList}" status="i" var="serviceInvoiceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${serviceInvoiceInstance.id}">${fieldValue(bean: serviceInvoiceInstance, field: "number")}</g:link></td>
					
						<td>${fieldValue(bean: serviceInvoiceInstance, field: "payer")}</td>
					
						<td><g:formatDate date="${serviceInvoiceInstance.date}" /></td>
					
						<td>${fieldValue(bean: serviceInvoiceInstance, field: "doctor")}</td>
					
						<td><g:formatBoolean boolean="${serviceInvoiceInstance.hasBalance}" /></td>
					
						<td>${fieldValue(bean: serviceInvoiceInstance, field: "patient")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${serviceInvoiceInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
