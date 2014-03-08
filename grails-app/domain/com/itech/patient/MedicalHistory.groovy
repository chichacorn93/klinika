package com.itech.patient

class MedicalHistory {

	String pastIllness
	String pastMedications
	
	static belongsTo = [patient: Patient]
	
    static constraints = {
		pastIllness blank:false
		pastMedications blank:false
    }
}
