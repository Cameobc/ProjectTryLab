package com.project.lesson;

import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class LessonService {
	
	@Inject
	private LessonDAO lessonDAO;
	
	
	//수업등록
	public int setWrite(LessonVO lessonVO, List<MultipartFile> files, HttpSession session) throws Exception {
		//수업아이디 생성
		Calendar ca = Calendar.getInstance();
		long time = ca.getTimeInMillis();
		
		String class_id = lessonVO.getCategory()+time;
		lessonVO.setClass_id(class_id);
		
		//summernote contents, 이미지 저장
		int result = lessonDAO.setWrite(lessonVO);
		
		
		//파일저장
		return result;
	}
	
	//카테고리 리스트
	public List<LessonVO> getCategory() throws Exception{
		
		return lessonDAO.getCategory();
	}
}
