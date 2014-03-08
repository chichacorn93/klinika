package com.itech.patient

class LaboratoryResult {

	Date date = new Date()
	String details
	
	static belongsTo = [patient: Patient]
	
    static constraints = {
		details blank:false 
		
    }
}
