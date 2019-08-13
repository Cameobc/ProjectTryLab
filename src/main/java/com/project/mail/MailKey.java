package com.project.mail;

import java.util.Random;

public class MailKey {

	public String createKey() {
		StringBuffer key= new StringBuffer();
		Random random = new Random();
		
		//12자리의 인증키 발생
		for(int i=0;i<12;i++) {
			key.append(random.nextInt(10));
		}
		
		return key.toString();
	}
	
	public void sendMail() throws Exception{
		
	}
	
}
