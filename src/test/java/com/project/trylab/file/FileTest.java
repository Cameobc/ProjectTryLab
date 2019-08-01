package com.project.trylab.file;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;

import com.project.approval.ApprovalDAO;
import com.project.approval.ApprovalService;
import com.project.approval.ApprovalVO;
import com.project.trylab.AbstractTest;

public class FileTest extends AbstractTest{

	@Inject
	private ApprovalDAO approvalDAO;
	
	
	@Test
	public void test() {
		ApprovalVO approvalVO = new ApprovalVO();
		approvalVO.setId("test");
		approvalVO.setNickName("nick");
		approvalVO.setCollege("대학");
		approvalVO.setMajor("학과");
		approvalVO.setColStatus("졸업");
		approvalVO.setConfirmType("대학 인증");

		approvalDAO.tutorRequest(approvalVO);
		

	}

}
