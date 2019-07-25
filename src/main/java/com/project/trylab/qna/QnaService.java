package com.project.trylab.qna;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.project.trylab.util.PageMaker;

@Service
public class QnaService {

	@Inject
	private QnaDAO qnaDAO;
	
	
	//write
	public int setWrite(QnaVO qnaVO, HttpSession session) throws Exception {
		int result = qnaDAO.setWrite(qnaVO);
		
		return result;
	}
	
	
	
	//delete
	
	
	
	//update
	
	
	
	//select
	
	
	//list
	public List<QnaVO> getList(PageMaker pageMaker) throws Exception {
		pageMaker.makeRow();
		List<QnaVO> list = qnaDAO.getList(pageMaker);
		
		int totalCount = qnaDAO.getTotalCount(pageMaker);
		pageMaker.makePage(totalCount);
		
		return list;
	}
	
	
	
	
	
	
}
