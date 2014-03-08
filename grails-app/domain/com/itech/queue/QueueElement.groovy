package com.itech.queue

import java.util.Date;

import com.itech.membership.Doctor;
import com.itech.patient.Patient;
import com.itech.schedule.FollowUpAppointment
import enums.AppointmentType;

class QueueElement {
	
	Date date
	AppointmentType appointmentType
	Patient patient
	String timeAdmitted
	String complaints
	Doctor doctor
	boolean hasTransaction
	boolean isDone

	
    static constraints = {
		date nullable:false 
		appointmentType nullable:false 
		patient nullable:false 
		timeAdmitted blank:false 
		complaints blank:false 
    }
	
	
	static List todayFollowUps(){
		def followUpInstanceList = FollowUpAppointment.withCriteria {
			def now = new Date().clearTime()
			between('appointmentDate', now-1, now+1)
			eq('isQueued', false)
		}
	}
}
