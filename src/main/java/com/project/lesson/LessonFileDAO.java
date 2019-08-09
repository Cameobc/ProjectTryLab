package com.project.lesson;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class LessonFileDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="LessonFileMapper.";
	
	public int setDelete(String class_id) throws Exception {
		return sqlSession.delete(NAMESPACE+"setDelete", class_id);
	}
	
	public int setWrite(List<LessonFileVO> files) throws Exception{
		int result=0;
		
		for(LessonFileVO f : files) {
			result=sqlSession.insert(NAMESPACE+"setWrite", f);
		}
		
		return result;
	}
	
	public int setThumbnail(LessonFileVO thumbnail) throws Exception{
		return sqlSession.insert(NAMESPACE+"setThumbnail", thumbnail);
	}
}
