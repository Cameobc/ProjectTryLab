package com.project.trylab;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.trylab.qna.QnaService;
import com.project.trylab.qna.QnaVO;
import com.project.trylab.util.PageMaker;

@Controller
@RequestMapping(value = "/qna/")
public class QnaController {
	
	@Inject
	private QnaService qnaService;
	
	
	//write
	@RequestMapping(value = "qnaWrite", method = RequestMethod.GET)
	public String setWrite(QnaVO qnaVO) throws Exception {
		return "qna/qnaWrite";
	}
	
	//write
	@RequestMapping(value = "qnaWrite", method = RequestMethod.POST)
	public ModelAndView setWrite(QnaVO qnaVO, HttpSession session, HttpServletRequest request ) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = qnaService.setWrite(qnaVO, session);
		if(result>0) {
			mv.setViewName("redirect:./qnaList");
		}else {
			mv.addObject("message", "글쓰기 실패");
			mv.addObject("path", "./qnaList");
		}
		return mv;
	}
	
	//delete
	
	//update
	
	//select
	
	//list
	@RequestMapping(value = "qnaList", method = RequestMethod.GET)
	public ModelAndView getList(PageMaker pageMaker) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<QnaVO> list = qnaService.getList(pageMaker);
		
		mv.addObject("list", list);
		mv.addObject("pager", pageMaker);
		
		return mv;
	}
	
	
	
	
	
	
	

}
