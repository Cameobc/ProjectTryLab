package com.project.trylab;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.admin.AdminService;
import com.project.member.MemberVO;
import com.project.util.PageMaker;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Inject
	private AdminService adminService;
	

	@RequestMapping(value="memberList", method = RequestMethod.GET)
	public void getList(PageMaker pageMaker, Model model) throws Exception {
		List<MemberVO> list = adminService.getList(pageMaker);
		model.addAttribute("list", list);
		model.addAttribute("pager", pageMaker);
	}
	
	@RequestMapping(value="adminMain", method = RequestMethod.GET)
	public void adminMain() throws Exception {}
	
	@RequestMapping(value="tutorApproval", method =RequestMethod.GET)
	public void gradeUpdate() throws Exception{
		
		
		
		
		
		
		
	}
}
