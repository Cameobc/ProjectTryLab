package com.project.admin;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.member.MemberVO;
import com.project.util.PageMaker;

@Repository
public class AdminDAO {

	@Inject
	private SqlSession sqlSession;
	private final static String NAMESPACE = "AdminMapper.";
	
	public List<MemberVO> getList(PageMaker pageMaker) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", pageMaker);
	}
	
	public int gradeUpdate(String id) throws Exception {
		return sqlSession.update(NAMESPACE+"gradeUpdate", id);
	}
	
}
