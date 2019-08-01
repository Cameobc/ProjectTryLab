package com.project.certificate;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.approval.ApprovalVO;

@Repository
public class CertificateDAO {

	@Inject
	private SqlSession sqlSession;
	private final static String NAMESPACE="CertificateMapper.";
	
	public int setWrite(CertificateVO certificateVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setWrite", certificateVO);
		
	}
	
}
