package com.project.tutor;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.lesson.LessonDAO;
import com.project.lesson.LessonFileDAO;
import com.project.lesson.LessonFileVO;
import com.project.lesson.LessonVO;
import com.project.util.FileSaver;

@Service
public class TutorService {

	@Inject
	private LessonDAO lessonDAO;
	@Inject
	private LessonFileDAO lessonFileDAO;
	@Inject
	private FileSaver fileSaver;

	//
	public List<LessonVO> getSalesByTid(String tid) throws Exception{
		return lessonDAO.getSalesByTid(tid);
	}
	
	// 수업상세보기
	public LessonVO getSelect(String class_id) throws Exception {
		return lessonDAO.getSelect(class_id);
	}

	// 수업리스트
	public List<LessonVO> getListByTid(String tid) throws Exception {
		return lessonDAO.getListByTid(tid);
	}

	
}
