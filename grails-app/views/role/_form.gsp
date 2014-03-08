<%@ page import="com.itech.membership.Role" %>



<div class="control-group ${hasErrors(bean: roleInstance, field: 'authority', 'error')} required">
	<label class="control-label"  for="authority">
		<g:message code="role.authority.label" default="Authority" />
		<span class="required-indicator">*</span>
	</label><div class="controls">
	<g:textField name="authority" required="" value="${roleInstance?.authority}"/>
</div></div>

