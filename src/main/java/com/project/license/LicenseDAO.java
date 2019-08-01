package com.project.license;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.approval.ApprovalVO;

@Repository
public class LicenseDAO {

	private SqlSession sqlSession;
	@Inject
	private final static String NAMESPACE="LicenseMapper.";
	
	public int setWrite(LicenseVO licenseVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setWrite", licenseVO);
	}
	
}
