package com.itech.patient

import com.itech.membership.Doctor;
import com.itech.revenue.Invoice;

import enums.Gender;
import enums.MaritalStatus;

class Patient {

	String firstName
	String middleName
	String lastName
	Date birthDate
	Gender gender
	MaritalStatus maritalStatus
	Date dateOfRegistration = new Date()
	String emailAddress
	String city
	String street
	String town
	String province
	String mobileNumber
	String telNumber
	boolean isActive = true
	boolean isDeleted
	Date lastUpdate = null
	String lastUpdatedBy
	 
	

	def springSecurityService
	static auditable = true
	
	static hasMany = [
		doctors: Doctor,
		diagnoses: Diagnosis,
		laboratoryResults: LaboratoryResult,
		medicalHistories: MedicalHistory,
		prescriptions: Prescription,
		referrals: Referral,
		vitalSigns: VitalSigns,
		invoices: Invoice,
		patientLog: PatientLog]


	static belongsTo = Doctor

	static constraints = {
		firstName blank:false, matches: /^([A-Z][a-z]+|\s|\.)+$/, size:1..50
		middleName blank: false, matches: /^[A-Za-z|\s]+$/, size:1..50
		lastName blank:false, matches: /^[A-Za-z|\s]+$/, size:1..50
		birthDate nullable:false, max: new Date()
		gender nullable:false
		maritalStatus nullable:false
		emailAddress email:true
		lastUpdate nullable:true 
		city blank:true
		street blank:true
		town blank:false
		province blank: false
		mobileNumber blank:true, matches: /^(0|63|\+63)\d{10}$/
	}

	String toString(){
		firstName + " " + middleName.substring(0, 1).toUpperCase() + ". " + lastName
	}

	int getAge(){
		def now = new Date()
		def age = birthDate.age
		if((now.month < birthDate.month) | (now.month == birthDate.month && now.day < birthDate.day) ){
			age - 1
		}
		return age
	}
	
	def beforeUpdate(){
		lastUpdate = new Date()
		def user = springSecurityService.currentUser
		if(springSecurityService.isLoggedIn()){
			lastUpdatedBy = user.toString() + " ($user.username)"
		}
		else if(!springSecurityService.isLoggedIn()){
			lastUpdatedBy = 'unknown'
		}
	}
	
//	def afterInsert(){
//		this.patientLog = new PatientLog(date: new Date(), patientAction: "patient profile created")
//		.addToPatient(patientLog)
//		.save(flush: true)
//		
//	}
}
