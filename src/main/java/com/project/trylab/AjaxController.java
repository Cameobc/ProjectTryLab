package com.project.trylab;

import java.io.File;
import java.nio.file.FileVisitOption;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.file.FileService;
import com.project.file.FileVO;

import com.project.member.MemberService;

import com.project.lesson.LessonFileService;


@Controller
public class AjaxController {
	@Inject
	private FileService fileService;
	@Inject
	private MemberService memberService;
	@Inject
	private LessonFileService lessonFileService;

	
	@RequestMapping(value = "/ajax/summerFileDelete", method = RequestMethod.POST)
	public ModelAndView summerFileDelete(String fileName, HttpSession session)throws Exception{
		int result = fileService.summernoteFileDelete(fileName, session);
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName("common/message");
		return mv;
	}
	
	@RequestMapping(value = "/ajax/summerFileUpload", method = RequestMethod.POST)
	public ModelAndView summerFileUpload(MultipartFile file, HttpSession session)throws Exception{
		String fileName = session.getServletContext().getContextPath();
		//fileName=fileName+File.separator+"resources"+File.separator+"summernote"+File.separator;
		fileName=fileName+"/resources/summernote/";
		fileName =fileName + fileService.summernoteFileUpload(file, session);
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", fileName);
		mv.setViewName("common/message");
		return mv;
	}
	
	@RequestMapping(value = "/ajax/fileDownload", method = RequestMethod.POST)
	public ModelAndView fileDownload(FileVO fileVO, String board)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("file", fileVO);
		mv.addObject("board", board);
		mv.setViewName("fileDown");
		return mv;
	}
	
	@RequestMapping(value = "/ajax/fileDelete", method = RequestMethod.POST)
	public ModelAndView fileDelete(FileVO fileVO, String board, HttpSession session)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		int result = fileService.setDelete(fileVO, board, session);
		mv.addObject("result", result);
		mv.setViewName("common/message");
		return mv;
	}

	

	@ResponseBody
	@RequestMapping(value = "checkMember")
	public int checkMember(@RequestBody Map<String, Object> params) throws Exception{
		int result=memberService.checkMember(params);
		return result;

	}
	
	@RequestMapping(value = "/ajax/lessonFileDelete", method = RequestMethod.POST)
	public ModelAndView lessonFileDelete(int fnum, String board, HttpSession session)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		int result = lessonFileService.setDeleteByFnum(fnum);
		mv.addObject("result", result);
		mv.setViewName("common/message");
		return mv;

	}

}
