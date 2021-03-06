package com.project.member;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.qna.QnaVO;
import com.project.util.PageMaker;

@Repository
public class MemberDAO {

	@Inject
	public SqlSession sqlSession;
	private final static String NAMESPACE = "MemberMapper.";
	
	
	public int totalCount(PageMaker pageMaker) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"totalCount", pageMaker);
	}
	
	public List<QnaVO> getQnaList(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getQnaList", pageMaker);
	}
	
	public int setUpdate(MemberVO memberVO) throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdate", memberVO);
	}
	
	public MemberVO selectOne(String id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectOne", id);
	}
	
	public int findPw(MemberVO memberVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"findPw", memberVO);
	}
	
	public int setUpdatePw(MemberVO memberVO) throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdatePw", memberVO);
	}
	
	public String getId(MemberVO memberVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getId", memberVO);
	}
	
	//회원가입
	public int setWrite(MemberVO memberVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setWrite", memberVO);
	}
	
	//로그인
	public MemberVO getSelect(MemberVO memberVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getSelect", memberVO);
	}
	
	public int getCount(PageMaker pageMaker) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getCount", pageMaker);
	}
	
	public int checkMember(Map<String, Object> map) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"checkMember", map);
	}
	
	public int updateGrade(MemberVO memberVO) throws Exception{
		return sqlSession.update(NAMESPACE+"updateGrade", memberVO);
	}
}
