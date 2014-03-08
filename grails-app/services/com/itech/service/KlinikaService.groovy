package com.itech.service

class KlinikaService {
	
	boolean isDuplicate(def fname, def lname, def mname){
		def result
//		if(user.instanceOf(Doctor)){
//			result = User.withCriteria{
//				eq('firstName', user.firstName)
//				eq('lastName', user.lastName)
//				eq('middleName', user.middleName)
//			}
//		}
		if(user.instanceOf(Patient)){
			result = Patient.withCriteria{
				eq('firstName', fname)
				eq('lastName', lname)
				eq('middleName', mname)
			}
		}
	}

}
