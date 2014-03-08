package com.itech.membership

import com.itech.patient.Patient;

class Doctor extends User{
	
	String background
	String clinicHourStart
	String clinicHourEnd
	
	static auditable = true
	static hasMany = [receptionists: Receptionist, patients: Patient]
	
    static constraints = {
		background blank:false
		clinicHourStart blank:false
		clinicHourEnd blank:false
    }
	
	String toString(){
		"Dr. " + firstName + " " + middleName.substring(0, 1).toUpperCase() + ". " + lastName
	}
	
	def beforeUpdate(){
		lastUpdate = new Date()
		if (isDirty('password')) {
			encodePassword()
		}
	}
	
	def static User findUser(def username){
		def user = User.findWhere(username : username)
		
	}
}
