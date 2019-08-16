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
	
	
	public String createTempPassword() {
		char [] pwSet = {
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
				'!', '@', '#', '$', '%', '^', '&', '*', '?', '(', ')'
		};
		
		String temPw = "";
		for(int i=0;i<12;i++){
			int selectArray = (int)(Math.random()*pwSet.length);
			temPw = temPw+pwSet[selectArray];
		}
		
		return temPw;
	}
	
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
