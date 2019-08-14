package com.project.lesson;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.util.FileSaver;

@Service
public class LessonService {

	@Inject
	private LessonDAO lessonDAO;
	@Inject
	private LessonFileDAO lessonFileDAO;
	@Inject
	private FileSaver fileSaver;

	// 수업 수정하기
	public int setUpdate(LessonVO lessonVO, List<MultipartFile> f1, MultipartFile thumbnail, HttpSession session)
			throws Exception {
		int result = 0;
		String realPath = "";
		String fname = "";
		LessonFileVO lessonFileVO = null;
		List<LessonFileVO> list = null;
		
		// 1. 수업정보 업데이트
		result = lessonDAO.setUpdate(lessonVO);

		// 2. 클래스 스케줄 업데이트
		if (result > 0) {
			result = lessonDAO.setUpdateTimetable(lessonVO);
		} else {
			System.out.println("클래스 스케줄 업데이트 실패");
		}

		// 3.썸네일저장
		if(thumbnail !=null) {
		if (result > 0 && thumbnail.getOriginalFilename().length() > 0) {
			// 3-1. 파일 저장경로
			realPath = session.getServletContext().getRealPath("/resources/lessons");
			System.out.println("LFile>> " + realPath);

			fname = fileSaver.saveFile3(realPath, thumbnail);

			list = new ArrayList<LessonFileVO>();
			lessonFileVO = new LessonFileVO();
			lessonFileVO.setClass_id(lessonVO.getClass_id());
			lessonFileVO.setFname(fname);
			lessonFileVO.setOname(thumbnail.getOriginalFilename());
			lessonFileVO.setThumbnail(1);
			list.add(lessonFileVO);
		} else {
			result = 0;
		}
		}
		// 4. 클래스 이미지 업데이트
		if (result > 0) {

			for (MultipartFile f : f1) {
				fname = fileSaver.saveFile3(realPath, f);
				lessonFileVO = new LessonFileVO();
				lessonFileVO.setClass_id(lessonVO.getClass_id());
				lessonFileVO.setFname(fname);
				lessonFileVO.setOname(f.getOriginalFilename());
				lessonFileVO.setThumbnail(0);
				list.add(lessonFileVO);
			}

			result = lessonFileDAO.setWrite(list);
		}
		
		if(result<=0) {
			System.out.println("이미지 업데이트 실패");
			result=0;
		}
		return result;
	}

	// 수업 삭제하기
	public int setDelete(String class_id) throws Exception {
		int result = 0;
		// 1. 클래스 이미지 파일들 삭제
		result = lessonFileDAO.setDelete(class_id);
		// 2. 클래스 스케쥴 삭제
		if (result > 0) {
			result = lessonDAO.setDeleteTimetable(class_id);
		} else {
			System.out.println("클래스 이미지 삭제 실패");
		}
		// 3. 클래스 정보 삭제
		if (result > 0) {
			result = lessonDAO.setDelete(class_id);
		} else {
			System.out.println("클래스 스케줄 삭제 실패");
			result = 0;
		}
		return result;
	}

	// 수업상세보기
	public LessonVO getSelect(String class_id) throws Exception {
		int result=0;
		
		//조회수+1
		result = lessonDAO.setUpdateHit(class_id);
		return lessonDAO.getSelect(class_id);
	}

	// 수업리스트
	public List<LessonVO> getList() throws Exception {
		return lessonDAO.getList();
	}

	// 수업등록
	public int setWrite(LessonVO lessonVO, List<MultipartFile> f1, MultipartFile thumbnail, 
			List<String> class_date, List<String> startTime, List<String> endTime, HttpSession session) throws Exception {
		
		String realPath = "";
		String fname = "";
		LessonFileVO lessonFileVO = null;
		List<LessonFileVO> list = null;

		// 1.수업아이디 생성
		Calendar ca = Calendar.getInstance();
		long time = ca.getTimeInMillis();

		String class_id = lessonVO.getCategory_id() + time;
		lessonVO.setClass_id(class_id);

		// 2.summernote contents, 이미지 저장
		int result = lessonDAO.setWrite(lessonVO);

		// 3.썸네일저장
		if (result > 0 && thumbnail.getOriginalFilename().length() > 0) {
			// 3-1. 파일 저장경로
			realPath = session.getServletContext().getRealPath("/resources/lessons");
			System.out.println("LFile>> " + realPath);

			fname = fileSaver.saveFile3(realPath, thumbnail);

			list = new ArrayList<LessonFileVO>();
			lessonFileVO = new LessonFileVO();
			lessonFileVO.setClass_id(lessonVO.getClass_id());
			lessonFileVO.setFname(fname);
			lessonFileVO.setOname(thumbnail.getOriginalFilename());
			lessonFileVO.setThumbnail(1);
			list.add(lessonFileVO);
		} else {
			result = 0;
		}

		// 4.파일들 저장
		if (result > 0) {
			for (MultipartFile f : f1) {
				fname = fileSaver.saveFile3(realPath, f);
				lessonFileVO = new LessonFileVO();
				lessonFileVO.setClass_id(lessonVO.getClass_id());
				lessonFileVO.setFname(fname);
				lessonFileVO.setOname(f.getOriginalFilename());
				lessonFileVO.setThumbnail(0);
				list.add(lessonFileVO);
			}

			result = lessonFileDAO.setWrite(list);
		}

		// 5.timetable에 스케쥴 등록
		if (result > 0) {
			List<TimeTableVO> timeTB = new ArrayList<TimeTableVO>(){};
					
			for(int i=0;i<class_date.size();i++) {
				TimeTableVO tv = new TimeTableVO();
				tv.setClass_id(class_id);
				tv.setClass_date(class_date.get(i));
				tv.setStartTime(startTime.get(i));
				tv.setEndTime(endTime.get(i));
				timeTB.add(tv);
			}
			
			//lessonVO.setTimetable(t);
			result = lessonDAO.setTimetable(timeTB);
		}

		return result;
	}

	// 카테고리 리스트
	public List<CategoryVO> getCategory() throws Exception {

		return lessonDAO.getCategory();
	}
}
