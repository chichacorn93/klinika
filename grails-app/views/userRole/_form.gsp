<%@ page import="com.itech.membership.UserRole"%>



<div
	class="control-group ${hasErrors(bean: userRoleInstance, field: 'user', 'error')} required">
	<label class="control-label" for="user"> <g:message
			code="userRole.user.label" default="User" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:select id="user" name="user.id"
			from="${com.itech.membership.User.list()}" optionKey="id" required=""
			value="${userRoleInstance?.user?.id}" class="many-to-one" />
	</div>
</div>

<div
	class="control-group ${hasErrors(bean: userRoleInstance, field: 'role', 'error')} required">
	<label class="control-label" for="role"> <g:message
			code="userRole.role.label" default="Role" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:select id="role" name="role.id"
			from="${com.itech.membership.Role.list()}" optionKey="id" required=""
			value="${userRoleInstance?.role?.id}" class="many-to-one" />
	</div>
</div>

