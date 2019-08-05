﻿package com.project.trylab;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.member.MemberService;
import com.project.member.MemberVO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.trylab.member.MemberVO;
import com.project.trylab.member.MemberService;
import com.project.trylab.util.PageMaker;



@Controller
@RequestMapping("/member/")
public class MemberController {

	
	@Inject
	private MemberService memberService;
	
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



	@Inject
	private MemberService memberService;

	
	
	
	//adminPage
	
	@RequestMapping(value = "memberAdmin", method = RequestMethod.POST)
	public String memberAdmin(String [] id) throws Exception{
		memberService.setDelete(id);
		return "redirect:./memberAdmin";
	}
	
	@RequestMapping(value = "memberAdmin", method = RequestMethod.GET)
	public void memberAdmin(PageMaker pageMaker, Model model)throws Exception{
		List<MemberVO> list = memberService.getList(pageMaker);
		model.addAttribute("list", list);
		model.addAttribute("pager", pageMaker);
	}
	
	//memberPage
	@RequestMapping(value="memberPage")
	public void memberPage() throws Exception {}
	
	
	//logout
	@RequestMapping(value = "memberLogout")
	public String logout(HttpSession session)throws Exception{
		session.invalidate();
		return "redirect:../";
	}
	
	//회원가입 처리
	/*
	 * @RequestMapping(value = "memberJoin", method = RequestMethod.POST) public
	 * ModelAndView setWrite(@Valid MemberVO memberDTO, BindingResult bindingResult,
	 * MultipartFile photo, HttpSession session)throws Exception{ ModelAndView mv =
	 * new ModelAndView();
	 * 
	 * 
	 * if(bindingResult.hasErrors()) { mv.setViewName("member/memberJoin"); return
	 * mv; }

	 * int result = memberService.setWrite(memberVO, photo, session); String
	 * message="Join Fail"; if(result>0) { message="Join Success"; }
	 * 
	 * mv.setViewName("common/messageMove"); mv.addObject("message", message);
	 * mv.addObject("path", "../");
	 * 
	 * return mv; }
	 */
	
	
	//회원가입
	@RequestMapping(value = "memberJoin", method = RequestMethod.GET)
	public void setWrite(MemberVO memberVO)throws Exception{}
	
	
	//로그인
	@RequestMapping(value = "memberLogin", method = RequestMethod.GET)
	public void getSelect()throws Exception{}
	
	//로그인 처리
	@RequestMapping(value = "memberLogin", method = RequestMethod.POST)
	public ModelAndView getSelect(MemberVO memberVO, HttpSession session)throws Exception{
		memberVO = memberService.getSelect(memberVO);
		String message="Login Fail";
		if(memberVO != null) {
			session.setAttribute("member", memberVO);
			message = "Login Success";
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/messageMove");
		mv.addObject("message", message);
		mv.addObject("path", "../");
		return mv;
	}

}
