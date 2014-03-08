package enums

enum PaymentMethod {

	CASH("cash"),DISCOUNT("discount")
	
	final String method
	
	PaymentMethod(String method){
		this.method = method
	}
	
	@Override
	String toSting(){
		method
	}
	
	String getKey() { name() }
}
