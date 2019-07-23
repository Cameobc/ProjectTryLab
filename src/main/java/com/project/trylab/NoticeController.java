package com.project.trylab;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.trylab.notice.NoticeService;
import com.project.trylab.notice.NoticeVO;
import com.project.trylab.util.PageMaker;

@Controller
@RequestMapping(value = "/notice/")
public class NoticeController {

	@Inject
	private NoticeService noticeService;
	
	//write form
	@RequestMapping(value = "noticeWrite", method = RequestMethod.GET)
	public String setWrite() throws Exception {
		
		return "notice/noticeWrite";
	}
	
	//write
	//public String setWrite(NoticeVO noticeVO, HttpSession session, Model model) throws Exception {
		//int result = noticeService.setWrite(noticeVO);
	//}
	
	
	//delete
	@RequestMapping(value = "noticeDelete")
	public String setDelete(int num, Model model) throws Exception {
		int result = noticeService.setDelete(num);
		String msg = "삭제 실패";
		if(result>0) {
			msg = "삭제 성공";
		}
		model.addAttribute("message", msg);
		model.addAttribute("path", "./noticeList");
		
		return msg;
	}
	
	
	
	//list
	@RequestMapping(value = "noticeList", method = RequestMethod.GET)
	public ModelAndView getList(PageMaker pageMaker, ModelAndView mv) throws Exception {
		List<NoticeVO> ar = noticeService.getList(pageMaker);
		
		mv.addObject("list", ar);
		mv.addObject("pager", pageMaker);
		mv.setViewName("notice/noticeList");
		
		return mv;
	}
	
	
	
	
}
