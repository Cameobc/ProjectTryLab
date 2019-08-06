package com.project.member;

import com.project.memberProfile.MemberFileVO;

public class MemberVO {

	private String id;
	private String pw;
	private String pw2;
	private String name;
	private String phone;
	private String email;
	private String gender;
	private int grade;
	private String salt;
	private String mail_key;
	private MemberFileVO memberFileVO;
	
	
	
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getMail_key() {
		return mail_key;
	}
	public void setMail_key(String mail_key) {
		this.mail_key = mail_key;
	}
	public String getPw2() {
		return pw2;
	}
	public void setPw2(String pw2) {
		this.pw2 = pw2;
	}
	public MemberFileVO getMemberFileVO() {
		return memberFileVO;
	}
	public void setMemberFileVO(MemberFileVO memberFileVO) {
		this.memberFileVO = memberFileVO;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	
}
