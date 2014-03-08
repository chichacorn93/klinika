package enums

enum ItemType {
	
	MEDICINE('Medicine'), EQUIPMENT('Equipment'), VACCINE('Vaccine')
	
	private final String type;
	
	ItemType(String type){
		this.type = type
	}
	
	String toString(){
		type
	}
	
	String getKey() { name() }

}
