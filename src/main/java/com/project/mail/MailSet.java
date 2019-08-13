package com.project.mail;

import org.springframework.stereotype.Component;

import com.project.member.MemberVO;

@Component
public class MailSet {

	public MailForm joinTrylab(MemberVO memberVO) {
		String subject = "TryLab 인증메일 입니다.";
		StringBuffer message = new StringBuffer();
		message.append("<div align='center' style='border:1px solid black; font-family:verdana'>");
		message.append("<h3 style='color:#347089;'>TryLab 인증메일 입니다.</h3>");
		message.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>");
		message.append("<a href='http://localhost:80/trylab/member/joinConfirm?id="+memberVO.getId()+"&mail_key="+memberVO.getMail_key());
		message.append("' target='_blenk'>이메일 인증 확인</a>");
		message.toString();
		System.out.println("test"+message.toString());
		MailForm form = new MailForm();
		form.setSubject(subject);
		form.setMessage(message.toString());
		return form;
	}
}
