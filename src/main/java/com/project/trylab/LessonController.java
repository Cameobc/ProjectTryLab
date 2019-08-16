package com.project.trylab;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane.MoveAction;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.lesson.CategoryVO;
import com.project.lesson.LessonService;
import com.project.lesson.LessonVO;
import com.project.lesson.TimeTableVO;

import oracle.net.aso.l;

@Controller
@RequestMapping(value = "/lessons/")
public class LessonController {
	
	@Inject
	private LessonService lessonService;

	@RequestMapping(value = "lessonDeleteTime", method = RequestMethod.GET)
	public ModelAndView lessonDeleteTime(String class_id,int idx) throws Exception{
		int result = 0;
		ModelAndView mv = new ModelAndView();
		TimeTableVO tVO = new TimeTableVO();
		tVO.setClass_id(class_id);
		tVO.setIdx(idx);
		
		result = lessonService.setDeleteTime(tVO);
		
	
		mv.addObject("result", result);
		mv.setViewName("common/message");
		
		return mv;
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="lessonUpdate", method = RequestMethod.GET)
	public ModelAndView lessonUpdate(String class_id) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		List<CategoryVO> category = lessonService.getCategory();
		LessonVO lesson = lessonService.getSelect(class_id);
		
		if(lesson == null) {
			System.out.println("lessonVo is null");		
		}else {
			mv.addObject("category", category);
			mv.addObject("lesson", lesson);
		}
	
		mv.setViewName("lessons/lessonUpdate");
		return mv;
	}
	
	@RequestMapping(value="lessonUpdate", method = RequestMethod.POST)
	public ModelAndView lessonUpdate(@RequestParam(value="class_date",required=true) List<String> class_date,
			@RequestParam(value="startTime",required=true) List<String> startTime, 
			@RequestParam(value="endTime",required=true) List<String> endTime, 
			LessonVO lessonVO, List<MultipartFile> f1, MultipartFile thumbnail, HttpSession session) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		int result = lessonService.setUpdate(lessonVO, f1, thumbnail,class_date, startTime, endTime,session);
		
		if(result>0) {
			mv.addObject("message", "수업정보를 수정했습니다.");
		}else {
			mv.addObject("message", "수업정보 수정에 실패했습니다.");
		}
		mv.addObject("path", "./lessonList");
		mv.setViewName("common/messageMove");
		return mv;
	}
	//////////////////////////////////////////////////////////////////////
	@RequestMapping(value="lessonDelete", method = RequestMethod.GET)
	public ModelAndView lessonDelete(String class_id) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		int result = lessonService.setDelete(class_id);
		
		if(result>0) {
			mv.addObject("message","해당 클래스를 삭제했습니다.");			
		}else {
			mv.addObject("message", "클래스 삭제에 실패했습니다.");
		}
		mv.addObject("path", "./lessonList");
		mv.setViewName("common/messageMove");
		return mv;
	}
	
	
	/////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value="lessonSelect", method = RequestMethod.GET)
	public ModelAndView lessonSelect(String class_id, HttpSession session) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		LessonVO lessons = lessonService.getSelect(class_id);
		List<String> dates = lessonService.getSelectDate(class_id);
		mv.addObject("lessons",lessons);
		mv.addObject("dates", dates);
		mv.setViewName("lessons/lessonSelect");
		return mv;
	}
	
	///////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="lessonList", method=RequestMethod.GET)
	public ModelAndView lessonList(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<LessonVO> lessons = lessonService.getList();
		
		mv.addObject("lessons",lessons);
		mv.setViewName("lessons/lessonList");
		
		return mv;
	}
	
	//////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "lessonReg", method = RequestMethod.GET)
	public ModelAndView classReg() throws Exception {
		
	    List<CategoryVO> category = lessonService.getCategory();
	    ModelAndView mv = new ModelAndView();
	    
	    mv.addObject("category", category);
	    mv.setViewName("lessons/lessonReg");
		return mv;
	}

	@RequestMapping(value = "lessonReg", method = RequestMethod.POST)
	public ModelAndView classReg(@RequestParam(value="class_date",required=true) List<String> class_date,
			@RequestParam(value="startTime",required=true) List<String> startTime, 
			@RequestParam(value="endTime",required=true) List<String> endTime, 
			LessonVO lessonVO, List<MultipartFile> f1, MultipartFile thumbnail, HttpSession session) throws Exception {
		
		
		
		int result = lessonService.setWrite(lessonVO, f1, thumbnail, class_date, startTime, endTime, session);
		ModelAndView mv = new ModelAndView();
		mv.addObject("path","./lessonList");
		if(result>0) {
			mv.addObject("message", "클래스를 등록했습니다.");
		}else {
			mv.addObject("message", "클래스 등록에 실패했습니다.");
		}
		mv.setViewName("common/messageMove");
		
		return mv;
	}
	
	@RequestMapping("jusoPopup")
	public String jusoPopup() throws Exception {

        return "lessons/jusoPopup";

    }
	
	
	
}
