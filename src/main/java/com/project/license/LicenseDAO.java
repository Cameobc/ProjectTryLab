package com.project.license;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class LicenseDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="LicenseMapper.";
	
	public int setWrite(LicenseVO licenseVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setWrite", licenseVO);
	}
	
}
