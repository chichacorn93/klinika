<!doctype html>
<html>
<head>
<title>Reset Password</title>
<meta name="layout" content="main" />
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="page-header">
					<h1>
						Password <small>Reset</small>
					</h1>
				</div>
				<div class="row">
					<div class="span6 offset3">
						<h4 class="widget-header">
							<i class="icon-lock"></i> System User
						</h4>
						<div class="widget-body">
							<div class="center-align">
								<g:form action="resetPassword" class="form-horizontal form-signin-signup">
									<fieldset class="form">
										<g:render template="form" />
									</fieldset>
									<fieldset class="buttons">
										<g:submitButton name="reset" class="btn btn-large btn-danger"
											value="Submit" />
									</fieldset>
									<%--									<button type="submit" class="btn btn-large btn-danger">--%>
									<%--										<span class="cus-disk"></span> Submit--%>
									<%--									</button>--%>
								</g:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
