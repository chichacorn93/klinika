
<%@ page import="com.itech.patient.Referral" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'referral.label', default: 'Referral')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-referral" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-referral" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="address" title="${message(code: 'referral.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="refferredTo" title="${message(code: 'referral.refferredTo.label', default: 'Refferred To')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'referral.date.label', default: 'Date')}" />
					
						<th><g:message code="referral.patient.label" default="Patient" /></th>
					
						<th><g:message code="referral.refferredBy.label" default="Refferred By" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${referralInstanceList}" status="i" var="referralInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${referralInstance.id}">${fieldValue(bean: referralInstance, field: "address")}</g:link></td>
					
						<td>${fieldValue(bean: referralInstance, field: "refferredTo")}</td>
					
						<td><g:formatDate date="${referralInstance.date}" /></td>
					
						<td>${fieldValue(bean: referralInstance, field: "patient")}</td>
					
						<td>${fieldValue(bean: referralInstance, field: "refferredBy")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${referralInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
