package com.project.mail;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailUtils {

	//실제로 메일을 보냄
	private JavaMailSender mailSender;
	private MimeMessage message;
	//messagehelper : subject 제목, to 수신자, from 발신자, test 내용. html 여부 설정 가능
	private MimeMessageHelper messageHelper;
	
	public MailUtils(JavaMailSender mailSender) throws MessagingException {
		this.mailSender = mailSender;
		message = this.mailSender.createMimeMessage();
		messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	}
	
	//메일 제목
	public void setSubject(String subject) throws MessagingException{
		messageHelper.setSubject(subject);
	}
	
	//html 포함한 메일 내용
	public void setText(String htmlContents) throws MessagingException{
		messageHelper.setText(htmlContents, true);
	}
	
	//보내는 사람이메일, 보내는 사람
	public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException{
		messageHelper.setFrom(email, name);
	}
	
	//받는 사람
	public void setTo(String email) throws MessagingException{
		messageHelper.setTo(email);
	}
	
	public void addInline(String contentId, DataSource dataSource) throws MessagingException{
		messageHelper.addInline(contentId, dataSource);
	}
	
	//메일보냄
	public void send() {
		mailSender.send(message);
	}
}
