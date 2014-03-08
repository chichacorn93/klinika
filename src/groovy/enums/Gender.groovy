package enums

enum Gender {
	
	MALE('male'), FEMALE('female')
	
	private final String gender
	
	Gender(String gender){
		this.gender = gender
	}
	
	@Override
	String toString(){
		gender
	}

	String getKey() { name() }
}
