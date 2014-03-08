package com.itech.revenue

class Payment {
	
	Date date
	double amountpaid
	
	static belongsTo = [invoice: Invoice]
	
    static constraints = {
    }
}
