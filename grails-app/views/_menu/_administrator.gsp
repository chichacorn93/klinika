	<ul class="nav pull-right top">
					<li><a href="${createLink(uri: '/home')}"><i class="icon-home"></i> Home</a></li>
					<li><a href="${createLink(uri: '/item')}"><i class="icon-list-alt"></i> Item</a></li>
					<li><a href="${createLink(uri: '/notification')}"><i class="icon-envelope"></i> Notification</a></li>
					<li class="dropdown">
						<a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icon-tasks"></i> Records <strong class="caret"></strong></a>
						<ul class="dropdown-menu">
							<li><a href="${createLink(uri: '/doctor-list')}"><span class="cus-user_suit" ></span> Doctor</a></li>
							<li><a href="${createLink(uri: '/patient-list')}"><span class="cus-user_green"></span> Patient</a></li>
							<li><a href="${createLink(uri: '/receptionist-list')}"><span class="cus-user_female" ></span> Receptionist</a></li>
						</ul>
					</li>
					<li><a href="#"><i class="icon-book"></i> Reports</a></li>
					<li class= "dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-user"></i> System User</a>
						
														<ul class="dropdown-menu">
								<li><a href="${createLink(uri: '/user-role-create')}"><span class="cus-user_gray" ></span> Assign Role</a></li>
							</ul>
							</li>
							
							
					<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-cog"></i></a>
							<ul class="dropdown-menu">
								<li><a href="${createLink(uri: '/changePassword')}"><span class="cus-user_edit" ></span> Change Password</a></li>
								<li><a href="${createLink(uri: '/settings')}"><span class="cus-cog_edit" ></span> Settings</a></li>
								<li><a href="${createLink(uri: '/logout')}"><span class="cus-door_out" ></span> Sign Out</a></li>
							</ul>
						</li>
</ul>
