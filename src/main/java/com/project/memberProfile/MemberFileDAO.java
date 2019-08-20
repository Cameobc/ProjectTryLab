package com.project.memberProfile;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.member.MemberVO;

@Repository
public class MemberFileDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE ="MemberFileMapper.";
	
	
	public int setDelete(MemberFileVO fileVO) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete", fileVO);
	}
	
	public int setWrite(MemberFileVO memberFileVO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setWrite", memberFileVO);
	}
	public MemberFileVO getSelect(MemberVO memberVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getSelect", memberVO);
	}
	public int profileUpdate(String id) throws Exception {
		return sqlSession.update(NAMESPACE+"profileUpdate", id);
	}
}
