

<div class="control-group">
	<label class="control-label">Username</label>
	<div class="controls">
		<g:textField name="username" type="text" class="input-small span2"
			placeholder="Username" />
	</div>
</div>
<div class="control-group">
	<label class="control-label">Security Question</label>
	<div class="controls">
		<g:select name="secQuestion"
			from="${enums.SecurityQuestion?.values()}"
			keys="${enums.SecurityQuestion.values()*.name()}" required="" />
	</div>
</div>
<div class="control-group">
	<label class="control-label">Security Answer</label>
	<div class="controls">
		<g:textField name="secAnswer" required="" placeholder="New Password" />
	</div>
</div>
<div class="control-group">
	<label class="control-label">New Password</label>
	<div class="controls">
		<g:textField name="newPassword" type="password"
			class="input-small span2" placeholder="New Password" />
	</div>
</div>