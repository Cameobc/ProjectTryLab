package com.project.lesson;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class LessonDAO {

	@Inject
	private SqlSession session;
	private static final String NAMESPACE = "LessonMapper.";

	//시간삭제idx
	public int setDeleteTime(TimeTableVO tVO) {
		return session.delete(NAMESPACE+"setDeleteTime", tVO);
	}
	//date에 따른 시간정보
	public List<TimeTableVO> getSelectTime(TimeTableVO tVO){
		return session.selectList(NAMESPACE + "getSelectTime", tVO);
	}
	// 수업정보 업데이트
	public int setUpdate(LessonVO lessonVO) throws Exception {
		return session.update(NAMESPACE + "setUpdate", lessonVO);
	}

	// 수업정보 업데이트
	public int setUpdateTimetable(TimeTableVO tVO) throws Exception {
		return session.update(NAMESPACE + "setUpdateTimetable", tVO);
	}
	//x
	public int setUpdateTime(List<TimeTableVO> timeTB) throws Exception {
		int result=0;
		for(TimeTableVO tVO:timeTB) {
			result=session.update(NAMESPACE + "setUpdateTime", tVO);
		}
		return result;
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

	// 수업 상세정보
	public List<String> getSelectDate(String class_id) throws Exception {
		return session.selectList(NAMESPACE + "getSelectDate", class_id);
	}
	
	public TimeTableVO getSelectByIdx(TimeTableVO tVO) throws Exception{
		
		return session.selectOne(NAMESPACE+"getSelectByIdx", tVO);
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
	public int setTimetable(List<TimeTableVO> timeTB) throws Exception {
		int result=0;
		for(TimeTableVO t : timeTB) {
			result=session.insert(NAMESPACE+"setTimetable", t);
		}
		
		return result;
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
	
	//조회수 증가
	public int setUpdateHit(String class_id) throws Exception{
		return session.update(NAMESPACE + "setUpdateHit", class_id);
	}

}
