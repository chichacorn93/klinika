package enums

enum SecurityQuestion {
	
	Q1('first question'), Q2('second question'), Q3('third question'), Q4('fourth question'), Q5('fifth question')
	
	private final String question;
	
	SecurityQuestion(String question){
		this.question = question
	}
	
	String toString(){
		question
	}
	
	String getKey() { name() }

}
