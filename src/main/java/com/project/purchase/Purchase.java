package com.project.purchase;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component
public class Purchase {

	@Value("${iamprot.code}")
	private String code;
	@Value("${iamprot.api_key}")
	private String api_key;
	@Value("${iamprot.api_secret}")
	private String api_secret;
			

	
	
}
