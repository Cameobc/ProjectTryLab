package com.project.notice;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.project.util.PageMaker;

@Service
public class NoticeService {

	@Inject
	private NoticeDAO noticeDAO;
	
	//hit
	public void updateHit(int num) throws Exception {
		noticeDAO.updateHit(num);
	}

	
	//write
	public int setWrite(NoticeVO noticeVO) throws Exception {
		int result = noticeDAO.setWrite(noticeVO);
		return result;
	}
	
	//delete
	public int setDelete(int num) throws Exception {
		return noticeDAO.setDelete(num);
	}
	
	//update
	public int setUpdate(NoticeVO noticeVO) throws Exception {
		return noticeDAO.setUpdate(noticeVO);
	}
	
	//select
	public NoticeVO getSelect(int num) throws Exception {
		return noticeDAO.getSelect(num);
	}
	
	//list
	public List<NoticeVO> getList(PageMaker pageMaker) throws Exception {
		
		pageMaker.makeRow();
		int totalCount = noticeDAO.getTotalCount(pageMaker);
		
		pageMaker.makePage(totalCount);
		
		return noticeDAO.getList(pageMaker);
	}
	
	
	
	
}
