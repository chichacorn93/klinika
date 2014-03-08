package enums

enum AppointmentType {
	
	FOLLOW_UP('follow up'),
	NEW_APPOINTMENT('new appointment')
	
	private final String type;
	
	AppointmentType(String type){
		this.type = type
	}
	
	@Override
	String toString(){
		type
	}

	String getKey() { name() }
}
