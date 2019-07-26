package com.project.trylab.member;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.trylab.member.MemberDTO;
import com.project.trylab.util.PageMaker;
@Service
public class MemberService {
	@Inject
	private MemberDAO memberDAO;
	
	
	//deleteAll
	public int setDelete(String [] id)throws Exception{
		 List<String> list = Arrays.asList(id);
		 return memberDAO.setDelete(list);
	}
	
	//list
	public List<MemberDTO> getList(PageMaker pageMaker)throws Exception{
		//1. row
		pageMaker.makeRow();
		//2. Page
		pageMaker.makePage(memberDAO.getCount(pageMaker));
		//3
		return memberDAO.getList(pageMaker);
	}
	public int setWrite(MemberDTO memberDTO, HttpSession session)throws Exception{
		//1.저장 경로
		String realPath = session.getServletContext().getRealPath("/resources/member");
		System.out.println(realPath);
		int result = memberDAO.setWrite(memberDTO);
		
		return result;
	}
	
	
	public MemberDTO getSelect(MemberDTO memberDTO)throws Exception{
		return memberDAO.getSelect(memberDTO);
	}
	

}
