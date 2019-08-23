package com.project.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.member.MemberDAO;
import com.project.member.MemberVO;
import com.project.util.PageMaker;

@Service
public class AdminService {
	
	@Inject
	private AdminDAO adminDAO;
	@Inject
	private MemberDAO memberDAO;
	
	public List<MemberVO> getList(PageMaker pageMaker) throws Exception {
		pageMaker.makeRow();
		List<MemberVO> list = adminDAO.getList(pageMaker);
		int totalCount = memberDAO.getCount(pageMaker);
		pageMaker.makePage(totalCount);
		return list;
	}
	
	public int gradeUpdate(String id) throws Exception {
		return adminDAO.gradeUpdate(id);
	}
}

