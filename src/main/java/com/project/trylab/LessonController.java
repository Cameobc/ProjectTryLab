package com.project.trylab;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane.MoveAction;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.lesson.CategoryVO;
import com.project.lesson.LessonService;
import com.project.lesson.LessonVO;

import oracle.net.aso.l;

@Controller
@RequestMapping(value = "/lessons/")
public class LessonController {
	
	@Inject
	private LessonService lessonService;

	@RequestMapping(value="lessonSelect", method = RequestMethod.GET)
	public ModelAndView lessonSelect(String class_id) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		LessonVO lessons = lessonService.getSelect(class_id);
		
		mv.addObject("lessons",lessons);
		mv.setViewName("lessons/lessonSelect");
		return mv;
	}
	
	///////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="lessonList", method=RequestMethod.GET)
	public ModelAndView lessonList() throws Exception {
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
	public ModelAndView classReg(LessonVO lessonVO, List<MultipartFile> f1, MultipartFile thumbnail, HttpSession session) throws Exception {
		
		int result = lessonService.setWrite(lessonVO, f1, thumbnail, session);
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
