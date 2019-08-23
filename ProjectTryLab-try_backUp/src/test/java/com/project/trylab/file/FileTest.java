package com.project.trylab.file;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;

import com.project.approval.ApprovalDAO;
import com.project.approval.ApprovalService;
import com.project.approval.ApprovalVO;
import com.project.certificate.CertificateDAO;
import com.project.certificate.CertificateVO;
import com.project.license.LicenseVO;
import com.project.trylab.AbstractTest;

public class FileTest extends AbstractTest{

	@Inject
	private ApprovalDAO approvalDAO;
	@Inject
	private CertificateDAO certificateDAO;
	
	@Test
	public void test() {
		CertificateVO certificateVO = new CertificateVO();
		certificateVO.setId("dd");
		certificateVO.setNum(10);
		certificateVO.setFname("fname");
		certificateVO.setOname("oname");
		
		LicenseVO licenseVO = new LicenseVO();
		licenseVO.setNum(10);
		licenseVO.setId("dd");
		licenseVO.setFname("hi");
		licenseVO.setOname("hi");
		
		ApprovalVO approvalVO = new ApprovalVO(); 
		approvalVO.setId("dd");
		approvalVO.setNickName("nic");
		approvalVO.setCollege("대학");
		approvalVO.setConfirmType("confirm");
		approvalVO.setColStatus("col");
		approvalVO.setMajor("major");
		approvalVO.setKind("license");
		approvalVO.setCertificateVO(certificateVO);
		approvalVO.setLicenseVO(licenseVO);
		
		int result=0;
		try {
			result = approvalDAO.tutorRequest(approvalVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		assertNotEquals(0, result);

	}

}
