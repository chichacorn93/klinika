package com.itech.schedule

class NewAppointment extends Appointment{

	String firstName
	String lastName
	String middleName
	String mobileNum
	boolean isAffirmed
	
    static constraints = {
		firstName blank:false 
		lastName blank:false 
		middleName blank:false
		mobileNum blank:true	
		isAffirmed nullable:false 
		
    }
	
	def clearAppointment(){
	
	}
}
