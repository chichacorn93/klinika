package com.itech.revenue

class CheckUpInvoice extends Invoice{

	String description
	
	static transients = ['checkUpRevenue']
    static constraints = {
		description blank:false 
    }
	
	static double getCheckUpRevenue(){
		super.payments.each { checkUpRevenue += it }
		return checkUpRevenue
	}
}
