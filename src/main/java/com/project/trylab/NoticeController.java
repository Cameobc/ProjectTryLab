package com.project.trylab;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.board.notice.NoticeService;
import com.project.board.notice.NoticeVO;
import com.project.util.PageMaker;

@Controller
@RequestMapping(value = "/notice/")
public class NoticeController {

	@Inject
	private NoticeService noticeService;
	
	//write form
	@RequestMapping(value = "noticeWrite", method = RequestMethod.GET)
	public String setWrite(NoticeVO noticeVO) throws Exception {
		
		return "notice/noticeWrite";
	}
	
	//write
	@RequestMapping(value = "noticeWrite", method = RequestMethod.POST)
	public String setWrite(NoticeVO noticeVO, HttpSession session, Model model) throws Exception {
		int result = noticeService.setWrite(noticeVO);
		String view = "common/messageMove";
		if(result>0) {
			view = "redirect:./noticeList";
		}else {
			model.addAttribute("message", "글쓰기 실패");
			model.addAttribute("path", "./noticeList");
		}
		return view;
	}
	
	//delete
	@RequestMapping(value = "noticeDelete")
	public String setDelete(int num, Model model) throws Exception {
		int result = noticeService.setDelete(num);
		String msg = "삭제 실패";
		if(result>0) {
			msg = "삭제하였습니다.";
		}
		model.addAttribute("message", msg);
		model.addAttribute("path", "./noticeList");
		
		return "common/messageMove";
	}
	
	//update
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.POST)
	public String setUpdate(NoticeVO noticeVO, Model model) throws Exception {
		int result = noticeService.setUpdate(noticeVO);
		String view = "common/messageMove";
		if(result>0) {
			view = "redirect:./noticeList";
		}else {
			model.addAttribute("message", "수정 실패");
			model.addAttribute("path", "./noticeList");
		}
		return view;
	}
	
	//update
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.GET)
	public String setUpdate(int num, Model model) throws Exception {
		NoticeVO noticeVO = noticeService.getSelect(num);
		model.addAttribute("dto", noticeVO);
		
		return "notice/noticeUpdate";
	}
	
	//select
	@RequestMapping(value = "noticeSelect", method = RequestMethod.GET)
	public String getSelect(int num, Model model) throws Exception {
		NoticeVO noticeVO = noticeService.getSelect(num);
		String view = "common/messageMove";
		if(noticeVO != null) {
			view = "notice/noticeSelect";
			model.addAttribute("dto", noticeVO);
		}else {
			model.addAttribute("message", "내용 없음");
			model.addAttribute("path", "./noticeList");
		}
		return view;
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
