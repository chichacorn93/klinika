package com.itech.patient

class PatientLog {
	
	Date date
	String patientAction

	static belongsTo = [patient: Patient]
    static constraints = {
    }
	
//	def static log(Patient p, String action){
//		println p.firstName
//		p.patientLog = new PatientLog(date: new Date(), action: action).save()
//	}
}
