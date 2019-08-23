package com.project.file;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.util.FileSaver;


@Service
public class FileService {

	@Inject
	private FileDAO fileDAO;
	@Inject
	private FileSaver fileSaver;
	
	public int summernoteFileDelete(String fileName, HttpSession session)throws Exception{
		String realPath = session.getServletContext().getRealPath("/resources/summernote");
		fileName = fileName.substring(fileName.lastIndexOf("/"));
		System.out.println(realPath);
		System.out.println(fileName);
		int result = fileSaver.deleteFile(realPath, fileName);
		return result;		
	}
	
	public String summernoteFileUpload(MultipartFile file, HttpSession session)throws Exception{
		String realPath = session.getServletContext().getRealPath("/resources/summernote");
		 String fname= fileSaver.saveFile(realPath, file);
		 return fname;
	}
	
	public int setDelete(FileVO fileVO, String board, HttpSession session)throws Exception{
		int result = fileDAO.setDelete(fileVO.getFnum());
		
		if(result>0) {
			String realPath = session.getServletContext().getRealPath("/resources/"+board);
			result = fileSaver.deleteFile(realPath, fileVO.getFname());
		}
		return result;
	}
	
	

}
