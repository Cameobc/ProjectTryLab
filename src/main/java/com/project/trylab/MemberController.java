package com.project.trylab;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.member.MemberService;
import com.project.member.MemberVO;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	
	@RequestMapping(value = "memberOrder")
	public void order() throws Exception{
		
	}
	
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

}
