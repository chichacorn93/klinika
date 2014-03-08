
<%@ page import="com.itech.revenue.CheckUpInvoice"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'checkUpInvoice.label', default: 'CheckUpInvoice')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Details<small> checkup</small>
				</h1>
			</div>
			<div id="show-checkUpInvoice" class="content scaffold-show"
				role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<ol class="property-list checkUpInvoice">

					<g:if test="${checkUpInvoiceInstance?.number}">
						<li class="fieldcontain"><span id="number-label"
							class="property-label"><g:message
									code="checkUpInvoice.number.label" default="Number" /></span> <span
							class="property-value" aria-labelledby="number-label"><g:fieldValue
									bean="${checkUpInvoiceInstance}" field="number" /></span></li>
					</g:if>

					<g:if test="${checkUpInvoiceInstance?.description}">
						<li class="fieldcontain"><span id="description-label"
							class="property-label"><g:message
									code="checkUpInvoice.description.label" default="Description" /></span>

							<span class="property-value" aria-labelledby="description-label"><g:fieldValue
									bean="${checkUpInvoiceInstance}" field="description" /></span></li>
					</g:if>

					<g:if test="${checkUpInvoiceInstance?.date}">
						<li class="fieldcontain"><span id="date-label"
							class="property-label"><g:message
									code="checkUpInvoice.date.label" default="Date" /></span> <span
							class="property-value" aria-labelledby="date-label"><g:formatDate
									date="${checkUpInvoiceInstance?.date}" /></span></li>
					</g:if>

					<g:if test="${checkUpInvoiceInstance?.doctor}">
						<li class="fieldcontain"><span id="doctor-label"
							class="property-label"><g:message
									code="checkUpInvoice.doctor.label" default="Doctor" /></span> <span
							class="property-value" aria-labelledby="doctor-label"><g:link
									controller="doctor" action="show"
									id="${checkUpInvoiceInstance?.doctor?.id}">
									${checkUpInvoiceInstance?.doctor?.encodeAsHTML()}
								</g:link></span></li>
					</g:if>

					<g:if test="${checkUpInvoiceInstance?.hasBalance}">
						<li class="fieldcontain"><span id="hasBalance-label"
							class="property-label"><g:message
									code="checkUpInvoice.hasBalance.label" default="Has Balance" /></span>

							<span class="property-value" aria-labelledby="hasBalance-label"><g:formatBoolean
									boolean="${checkUpInvoiceInstance?.hasBalance}" /></span></li>
					</g:if>

					<g:if test="${checkUpInvoiceInstance?.patient}">
						<li class="fieldcontain"><span id="patient-label"
							class="property-label"><g:message
									code="checkUpInvoice.patient.label" default="Patient" /></span> <span
							class="property-value" aria-labelledby="patient-label"><g:link
									controller="patient" action="show"
									id="${checkUpInvoiceInstance?.patient?.id}">
									${checkUpInvoiceInstance?.patient?.encodeAsHTML()}
								</g:link></span></li>
					</g:if>

					<g:if test="${checkUpInvoiceInstance?.paymentMethod}">
						<li class="fieldcontain"><span id="paymentMethod-label"
							class="property-label"><g:message
									code="checkUpInvoice.paymentMethod.label"
									default="Payment Method" /></span> <span class="property-value"
							aria-labelledby="paymentMethod-label"><g:fieldValue
									bean="${checkUpInvoiceInstance}" field="paymentMethod" /></span></li>
					</g:if>

					<g:if test="${checkUpInvoiceInstance?.paymentOption}">
						<li class="fieldcontain"><span id="paymentOption-label"
							class="property-label"><g:message
									code="checkUpInvoice.paymentOption.label"
									default="Payment Option" /></span> <span class="property-value"
							aria-labelledby="paymentOption-label"><g:fieldValue
									bean="${checkUpInvoiceInstance}" field="paymentOption" /></span></li>
					</g:if>

					<g:if test="${checkUpInvoiceInstance?.payments}">
						<li class="fieldcontain"><span id="payments-label"
							class="property-label"><g:message
									code="checkUpInvoice.payments.label" default="Payments" /></span> <g:each
								in="${checkUpInvoiceInstance.payments}" var="p">
								<span class="property-value" aria-labelledby="payments-label"><g:link
										controller="payment" action="show" id="${p.id}">
										${p?.encodeAsHTML()}
									</g:link></span>
							</g:each></li>
					</g:if>

					<g:if test="${checkUpInvoiceInstance?.totalAmount}">
						<li class="fieldcontain"><span id="totalAmount-label"
							class="property-label"><g:message
									code="checkUpInvoice.totalAmount.label" default="Total Amount" /></span>

							<span class="property-value" aria-labelledby="totalAmount-label"><g:fieldValue
									bean="${checkUpInvoiceInstance}" field="totalAmount" /></span></li>
					</g:if>

				</ol>
				<g:form>
					<fieldset class="buttons">
						<g:hiddenField name="id" value="${checkUpInvoiceInstance?.id}" />
						<g:link class="edit" action="edit"
							id="${checkUpInvoiceInstance?.id}">
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<g:actionSubmit class="delete" action="delete"
							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</div>
		</div>
	</div>
</body>
</html>
