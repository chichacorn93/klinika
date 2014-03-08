package com.itech.schedule

import com.itech.membership.Doctor;

class Event {

	String name
	String location
	String details
	Doctor doctor
	Date startDate
	Date endDate
	
	
    static constraints = {
		name blank:false 
		location blank:false 
		details blank:false 
		doctor nullable:false 
		startDate nullable:false, min: new Date()
		endDate nullable:false, min: new Date()
    }
}
