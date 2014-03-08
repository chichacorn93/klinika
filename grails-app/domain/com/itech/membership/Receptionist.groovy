package com.itech.membership

class Receptionist extends User{

	static hasMany = [doctors: Doctor]
	static belongsTo = Doctor
	static auditable = true
	
    static constraints = {
    }
	
	String toString(){
		firstName + " " + middleName.substring(0, 1).toUpperCase() + ". " + lastName
		
	}
}
