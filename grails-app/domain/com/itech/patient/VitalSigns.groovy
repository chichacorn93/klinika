package com.itech.patient

class VitalSigns {
	
	Date date = new Date()
	Date lastMenstruationPeriod
	String bloodPressure
	String pulseRate
	double height //in cm
	double weight //in kg

	static belongsTo = [patient: Patient]
	
    static constraints = {
		bloodPressure blank:false, matches: /^\d+-\d+$/
		pulseRate blank:false
		height blank: false
		weight blank: false
    }
}
