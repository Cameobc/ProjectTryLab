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
	
	
	
	

}
