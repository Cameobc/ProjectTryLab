package com.project.trylab;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.lesson.LessonVO;
import com.project.member.MemberVO;
import com.project.memberProfile.MemberFileVO;
import com.project.tutor.TutorService;

@Controller
@RequestMapping(value="/tutor/")
public class TutorController {

	@Inject
	private TutorService tutorService;
	
	@RequestMapping (value = "tutorMypage", method = RequestMethod.GET)
	public void tutorMypage(HttpSession session) {

	}
	
	@RequestMapping (value = "tutorCalendar", method = RequestMethod.GET)
	public ModelAndView tutorCalendar(String class_id, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<LessonVO> list = tutorService.tutorCalendar(class_id);
		
		mv.addObject("list", list);
		mv.setViewName("tutor/tutorCalendar");
		return mv;
	}
	
	@RequestMapping(value="getSalesList", method=RequestMethod.GET)
	public ModelAndView getSales(String tid) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<LessonVO> list = tutorService.getSalesByTid(tid);
		
		mv.addObject("list", list);
		mv.setViewName("tutor/tutorSales");
		return mv;
	}
	
	@RequestMapping (value = "tutorMyLesson", method = RequestMethod.GET)
	public ModelAndView tutorMyLesson(String tid, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		//MemberVO m = (MemberVO)session.getAttribute("member");
		
		List<LessonVO> lessons = tutorService.getListByTid(tid);
		mv.addObject("lessons", lessons);
		mv.setViewName("/tutor/tutorList");

		return mv;
	}
}
