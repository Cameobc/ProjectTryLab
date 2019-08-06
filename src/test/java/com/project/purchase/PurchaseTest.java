package com.project.purchase;

import static org.junit.Assert.*;

import java.io.IOException;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Value;

import com.project.trylab.AbstractTest;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.PaymentBalance;

public class PurchaseTest extends AbstractTest {
	
	@Value("${iamprot.code}")
	private String code;
	@Value("${iamprot.api_key}")
	private String api_key;
	@Value("${iamprot.api_secret}")
	private String api_secret;
	
	IamportClient client;
	
	private IamportClient getNeverTestClient() {
		return new IamportClient(api_key, api_secret);
	}

	@Before
	public void setup() {
		client = new IamportClient(api_key, api_secret);
	}
	
	@Test
	public void testGetToken() {
		System.out.println(code);
		System.out.println(api_key);
		System.out.println(api_secret);
		
		try {
			IamportResponse<AccessToken> auth_response = client.getAuth();
			assertNotNull(auth_response.getResponse());
			assertNotNull(auth_response.getResponse().getToken());
			System.out.println(auth_response.getResponse());
			System.out.println(auth_response.getResponse().getToken());
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				//TODO
				break;
			case 500 :
				//TODO
				break;
			}
		} catch (IOException e) {
			//서버 연결 실패
			e.printStackTrace();
		}
	}
	
	@Test
	public void testPaymentBalanceByImpUid() {
		try {
			IamportResponse<PaymentBalance> payment_response = client.paymentBalanceByImpUid(code);
			
			System.out.println(payment_response.getResponse());
			assertNotNull(payment_response.getResponse());
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				//TODO
				break;
			case 500 :
				//TODO
				break;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
