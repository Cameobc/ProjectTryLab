package com.project.mail;

import java.util.Random;

import javax.inject.Inject;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.project.member.MemberVO;

@Service
public class MailService {

	@Inject
	private JavaMailSender mailSender;
	
	
	public String createKey() {
		StringBuffer key= new StringBuffer();
		Random random = new Random();
		
		//12자리의 인증키 발생
		for(int i=0;i<12;i++) {
			key.append(random.nextInt(10));
		}
		
		return key.toString();
	}
	
	public void mailSend(MemberVO memberVO, MailForm form) throws Exception{
		MailUtils sendMail = new MailUtils(mailSender);
		
		sendMail.setSubject(form.getSubject());
		sendMail.setText(form.getMessage());
		sendMail.setFrom("cameobc@naver.com", "TryLab");
		sendMail.setTo(memberVO.getEmail());
		sendMail.send();
	}
}
