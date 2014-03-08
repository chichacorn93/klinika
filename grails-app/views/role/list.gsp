
<%@ page import="com.itech.membership.Role"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'role.label', default: 'Role')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="page-header">
				<h1>
					Role <small>List</small>
				</h1>
			</div>
			<div class="row">
				<div class="span3">
					<a href="${createLink(uri: '/role-create')}"
						class="btn btn-success btn-mini">
						<h5>
							<span class="cus-user_add"></span> New Record
						</h5>
					</a>
				</div>
			</div>
			<div id="list-role" class="content scaffold-list" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<table class="table table-bordered table-hover table-striped" id="dataTablesList">
					<thead>
						<tr>

							<g:sortableColumn property="authority"
								title="${message(code: 'role.authority.label', default: 'Authority')}" />

						</tr>
					</thead>
					<tbody>
						<g:each in="${roleInstanceList}" status="i" var="roleInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

								<td><g:link action="show" id="${roleInstance.id}">
										${fieldValue(bean: roleInstance, field: "authority")}
									</g:link></td>

							</tr>
						</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${roleInstanceTotal}" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>
