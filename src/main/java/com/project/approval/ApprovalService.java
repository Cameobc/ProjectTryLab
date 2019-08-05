package com.project.approval;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.certificate.CertificateDAO;
import com.project.certificate.CertificateVO;
import com.project.license.LicenseDAO;
import com.project.license.LicenseVO;
import com.project.util.FileSaver;
import com.project.util.PageMaker;

@Service
public class ApprovalService {

	@Inject
	private ApprovalDAO approvalDAO;
	@Inject
	private FileSaver fileSaver;
	@Inject
	private CertificateDAO certificateDAO;
	@Inject
	private LicenseDAO licenseDAO;
	
	
	public int tutorRequest(ApprovalVO approvalVO, MultipartFile certificate, MultipartFile license, HttpSession session) throws Exception {
		String realPath1 = session.getServletContext().getRealPath("/resources/certificate");
		String realPath2 = session.getServletContext().getRealPath("/resources/license");
		
		System.out.println(realPath1);
		System.out.println(realPath2);
		
		String fname=fileSaver.saveFile(realPath1, certificate);
		System.out.println("fname1=" + fname);
		
		String oname= certificate.getOriginalFilename();
		CertificateVO certificateVO = new CertificateVO();
		certificateVO.setId(approvalVO.getId());
		certificateVO.setFname(fname);
		certificateVO.setOname(oname);
		
		/////////////////////////////////////////////////////
		
		fname = fileSaver.saveFile2(realPath2, license);
		System.out.println("fname2=" + fname);
		
		oname=license.getOriginalFilename();
		LicenseVO licenseVO = new LicenseVO();
		licenseVO.setId(approvalVO.getId());
		licenseVO.setFname(fname);
		licenseVO.setOname(oname);


		int result = approvalDAO.tutorRequest(approvalVO);
		result = certificateDAO.setWrite(certificateVO);
		result = licenseDAO.setWrite(licenseVO);
		System.out.println("result=" + result);
		
		return result;

	}
	
	public List<ApprovalVO> tutorApproval(PageMaker pageMaker) throws Exception {
		pageMaker.makeRow();
		List<ApprovalVO> request = approvalDAO.tutorApproval(pageMaker);
		int totalCount = approvalDAO.getTotalCount();
		pageMaker.makePage(totalCount);
		
		return request;
	
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
}

