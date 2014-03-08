
<%@ page import="com.itech.revenue.ServiceInvoice" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'serviceInvoice.label', default: 'ServiceInvoice')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-serviceInvoice" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-serviceInvoice" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list serviceInvoice">
			
				<g:if test="${serviceInvoiceInstance?.number}">
				<li class="fieldcontain">
					<span id="number-label" class="property-label"><g:message code="serviceInvoice.number.label" default="Number" /></span>
					
						<span class="property-value" aria-labelledby="number-label"><g:fieldValue bean="${serviceInvoiceInstance}" field="number"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInvoiceInstance?.payer}">
				<li class="fieldcontain">
					<span id="payer-label" class="property-label"><g:message code="serviceInvoice.payer.label" default="Payer" /></span>
					
						<span class="property-value" aria-labelledby="payer-label"><g:fieldValue bean="${serviceInvoiceInstance}" field="payer"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInvoiceInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="serviceInvoice.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${serviceInvoiceInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInvoiceInstance?.doctor}">
				<li class="fieldcontain">
					<span id="doctor-label" class="property-label"><g:message code="serviceInvoice.doctor.label" default="Doctor" /></span>
					
						<span class="property-value" aria-labelledby="doctor-label"><g:link controller="doctor" action="show" id="${serviceInvoiceInstance?.doctor?.id}">${serviceInvoiceInstance?.doctor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInvoiceInstance?.hasBalance}">
				<li class="fieldcontain">
					<span id="hasBalance-label" class="property-label"><g:message code="serviceInvoice.hasBalance.label" default="Has Balance" /></span>
					
						<span class="property-value" aria-labelledby="hasBalance-label"><g:formatBoolean boolean="${serviceInvoiceInstance?.hasBalance}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInvoiceInstance?.patient}">
				<li class="fieldcontain">
					<span id="patient-label" class="property-label"><g:message code="serviceInvoice.patient.label" default="Patient" /></span>
					
						<span class="property-value" aria-labelledby="patient-label"><g:link controller="patient" action="show" id="${serviceInvoiceInstance?.patient?.id}">${serviceInvoiceInstance?.patient?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInvoiceInstance?.paymentMethod}">
				<li class="fieldcontain">
					<span id="paymentMethod-label" class="property-label"><g:message code="serviceInvoice.paymentMethod.label" default="Payment Method" /></span>
					
						<span class="property-value" aria-labelledby="paymentMethod-label"><g:fieldValue bean="${serviceInvoiceInstance}" field="paymentMethod"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInvoiceInstance?.paymentOption}">
				<li class="fieldcontain">
					<span id="paymentOption-label" class="property-label"><g:message code="serviceInvoice.paymentOption.label" default="Payment Option" /></span>
					
						<span class="property-value" aria-labelledby="paymentOption-label"><g:fieldValue bean="${serviceInvoiceInstance}" field="paymentOption"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInvoiceInstance?.payments}">
				<li class="fieldcontain">
					<span id="payments-label" class="property-label"><g:message code="serviceInvoice.payments.label" default="Payments" /></span>
					
						<g:each in="${serviceInvoiceInstance.payments}" var="p">
						<span class="property-value" aria-labelledby="payments-label"><g:link controller="payment" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInvoiceInstance?.services}">
				<li class="fieldcontain">
					<span id="services-label" class="property-label"><g:message code="serviceInvoice.services.label" default="Services" /></span>
					
						<g:each in="${serviceInvoiceInstance.services}" var="s">
						<span class="property-value" aria-labelledby="services-label"><g:link controller="service" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInvoiceInstance?.totalAmount}">
				<li class="fieldcontain">
					<span id="totalAmount-label" class="property-label"><g:message code="serviceInvoice.totalAmount.label" default="Total Amount" /></span>
					
						<span class="property-value" aria-labelledby="totalAmount-label"><g:fieldValue bean="${serviceInvoiceInstance}" field="totalAmount"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${serviceInvoiceInstance?.id}" />
					<g:link class="edit" action="edit" id="${serviceInvoiceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
