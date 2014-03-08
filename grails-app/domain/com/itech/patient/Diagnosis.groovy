package com.itech.patient

import com.itech.membership.Doctor;

class Diagnosis {

	Date date = new Date()
	String details
	Doctor doctor
	
	static belongsTo = [patient: Patient]
	
    static constraints = {
		details blank:false 
		doctor nullable:false 
		
    }
	
	String toString(){
		date
	}
}
