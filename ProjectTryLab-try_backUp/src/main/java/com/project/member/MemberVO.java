package com.project.member;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.project.memberProfile.MemberFileVO;

public class MemberVO {

	@NotEmpty
	@Size(min = 6, max = 20)
	@Pattern(regexp = "^[a-z0-9][a-z0-9_]{5,20}$")
	private String id;
	private String pw;
	@NotEmpty
	@Size(min = 8, max = 20)
	@Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[\\W])[a-zA-Z0-9\\W]{8,20}$")
	private String pw2;
	@NotEmpty
	private String name;
	@NotEmpty
	@Pattern(regexp = "^01(?:1|0|[6-9])[0-9]{6,8}$")
	private String phone;
	@NotEmpty
	@Pattern(regexp = "^[a-zA-Z0-9_]+@[a-z]+\\.[a-z]{2,4}$")
	private String email;
	private String gender;
	private int grade;
	private String mail_key;
	private MemberFileVO memberFileVO;
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
	public String getPw2() {
		return pw2;
	}
	public void setPw2(String pw2) {
		this.pw2 = pw2;
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
	public String getMail_key() {
		return mail_key;
	}
	public void setMail_key(String mail_key) {
		this.mail_key = mail_key;
	}
	public MemberFileVO getMemberFileVO() {
		return memberFileVO;
	}
	public void setMemberFileVO(MemberFileVO memberFileVO) {
		this.memberFileVO = memberFileVO;
	}
	
	
	
	
	
	
}
