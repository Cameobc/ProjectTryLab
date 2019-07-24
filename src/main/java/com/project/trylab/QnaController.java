package com.project.trylab;

import java.util.List;

import javax.inject.Inject;

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
