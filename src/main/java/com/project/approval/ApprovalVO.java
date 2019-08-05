package com.project.approval;



import org.springframework.stereotype.Component;

import com.project.certificate.CertificateVO;
import com.project.license.LicenseVO;
@Component
public class ApprovalVO {
	private String id;
	private String nickName;
	private String confirmType;
	private String college;
	private String major;
	private String kind;
	private String colStatus;
	private CertificateVO certificateVO;
	private LicenseVO licenseVO;
	
	
	
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public CertificateVO getCertificateVO() {
		return certificateVO;
	}
	public void setCertificateVO(CertificateVO certificateVO) {
		this.certificateVO = certificateVO;
	}

	public LicenseVO getLicenseVO() {
		return licenseVO;
	}
	public void setLicenseVO(LicenseVO licenseVO) {
		this.licenseVO = licenseVO;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getConfirmType() {
		return confirmType;
	}
	public void setConfirmType(String confirmType) {
		this.confirmType = confirmType;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getColStatus() {
		return colStatus;
	}
	public void setColStatus(String colStatus) {
		this.colStatus = colStatus;
	}
	
}
