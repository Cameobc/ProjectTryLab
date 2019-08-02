package com.project.trylab;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.approval.ApprovalService;
import com.project.approval.ApprovalVO;
import com.project.member.MemberService;
import com.project.member.MemberVO;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	@Inject
	private ApprovalService approvalService;
	
	@RequestMapping(value="memberJoin", method = RequestMethod.POST)
	public ModelAndView setWrite(MemberVO memberVO, MultipartFile photo, HttpSession session )throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = memberService.setWrite(memberVO, photo, session);
		String message="Join Fail";
		if(result>0) {
			message ="Join Success";	
		}
		mv.addObject("message", message);
		mv.addObject("path", "../");
		mv.setViewName("common/messageMove");
		
		return mv;
	}
	@RequestMapping(value="memberJoin", method = RequestMethod.GET)
	public void setWrite(MemberVO memberVO) throws Exception {
		
	}

	@RequestMapping(value="memberLogin", method = RequestMethod.POST)
	public ModelAndView getSelect(MemberVO memberVO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		memberVO = memberService.getSelect(memberVO);
		String message = "Login Fail";
		if(memberVO!=null) {
			session.setAttribute("member", memberVO);
			message = "Login Success";
		}
		mv.setViewName("common/messageMove");
		mv.addObject("message", message);
		mv.addObject("path","../");
		return mv;
	}
	
	@RequestMapping(value="memberLogin", method = RequestMethod.GET)
	public void getSelect() throws Exception {}
	
	@RequestMapping(value="memberLogout")
	public String logout(HttpSession session)throws Exception {
		session.invalidate();
		return "redirect:../";
	}
	
	@RequestMapping(value="tutorRequest", method = RequestMethod.GET)
	public void tutorRequest(ApprovalVO approvalVO) throws Exception {}
	
	@RequestMapping(value="tutorRequest", method=RequestMethod.POST)
	public ModelAndView tutorRequest(ApprovalVO approvalVO, MultipartFile certificate, MultipartFile license, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = approvalService.tutorRequest(approvalVO, certificate, license, session);
		String message= "승인 요청 실패";

		if(result>0) {
			message = "승인 요청 완료";
		}
		mv.addObject("message", message);
		mv.addObject("path", "../");
		mv.setViewName("common/messageMove");
		
		return mv;
		
	}
	
}
