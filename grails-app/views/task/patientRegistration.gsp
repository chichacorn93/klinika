<!doctype html>
<html>
<head>
	<title>Home</title>
	<meta name="layout" content="main" />
</head>
<body>
	<div class="content">
    	<div class="container">
        	<div class="row topSlider">
				<div class="span3">
					<g:render template="/_menu/task"/>
				</div>
				<div class="span9">
					<h3 class="center">	Patient Registration</h3>
					<div class="top">
					<form class="form-horizontal bCenter">
								<g:render template="/patientRecord/form"/>
						</form>
				</div>
				<div class="alignCenter">
								<button type="submit" class="btn btn-large btn-primary"> <span class="cus-user_go"></span> Register</button>
				</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
