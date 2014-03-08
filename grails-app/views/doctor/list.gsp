
<%@ page import="com.itech.membership.Doctor"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'doctor.label', default: 'Doctor')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
<r:require module="export" />
<export:resource />
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Doctor <small>Records</small>
				</h1>
			</div>
			<div class="row">
				<div class="span3">
					<a href="${createLink(uri: '/doctor/create')}"
						class="btn btn-success btn-mini">
						<h5>
							<span class="cus-user_add"></span> New Record
						</h5>
					</a>
				</div>
			</div>
			<div id="list-doctor" class="content scaffold-list" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<table class="table table-bordered table-hover table-striped" id="dataTablesList">
					<thead>
						<tr>

							<g:sortableColumn property="lastName"
								title="${message(code: 'doctor.lastName.label', default: 'Last Name')}" />
								
							<g:sortableColumn property="firstName"
								title="${message(code: 'doctor.firstName.label', default: 'First Name')}" />

							<g:sortableColumn property="middleName"
								title="${message(code: 'doctor.middleName.label', default: 'Middle Name')}" />

							<g:sortableColumn property="address"
								title="${message(code: 'doctor.address.label', default: 'Address')}" />

							<g:sortableColumn property="email"
								title="${message(code: 'doctor.email.label', default: 'Email')}" />

							<g:sortableColumn property="mobileNum"
								title="${message(code: 'doctor.mobileNum.label', default: 'Mobile Num')}" />

						</tr>
					</thead>
					<tbody>
						<g:each in="${doctorInstanceList}" status="i" var="doctorInstance">
						<g:if test="${doctorInstanceList.get(i).isActive == true && doctorInstanceList.get(i).isDeleted == false}">
							<tr>

								<td><g:link action="show" id="${doctorInstance.id}">

										${fieldValue(bean: doctorInstance, field: "lastName")}
									</g:link></td>

								<td>
									${fieldValue(bean: doctorInstance, field: "firstName")}

								</td>

								<td>
									${fieldValue(bean: doctorInstance, field: "middleName")}
								</td>

								<td>
									${fieldValue(bean: doctorInstance, field: "address")}
								</td>

								<td>
									${fieldValue(bean: doctorInstance, field: "email")}
								</td>

								<td>
									${fieldValue(bean: doctorInstance, field: "mobileNum")}
								</td>

							</tr>
							</g:if>
						</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${doctorInstanceTotal}" />
					<export:formats />
				</div>
			</div>
		</div>
	</div>
</body>
</html>
