
<%@ page import="com.itech.patient.PatientLog" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'patientLog.label', default: 'PatientLog')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-patientLog" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-patientLog" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="date" title="${message(code: 'patientLog.date.label', default: 'Date')}" />
					
						<th><g:message code="patientLog.patient.label" default="Patient" /></th>
					
						<g:sortableColumn property="patientAction" title="${message(code: 'patientLog.patientAction.label', default: 'Patient Action')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${patientLogInstanceList}" status="i" var="patientLogInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${patientLogInstance.id}">${fieldValue(bean: patientLogInstance, field: "date")}</g:link></td>
					
						<td>${fieldValue(bean: patientLogInstance, field: "patient")}</td>
					
						<td>${fieldValue(bean: patientLogInstance, field: "patientAction")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${patientLogInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
