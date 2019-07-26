package com.project.trylab.member;

import javax.validation.constraints.AssertFalse;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Future;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class MemberDTO {

	// Size.memberDTO.id
	// NotNull.memberDTO.id

	@NotNull
	@Size(min = 6, max = 15)
	private String id;

	@Size(min = 6, max = 12)
	private String pw;
	@Size(min = 6, max = 12)
	private String pw2;

	@Size(min = 6)
	private String name;

	private String email;
	private int grade;

	public String getPw2() {
		return pw2;
	}

	public void setPw2(String pw2) {
		this.pw2 = pw2;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

}
