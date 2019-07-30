package com.project.trylab.member;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.trylab.member.MemberVO;
import com.project.trylab.util.PageMaker;



public class MemberDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="MemberMapper.";
	
	public MemberVO getId(MemberVO memberVO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getId", memberVO);
	}
	
	//deleteAll
	public int setDelete(List<String> list)throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete", list);
	}
	
	//count
	public int getCount(PageMaker pageMaker)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCount", pageMaker);
	}
	
	//list
	public List<MemberVO> getList(PageMaker pageMaker)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", pageMaker);
	}
	
	
	public int setWrite(MemberVO memberVO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setWrite", memberVO);
	}
	
	public MemberVO getSelect(MemberVO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelect", memberDTO);
	}

}

	


