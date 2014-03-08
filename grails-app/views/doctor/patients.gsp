<%@ page import="com.itech.membership.Doctor"%>
<!DOCTYPE html>
<html>

<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'doctor.label', default: 'Doctor')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Patients<small> ${doctorInstance}</small>
				</h1>
			</div>
			<div id="show-doctor" class="content scaffold-show" role="main"
				style="padding-left: 100px">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<div class="row">
					<div class="span5">
						<table class="table table-bordered table-hover table-striped">
							<thead>
								<tr>

									<g:message code="doctor.patients.label" default="Patients" />

								</tr>
							</thead>
							<tbody>
								<g:each in="${doctorInstance.patients}" var="p">
									<tr>

										<td><g:link controller="patient" action="show"
												id="${p.id}">
												${p?.encodeAsHTML()}
											</g:link></td>


									</tr>
								</g:each>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>