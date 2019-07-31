package com.project.trylab;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
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
	public ModelAndView setWrite(QnaVO qnaVO, HttpSession session, List<MultipartFile> f1) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = qnaService.setWrite(qnaVO, session, f1);
		if(result>0) {
			mv.setViewName("redirect:./qnaList");
		}else {
			mv.addObject("message", "글쓰기 실패");
			mv.addObject("path", "./qnaList");
			mv.setViewName("common/messageMove");
		}
		return mv;
	}
	
	//delete
	@RequestMapping(value = "qnaDelete", method = RequestMethod.GET)
	public String setDelete(int num, HttpSession session) throws Exception {
		int result = qnaService.setDelete(num, session);
		return "redirect:./qnaList";
	}
	
	//update
	@RequestMapping(value = "qnaUpdate", method = RequestMethod.POST)
	public ModelAndView setUpdate(QnaVO qnaVO, HttpSession session, List<MultipartFile> f1) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = qnaService.setUpdate(qnaVO, session, f1);
		
		mv.setViewName("redirect:./qnaList");
		
		return mv;
	}
	
	//update form
	@RequestMapping(value = "qnaUpdate", method = RequestMethod.GET)
	public ModelAndView setUpdate(int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		QnaVO qnaVO = qnaService.getSelect(num);
		
		System.out.println("board size:"+qnaVO.getFiles().size());
		
		mv.addObject("dto", qnaVO);
		mv.setViewName("qna/qnaUpdate");
		
		return mv;
	}
	
	//select
	@RequestMapping(value = "qnaSelect", method = RequestMethod.GET)
	public ModelAndView getList(int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		QnaVO qnaVO = qnaService.getSelect(num);
		
		mv.addObject("dto", qnaVO);
		mv.setViewName("qna/qnaSelect");
		
		return mv;
		
	}
	
	//list
	@RequestMapping(value = "qnaList", method = RequestMethod.GET)
	public ModelAndView getList(PageMaker pageMaker) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<QnaVO> lists = qnaService.getList(pageMaker);
		
		mv.addObject("list", lists);
		mv.addObject("pager", pageMaker);
		mv.setViewName("qna/qnaList");
		
		return mv;
	}
	
	//reply
	
	
	//reply form
	
	
	
	
	
	

}
