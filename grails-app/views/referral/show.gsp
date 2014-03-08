
<%@ page import="com.itech.patient.Referral" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'referral.label', default: 'Referral')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-referral" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-referral" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list referral">
			
				<g:if test="${referralInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="referral.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${referralInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${referralInstance?.refferredTo}">
				<li class="fieldcontain">
					<span id="refferredTo-label" class="property-label"><g:message code="referral.refferredTo.label" default="Refferred To" /></span>
					
						<span class="property-value" aria-labelledby="refferredTo-label"><g:fieldValue bean="${referralInstance}" field="refferredTo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${referralInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="referral.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${referralInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${referralInstance?.patient}">
				<li class="fieldcontain">
					<span id="patient-label" class="property-label"><g:message code="referral.patient.label" default="Patient" /></span>
					
						<span class="property-value" aria-labelledby="patient-label"><g:link controller="patient" action="show" id="${referralInstance?.patient?.id}">${referralInstance?.patient?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${referralInstance?.refferredBy}">
				<li class="fieldcontain">
					<span id="refferredBy-label" class="property-label"><g:message code="referral.refferredBy.label" default="Refferred By" /></span>
					
						<span class="property-value" aria-labelledby="refferredBy-label"><g:link controller="doctor" action="show" id="${referralInstance?.refferredBy?.id}">${referralInstance?.refferredBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${referralInstance?.id}" />
					<g:link class="edit" action="edit" id="${referralInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
