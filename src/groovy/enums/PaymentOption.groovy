package enums

enum PaymentOption {
	
	NOW("now"), AFTER_15_DAYS("after 15 days"), NEXT_APPOINTMENT("next appointment")
	
	final String option
	
	PaymentOption(String option){
		this.option = option
	}
	
	@Override
	String toString(){
		option
	}

	String getKey() { name() }
}
