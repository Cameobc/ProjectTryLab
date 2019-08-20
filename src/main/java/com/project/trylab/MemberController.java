package com.project.trylab;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.approval.ApprovalService;
import com.project.approval.ApprovalVO;
import com.project.member.MemberService;
import com.project.member.MemberVO;
import com.project.qna.QnaVO;
import com.project.util.PageMaker;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	@Inject
	private ApprovalService approvalService;
	@Inject
	private BCryptPasswordEncoder passwordEncoder;
	
	
	//pw업데이트
	@RequestMapping(value = "memberPwUpdate", method = RequestMethod.GET)
	public void memberPwUpdate() throws Exception{
		
	}
	
	//회원정보 수정하기
	@RequestMapping(value = "memberUpdate", method = RequestMethod.POST)
	public ModelAndView memberUpdate(MemberVO memberVO, MultipartFile photo, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		String message = "Update Fail";
		int result = memberService.setUpdate(memberVO, photo, session);
		if(result>0) {
			message = "Update Success";
		}
		mv.addObject("message", message);
		mv.addObject("path", "./memberMypage");
		mv.setViewName("common/messageMove");
		return mv;
	}
	
	//회원 정보 수정  폼으로 가기
	@RequestMapping(value = "memberUpdate", method = RequestMethod.GET)
	public ModelAndView memberUpdate(MemberVO memberVO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO vo=(MemberVO)session.getAttribute("member");
		String id = vo.getId();
		vo=memberService.selectOne(id);
		return mv;
	}
	
	//문의 내역
	@RequestMapping(value = "memberQna")
	public ModelAndView memberQna(HttpSession session, PageMaker pageMaker) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<QnaVO> list = memberService.getQnaList(pageMaker, session);
		mv.addObject("qnalist", list);
		mv.addObject("pager", pageMaker);
		mv.addObject("headset", "4");
		return mv;
	}
	
	//결제 내역
	@RequestMapping(value = "memberPayment")
	public ModelAndView memberPayment() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("headset", "3");
		return mv;
	}
	
	//스케줄관리
	@RequestMapping(value = "memberSchedule")
	public ModelAndView memberSchedule() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("headset", "2");
		return mv;
	}
	
	//회원정보 조회
	@RequestMapping(value = "memberMypage", method = RequestMethod.GET)
	public ModelAndView memberMypage(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO vo=(MemberVO)session.getAttribute("member");
		String id = vo.getId();
		vo=memberService.selectOne(id);
		mv.addObject("headset", "1");
		mv.addObject("member", vo);
		return mv;
	}
	
	
	@RequestMapping(value = "findPw", method = RequestMethod.POST)
	public ModelAndView findPw(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		String message="아이디나 이메일을 다시 한 번 확인해주세요.";
		int result = memberService.setFindPw(memberVO);
		if(result>0) {
			message = "이메일을 확인해주세요.";
		}
		mv.addObject("message", message);
		mv.addObject("path", "../");
		mv.setViewName("common/messageMove");
		return mv;
	}
	
	@RequestMapping(value = "findPw", method = RequestMethod.GET)
	public void findPw() throws Exception{
		
	}
	
	@RequestMapping(value = "findId")
	public void findId() throws Exception{
		
	}
	
	@RequestMapping(value = "memberOrder")
	public void memberOrder() throws Exception{
	}
	
	@RequestMapping(value = "memberAgree")
	public void memberAgree() throws Exception{
		
	}
	
	@RequestMapping(value = "joinConfirm")
	public ModelAndView joinConrifm(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = memberService.updateGrade(memberVO);
		String message = "확인 불가";
		if(result>0) {
			message = "메일 인증 완료";
		}
		mv.addObject("message", message);
		mv.addObject("path", "../");
		mv.setViewName("common/messageMove");
		
		return mv;
	}
	
	@RequestMapping(value="memberJoin", method = RequestMethod.POST)
	public ModelAndView setWrite(@Valid MemberVO memberVO, BindingResult bindingResult, MultipartFile photo, HttpSession session )throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if(bindingResult.hasErrors()) {
			mv.setViewName("member/memberJoin");
			return mv;
		}
		
		int result = memberService.setWrite(memberVO, photo, session);
		String message="Join Fail";
		if(result>0) {
			message ="이메일에서 인증번호를 확인해주세요!";	
		}
		mv.addObject("message", message);
		mv.addObject("path", "./memberLogin");
		mv.setViewName("common/messageMove");
		
		return mv;
	}
	@RequestMapping(value="memberJoin", method = RequestMethod.GET)
	public void setWrite(MemberVO memberVO) throws Exception {
		
	}

	@RequestMapping(value="memberLogin", method = RequestMethod.POST)
	public ModelAndView getSelect(MemberVO memberVO, ApprovalVO approvalVO, HttpSession session, String remember, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();

		approvalVO = approvalService.getSelect(memberVO.getId());
		
		MemberVO memberVO2 = memberService.getSelect(memberVO);
		String message = "Login Fail";
		if(memberVO2!= null&&passwordEncoder.matches(memberVO.getPw(), memberVO2.getPw())) {
			
			session.setAttribute("member", memberVO2);
			session.setAttribute("approval", approvalVO);
			message = "Login Success";
			
		}
		String check = "0";
		
		//쿠키생성
		if(remember!=null) {
			check= "1";
			Cookie cookie = new Cookie("id", memberVO.getId());
			Cookie cookie2 = new Cookie("remember", check);
			response.addCookie(cookie);
			response.addCookie(cookie2);
		}else {
			Cookie cookie = new Cookie("id", "");
			Cookie cookie2 = new Cookie("remember", check);
			response.addCookie(cookie);
			response.addCookie(cookie2);
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
	
	@RequestMapping(value="tutorUpdate", method = RequestMethod.GET)
	public void tutorUpdate() throws Exception {
		
	}
	
	
	
}
