package com.itech.patient

import com.itech.membership.Doctor;

class Prescription {

	String clinicAddress
	String clinicMobileNumber
	String clinicName
	String clinicTelNumber
	Date date = new Date()
	String description
	Doctor doctor
	
	static belongsTo = [patient: Patient]
	
    static constraints = {
		clinicAddress blank:false
		description blank:false
		clinicName blank:false
		clinicMobileNumber matches: /^(0|63|\+63)\d{10}$/
		clinicTelNumber matches:  /^(\d+|-|\s)+$/
    }
}
