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
	
	//수업 상세정보
	public LessonVO getSelect(String class_id) throws Exception {
		return session.selectOne(NAMESPACE+"getSelect", class_id);
	}
	
	//수업리스트
	public List<LessonVO> getList() throws Exception {
		return session.selectList(NAMESPACE+"getList");
	}
	
	//클래스 등록
	public int setWrite(LessonVO lessonVO) throws Exception{
		return session.insert(NAMESPACE+"setWrite", lessonVO);
	}
	
	//시간표 등록
	public int setTimetable(LessonVO lessonVO) throws Exception {
		return session.insert(NAMESPACE+"setTimetable", lessonVO);
	}
	
	//카테고리 목록 리스트 불러오기
	public List<CategoryVO> getCategory() throws Exception {
		
		return session.selectList(NAMESPACE+"getCategory");
	}
	

}