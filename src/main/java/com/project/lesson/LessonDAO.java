package com.project.lesson;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class LessonDAO {

	@Inject
	private SqlSession session;
	private static final String NAMESPACE = "LessonMapper.";

	// 수업정보 업데이트
	public int setUpdate(LessonVO lessonVO) throws Exception {
		return session.update(NAMESPACE + "setUpdate", lessonVO);
	}

	// 수업정보 업데이트
	public int setUpdateTimetable(LessonVO lessonVO) throws Exception {
		return session.update(NAMESPACE + "setUpdateTimetable", lessonVO);
	}

	// 수업정보 삭제
	public int setDelete(String class_id) throws Exception {
		return session.delete(NAMESPACE + "setDelete", class_id);
	}

	// 수업스케쥴 삭제
	public int setDeleteTimetable(String class_id) throws Exception {
		return session.delete(NAMESPACE + "setDeleteTimetable", class_id);
	}

	// 수업 상세정보
	public LessonVO getSelect(String class_id) throws Exception {
		return session.selectOne(NAMESPACE + "getSelect", class_id);
	}

	// 수업리스트
	public List<LessonVO> getList() throws Exception {
		return session.selectList(NAMESPACE + "getList");
	}
	
	// 클래스 등록
	public int setWrite(LessonVO lessonVO) throws Exception {
		return session.insert(NAMESPACE + "setWrite", lessonVO);
	}

	// 시간표 등록
	public int setTimetable(LessonVO lessonVO) throws Exception {
		return session.insert(NAMESPACE + "setTimetable", lessonVO);
	}

	// 카테고리 목록 리스트 불러오기
	public List<CategoryVO> getCategory() throws Exception {

		return session.selectList(NAMESPACE + "getCategory");
	}
	
	////////////////////////////////////////////

	// 수업리스트 by tid
	public List<LessonVO> getListByTid(String tid) throws Exception {
		return session.selectList(NAMESPACE + "getListByTid",tid);
	}
	
	// 수업 상세정보
	public LessonVO getSelectByTid(String tid) throws Exception {
		return session.selectOne(NAMESPACE + "getSelectByTid", tid);
	}
	
	//지역 검색
	public List<LessonVO> getSearchList(String[] location) throws Exception {
		return session.selectList(NAMESPACE+"getSearchList", location);
		
	}
	
	
	
	
	
	
	

}
