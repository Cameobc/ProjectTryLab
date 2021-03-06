package com.project.approval;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.util.PageMaker;

@Repository
public class ApprovalDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="ApprovalMapper.";
	
	public int tutorRequest(ApprovalVO approvalVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"tutorRequest", approvalVO); 
	}
	
	public List<ApprovalVO> tutorApproval(PageMaker pageMaker) throws Exception {
		return sqlSession.selectList(NAMESPACE+"tutorApproval", pageMaker);
	}

	public int getTotalCount() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount");
	}

	public ApprovalVO getSelect(String id) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getSelect", id);
	}
	public int regDelete(String id) throws Exception {
		return sqlSession.delete(NAMESPACE+"regDelete", id);
	}
	
}
