package com.project.member;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;

import com.project.trylab.AbstractTest;

public class MemberDAOTest extends AbstractTest {

	@Inject
	private MemberDAO memberDAO;
	
	@Test
	public void test() throws Exception {
		MemberVO memberVO = new MemberVO();
		memberVO.setId("iulove");
		memberVO.setEmail("tt");
		memberVO.setPhone("01011112222");
		memberVO.setGender("f");
		int result = memberDAO.setUpdate(memberVO);
		assertNotEquals(0, result);
	}
}
