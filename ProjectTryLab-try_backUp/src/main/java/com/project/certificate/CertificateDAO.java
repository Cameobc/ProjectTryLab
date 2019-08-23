package com.project.certificate;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class CertificateDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="CertificateMapper.";
	
	public int setWrite(CertificateVO certificateVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setWrite", certificateVO);
		
	}
	
}
