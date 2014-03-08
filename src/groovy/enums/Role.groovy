package enums

enum Role {
	
	ROLE_ADMIN('admin'), ROLE_RECEPTIONIST('receptionist'), ROLE_DOCTOR('doctor')
	
	private final String role
	
	Role(String role){
		this.role = role
	}
	
	@Override
	String toString(){
		role
	}

	String getKey() { name() }
}
