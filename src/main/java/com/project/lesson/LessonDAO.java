package com.project.lesson;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class LessonDAO {
	
	@Inject
	private SqlSession session;
	private static final String NAMESPACE="LessonMapper.";
	
	//클래스 등록
	public int setWrite(LessonVO lessonVO) throws Exception{
		return session.insert(NAMESPACE+"setWrite", lessonVO);
	}
	
	
	//카테고리 목록 리스트 불러오기
	public List<LessonVO> getCategory() throws Exception {
		
		return session.selectList(NAMESPACE+"getCategory");
	}
	

}
