package com.itech.membership

import enums.SecurityQuestion;

abstract class User {

	transient springSecurityService

	String firstName
	String middleName
	String lastName
	String address
	String email
	String mobileNum
	String telNum
	Date registrationDate = new Date()
	SecurityQuestion secQuestion
	String secAnswer
	boolean isDeleted
	boolean isActive = true
	String username
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	Date lastUpdate = null

	static transients = ['springSecurityService']

	static constraints = {
		firstName blank:false, matches: /^([A-Z][a-z]+|\s|\.)+$/, size:1..50
		middleName blank:false, matches: /^[A-Za-z|\s]+$/, size:1..50
		lastName blank:false, matches:  /^[A-Za-z|\s]+$/, size:1..50
		address blank:false, size:1..50
		email blank:true, email:true
		mobileNum blank:true, matches: /^(0|63|\+63)\d{10}$/
		telNum blank:true, matches: /^(\d+|-|\s)+$/
		registrationDate nullable:false
		secQuestion nullable:false
		secAnswer blank:false, size:1..30
		username blank: false, unique: true
		password blank: false, lenght:5..15,
		validator: {val, obj->
			if(val?.equalsIgnoreCase(obj.username)){
				return "password annot be username"
			}
		}
		lastUpdate nullable: true
	}

	static mapping = { password column: '`password`' }

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}

	def static User findUser(def username){
		def user = User.findWhere(username : username)
	}
	
	
}
