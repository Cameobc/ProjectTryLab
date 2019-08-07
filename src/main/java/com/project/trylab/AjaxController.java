package com.project.trylab;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.member.MemberService;

@Controller
@RequestMapping("/ajax/")
public class AjaxController {

	
	@Inject
	private MemberService memberService;
	
	@ResponseBody
	@RequestMapping(value = "checkMember")
	public int checkMember(@RequestBody Map<String, Object> params) throws Exception{
		int result=memberService.checkMember(params);
		return result;
	}
}
