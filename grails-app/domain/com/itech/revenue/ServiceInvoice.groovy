package com.itech.revenue

class ServiceInvoice extends Invoice{

	static hasMany = [services: Service]
	
    static constraints = {		
    }
	
}
