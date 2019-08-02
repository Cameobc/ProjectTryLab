package com.project.approval;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ApprovalDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="ApprovalMapper.";
	
	public int tutorRequest(ApprovalVO approvalVO) {
		return sqlSession.insert(NAMESPACE+"tutorRequest", approvalVO); 
	}
	

}
