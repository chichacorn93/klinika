package com.itech.revenue

import com.itech.membership.Doctor;
import com.itech.patient.Patient;

import enums.PaymentMethod;
import enums.PaymentOption;

abstract class Invoice {
	
	Date date = new Date()
	Doctor doctor
	boolean hasBalance
	int number
	PaymentMethod paymentMethod
	PaymentOption paymentOption
	double totalAmount

	static belongsTo = [patient: Patient]
	static hasMany = [payments: Payment]
	
    static constraints = {
		number unique:true
		totalAmount nullable:false 
		
    }
}
