package com.project.trylab;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.file.MemberFileService;

@Controller
@RequestMapping("/ajax/")
public class AjaxController {

	@Inject
	private MemberFileService memberFileService;
	
	
	@RequestMapping(value="profileUpdate", method = RequestMethod.POST)
	public ModelAndView profileUpdate(String id) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		return mv;
		
	}
}
