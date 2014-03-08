package enums

enum MaritalStatus {
	
	SINGLE('single'), MARRIED('married'), WIDOWED('widowed')
	
	private final String status
	
	MaritalStatus(String status){
		this.status = status
	}
	
	@Override
	String toString(){
		status
	}
	
	String getKey() { name() }

}
