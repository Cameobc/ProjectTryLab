package com.project.member;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.project.memberProfile.MemberFileVO;

public class MemberVO {

	
	
	
	@NotNull
	@Size(min= 6, max = 15)
	private String id;
	@Size(min= 6, max = 12)
	private String pw;
	@Size(min= 6, max = 12)
	private String pw2;
	@Size(min=6)
	private String name;
	private String phone;
	private String email;
	private String gender;
	private int grade;
	private MemberFileVO memberFileVO;
	
	
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
