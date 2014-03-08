<ul class="nav top">
	<li><a href="#"><i class="icon-calendar"></i> Set Appointment</a></li>
</ul>
<ul class="nav pull-right">
    <form class="form-inline top" action='${postUrl}' method='POST' id='loginForm' autocomplete='off'>
<%--		<input type="text" class="input-small span2" placeholder="Username" name='j_username' id='username'>	--%>
<%--		<input type="password" class="input-small span2" placeholder="Password" name='j_password' id='password'>--%>
<%--		<input href="${createLink(uri: '/login/auth')}" type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>--%>
<%--		<button type="submit" class="btn btn-success" id="submit" >--%>
<%--		<span class="cus-door_in" ></span> Sign in</button>--%>
			<a  href="${createLink(uri: '/login/auth')}"  class="btn btn-success" ><span class="cus-door_in" ></span>Sign In</a>
	</form>
</ul>

