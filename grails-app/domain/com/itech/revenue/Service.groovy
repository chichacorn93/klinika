package com.itech.revenue

class Service {

	String name
	double serviceCharge
	
	static belongsTo = [serviceInvoice: ServiceInvoice]
	
    static constraints = {
    }
}
