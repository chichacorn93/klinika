
<%@ page import="com.itech.patient.Prescription" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prescription.label', default: 'Prescription')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-prescription" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-prescription" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="clinicAddress" title="${message(code: 'prescription.clinicAddress.label', default: 'Clinic Address')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'prescription.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="clinicName" title="${message(code: 'prescription.clinicName.label', default: 'Clinic Name')}" />
					
						<g:sortableColumn property="clinicMobileNumber" title="${message(code: 'prescription.clinicMobileNumber.label', default: 'Clinic Mobile Number')}" />
					
						<g:sortableColumn property="clinicTelNumber" title="${message(code: 'prescription.clinicTelNumber.label', default: 'Clinic Tel Number')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'prescription.date.label', default: 'Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${prescriptionInstanceList}" status="i" var="prescriptionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${prescriptionInstance.id}">${fieldValue(bean: prescriptionInstance, field: "clinicAddress")}</g:link></td>
					
						<td>${fieldValue(bean: prescriptionInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: prescriptionInstance, field: "clinicName")}</td>
					
						<td>${fieldValue(bean: prescriptionInstance, field: "clinicMobileNumber")}</td>
					
						<td>${fieldValue(bean: prescriptionInstance, field: "clinicTelNumber")}</td>
					
						<td><g:formatDate date="${prescriptionInstance.date}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${prescriptionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
