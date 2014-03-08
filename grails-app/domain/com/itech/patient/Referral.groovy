package com.itech.patient

import com.itech.membership.Doctor;

class Referral {

	String address
	Date date = new Date()
	String refferredTo
	Doctor refferredBy
	
	static belongsTo = [patient: Patient]
	
    static constraints = {
		address blank:false
		refferredTo blank:false
    }
}
