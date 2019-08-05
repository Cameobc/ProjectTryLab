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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.board.qna.QnaService;
import com.project.board.qna.QnaVO;
import com.project.util.PageMaker;

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
	@RequestMapping(value = "qnaReply", method = RequestMethod.POST)
	public ModelAndView setReply(QnaVO qnaVO, RedirectAttributes rd) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = qnaService.setReply(qnaVO);
		String msg = "댓글작성 실패";
		if(result>0) {
			msg = "댓글작성 성공";
		}
		rd.addFlashAttribute("msg",msg);
		mv.setViewName("redirect:./qnaList");
		
		return mv;
	}

	//reply form
	@RequestMapping(value = "qnaReply", method = RequestMethod.GET)
	public ModelAndView setReply(int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("num", num);
		mv.setViewName("qna/qnaReply");
		
		return mv;
	}
	
	
	
	
	

}
