class UrlMappings {
	
	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		"500"(view:'/error')
		
		/*
		 * Pages without controller
		 */
		"/home"(view:"/home/home")
		"/homeConsultationSchedule"(view:"/task/consultationSchedule")
		"/homeDoctorAppointment"(view:"/task/doctorAppointment")
		"/homeDoctorSchedule"(view:"/task/doctorSchedule")
		"/homeHelp"(view:"/task/help")
		"/homePatientConsultation"(view:"/task/patientConsultation")
		"/homePatientQueueList"(view:"/task/patientQueueList")
		"/homePatientRegistration"(view:"/task/patientRegistration")
		"/homePendingAppointment"(view:"/task/pendingAppointment")
		
		"/item"(view:"/item/list")
		"/itemCreate"(view:"/item/create")
		
		"/notification"(view:"/notification/notification")
		
		"/doctor-list"(view:"/doctor/list")
		"/patient-list"(view:"/patient/list")
		"/receceptionist-list"(view:"/receptionist/list")
		"/admin-list"(view:"/admin/list")
		"/role-list"(view:"/role/list")
		"/user-role-list"(view:"/userRole/list")
		"/list-deactivated"(view:"/patient/listDeactivated")
		//"/list-removed"(view:"/patient/listRemoved")
		
		"/doctor-create"(view:"/doctor/create")
		"/patient-create"(view:"/patient/create")
		"/receptionist-create"(view:"/receptionist/create")
		"/admin-create"(view:"/admin/create")
		"/role-create"(view:"/role/create")
		"/user-role-create"(view:"/userRole/create")
		"/diagnosis-create"(view:"/diagnosis/create")
		"/medicalHistory-create"(view:"/medicalHistory/create")
		"/laboratoryResult-create"(view:"/laboratoryResult/create")
		"/followUpAppoinment-create"(view:"/followUpAppoinment/create")
		"/newAppoinment-create"(view:"/newAppoinment/create")
		
		"/doctor-update"(view:"/doctor/edit")
		"/patient-updatet"(view:"/patient/edit")
		"/receptionist-update"(view:"/receptionist/edit")
		"/admin-update"(view:"/admin/edit")
		"/role-update"(view:"/role/edit")
		"/user-role-update"(view:"/userRole/edit")
		
		"/doctor-show"(view:"/doctor/show/")
		"/patient-show"(view:"/patient/show")
		"/receptionist-show"(view:"/receptionist/show")
		"/admin-show"(view:"/admin/show")
		"/role-show"(view:"/role/show")
		"/user-role-show"(view:"/userRole/show")
		"/patientRecord"(view:"/patientRecord/show")
		
		"/changePassword"(view:"/options/changePassword")
		"/settings"(view:"/options/settings")
		
		
		
		
	   /* 
		* Pages with controller
		* WARN: No domain/controller should be named "api" or "mobile" or "web"!
		*/
		"/doctor-list"	{
			controller	= 'doctor'
			action		= { 'list' }
			view		= { 'list' }
		}
		"/patientList"	{
			controller	= 'doctor'
			action		= { 'patientList' }
			view		= { 'patientList' }
		}
		"/doctor-create"	{
			controller	= 'doctor'
			action		= { 'create' }
			view		= { 'create' }
		}
		"/doctor-show"	{
			controller	= 'doctor'
			action		= { 'show' }
			view		= { 'show' }
		}
		"/doctor-update"	{
			controller	= 'doctor'
			action		= { 'edit' }
			view		= { 'edit' }
		}
		"/receptionist-list"{
			controller	= 'receptionist'
			action		= { 'list' }
			view		= { 'list' }
		}
		"/receptionist-create"	{
			controller	= 'receptionist'
			action		= { 'create' }
			view		= { 'create' }
		}
		"/receptionist-update"	{
			controller	= 'receptionist'
			action		= { 'edit' }
			view		= { 'edit' }
		}
		"/receptionist-show"	{
			controller	= 'receptionist'
			action		= { 'show' }
			view		= { 'show' }
		}
		"/admin-create"	{
			controller	= 'admin'
			action		= { 'create' }
			view		= { 'create' }
		}
		"/admin-list"	{
			controller	= 'admin'
			action		= { 'list' }
			view		= { 'list' }
		}
		"/admin-update"	{
			controller	= 'admin'
			action		= { 'edit' }
			view		= { 'edit' }
		}
		"/admin-show"	{
			controller	= 'admin'
			action		= { 'show' }
			view		= { 'show' }
		}
		
		"/patient-list"{
			controller	= 'patient'
			action		= { 'list' }
			view		= { 'list' }
		}
		"/patient-create"{
			controller	= 'patient'
			action		= { 'create' }
			view		= { 'create' }
		}
		"/patient-update"{
			controller	= 'patient'
			action		= { 'edit' }
			view		= { 'edit' }
		}
		"/patient-show"{
			controller	= 'patient'
			action		= { 'show' }
			view		= { 'show' }
		}
		"/role-create"	{
			controller	= 'role'
			action		= { 'create' }
			view		= { 'create' }
		}
		"/role-list"	{
			controller	= 'role'
			action		= { 'list' }
			view		= { 'list' }
		}
		"/role-update"	{
			controller	= 'role'
			action		= { 'edit' }
			view		= { 'edit' }
		}
		"/role-show"	{
			controller	= 'role'
			action		= { 'show' }
			view		= { 'show' }
		}
		"/user-role-create"	{
			controller	= 'userRole'
			action		= { 'create' }
			view		= { 'create' }
		}
		"/user-role-list"	{
			controller	= 'userRole'
			action		= { 'list' }
			view		= { 'list' }
		}
		"/user-role-update"	{
			controller	= 'userRole'
			action		= { 'edit' }
			view		= { 'edit' }
		}
		"/user-role-show"	{
			controller	= 'userRole'
			action		= { 'show' }
			view		= { 'show' }
		}
		"/diagnosis-create"	{
			controller	= 'diagnosis'
			action		= { 'create' }
			view		= { 'create' }
		}
		"/medicalHistory-create"	{
			controller	= 'medicalHistory'
			action		= { 'create' }
			view		= { 'create' }
		}
		"/laboratoryResult-create"	{
			controller	= 'laboratoryResult'
			action		= { 'create' }
			view		= { 'create' }
		}
		"/list-removed"	{
			controller	= 'patient'
			action		= { 'listRemoved' }
			view		= { 'listRemoved' }
		}
		"/list-removed"	{
			controller	= 'doctor'
			action		= { 'listRemoved' }
			view		= { 'listRemoved' }
		}
		"/list-deactivated"	{
			controller	= 'doctor'
			action		= { 'listDeactivated' }
			view		= { 'listDeactivated' }
		}
		"/newAppointment-create"	{
			controller	= 'newAppointment'
			action		= { 'create' }
			view		= { 'create' }
		}
		"/followUpAppointment-create"	{
			controller	= 'followUpAppointment'
			action		= { 'create' }
			view		= { 'create' }
		}
//		"/range"	{
//			controller	= 'event'
//			action		= { 'range' }
//			view		= { 'list' }
//		}
//	
	
		
		"/$controller/$action?/$id?"{
			constraints {
				controller(matches:/^((?!(api|mobile|web)).*)$/)
			  }
		}
	}
}
