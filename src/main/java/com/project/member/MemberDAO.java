package com.project.member;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.util.PageMaker;

@Repository
public class MemberDAO {

	@Inject
	public SqlSession sqlSession;
	private final static String NAMESPACE = "MemberMapper.";
	
	public int setWrite(MemberVO memberVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setWrite", memberVO);
	}
	public MemberVO getSelect(MemberVO memberVO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getSelect", memberVO);
	}
	public int getCount(PageMaker pageMaker) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getCount", pageMaker);
	}
}
