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

import com.project.lesson.LessonService;
import com.project.lesson.LessonVO;

import oracle.net.aso.l;

@Controller
@RequestMapping(value = "/lessons/")
public class LessonController {
	
	@Inject
	private LessonService lessonService;

	
	@RequestMapping(value = "lessonReg", method = RequestMethod.GET)
	public ModelAndView classReg(LessonVO lessonVO) throws Exception {
		
	    List<LessonVO> category = lessonService.getCategory();
	    ModelAndView mv = new ModelAndView();
	    
	    mv.addObject("category", category);
	    mv.setViewName("lessons/lessonReg");
		return mv;
	}

	@RequestMapping(value = "lessonReg", method = RequestMethod.POST)
	public void classReg(LessonVO lessonVO, List<MultipartFile> f1, HttpSession session) throws Exception {
		int result = lessonService.setWrite(lessonVO, f1, session);
	
	}
	
	@RequestMapping("jusoPopup")
	public String jusoPopup() throws Exception {

        return "lessons/jusoPopup";

    }
	
	
	
}
