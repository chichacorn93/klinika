package com.itech.schedule

import com.itech.membership.Doctor;

class Appointment {

	Date appointmentDate = new Date()
	Doctor doctor
	String description
	
    static constraints = {
		appointmentDate nullable:false
		description blank:false
    }
	
}
