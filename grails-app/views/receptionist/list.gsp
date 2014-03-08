
<%@ page import="com.itech.membership.Receptionist"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'receptionist.label', default: 'Receptionist')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Receptionist <small>Records</small>
				</h1>
			</div>
			<div class="row">
				<div class="span3">
					<a href="${createLink(uri: '/receptionist-create')}"
						class="btn btn-success btn-mini">
						<h5>
							<span class="cus-user_add"></span> New Record
						</h5>
					</a>
				</div>
			</div>
			<div id="list-receptionist" class="content scaffold-list" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<table class="table table-bordered table-hover table-striped"
					id="dataTablesList">
					<thead>
						<tr>

							<g:sortableColumn property="firstName"
								title="${message(code: 'receptionist.firstName.label', default: 'First Name')}" />

							<g:sortableColumn property="middleName"
								title="${message(code: 'receptionist.middleName.label', default: 'Middle Name')}" />

							<g:sortableColumn property="lastName"
								title="${message(code: 'receptionist.lastName.label', default: 'Last Name')}" />

							<g:sortableColumn property="address"
								title="${message(code: 'receptionist.address.label', default: 'Address')}" />

							<g:sortableColumn property="email"
								title="${message(code: 'receptionist.email.label', default: 'Email')}" />

							<g:sortableColumn property="mobileNum"
								title="${message(code: 'receptionist.mobileNum.label', default: 'Mobile Num')}" />

						</tr>
					</thead>
					<tbody>
						<g:each in="${receptionistInstanceList}" status="i"
							var="receptionistInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

								<td><g:link action="show" id="${receptionistInstance.id}">
										${fieldValue(bean: receptionistInstance, field: "firstName")}
									</g:link></td>

								<td>
									${fieldValue(bean: receptionistInstance, field: "middleName")}
								</td>

								<td>
									${fieldValue(bean: receptionistInstance, field: "lastName")}
								</td>

								<td>
									${fieldValue(bean: receptionistInstance, field: "address")}
								</td>

								<td>
									${fieldValue(bean: receptionistInstance, field: "email")}
								</td>

								<td>
									${fieldValue(bean: receptionistInstance, field: "mobileNum")}
								</td>

							</tr>
						</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${receptionistInstanceTotal}" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>
