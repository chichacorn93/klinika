package com.itech.settings
import com.itech.membership.User

class PasswordResetController {

	def index() {
	}
	
	def reset(){
		
	}

	def resetPassword(){
		def springSecurityService
		def username = params.username
		def question = params.secQuestion
		def answer = params.secAnswer
		def password = params.newPassword
		
		println "username: $username \nquestion: $question \nanswer: $answer \npassword: $password"
		
		def user = User.findByUsername(username)
		println user.firstName
		if(!user.secAnswer == answer){
			
//			redirect(action: "index")
		}
		println "answer: $user.secAnswer"
		user.password = password.encodePassword()
		user.save()
//		redirect controller: 'login', action: 'auth'
	}
}
