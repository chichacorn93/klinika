package enums

enum ActivityType {
	
	PURCHASE('purchase'), 
	CHECK_UP('check up'), 
	APPOINTMENT_BALANCE_PAYMENT('appointment balance payment'), 
	FOLLOW_UP_CHECK_UP('follow up check-up'),
	CHECK_UP_PAYMENT('check-up payment'),
	FORMS_PRESCRIPTION('forms prescription'),
	FORMS_LAB_REQUEST('forms lab request'),
	ITEM_BALANCE_PAYMENT('item balance payment'),
	LOGIN('login'),
	LOGOUT('logout')
	
	private final String type;
	
	ActivityType(String type){
		this.type = type
	}
	
	String toString(){
		type
	}
	
	String getKey() { name() }

}
