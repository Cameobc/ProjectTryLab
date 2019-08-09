package com.project.lesson;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.util.FileSaver;

@Service
public class LessonFileService {

	@Inject
	private LessonFileDAO lessonFileDAO;
	@Inject
	private FileSaver fileSaver;
	
	public String setWrite(MultipartFile multipartFile, HttpSession session) throws Exception{
		//summernote 업로드
		//수업 이미지 등록
		String realPath = session.getServletContext().getRealPath("/resources/lessons");
		String fname = fileSaver.saveFile3(realPath, multipartFile);
		
		return fname;
	}
	
}
