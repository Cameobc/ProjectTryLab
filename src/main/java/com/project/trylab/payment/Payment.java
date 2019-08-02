package com.project.trylab.payment;

import org.springframework.beans.factory.annotation.Value;


public class Payment {

	@Value("${import.api_key}")
	private String api_key;
	
	@Value("${import.api_secret}")
	private String api_secret;
	
	@Value("${import.code}")
	private String code;
		
}
