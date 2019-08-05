package com.project.trylab.util;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Repository;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

public class FileSaver {

	public String saveFile(String realPath, MultipartFile multipartFile) throws Exception {
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		String fileSystemName = UUID.randomUUID().toString(); //파일이름 랜덤값
		String originalName = multipartFile.getOriginalFilename(); //저장될때 이름
		originalName = originalName.substring(originalName.lastIndexOf('.')); //확장자
		fileSystemName = fileSystemName + originalName; // 랜덤값 + .확장자
		System.out.println("fileSystemName :"+ fileSystemName);
		
		file = new File(realPath, fileSystemName);
		FileCopyUtils.copy(multipartFile.getBytes(), file);
		
		return fileSystemName;
	}

	//delete
	public int deleteFile(String realPath, String fname) throws Exception {
		File file = new File(realPath, fname);
		boolean result = false;
		int check = 0;
		if(file.exists()) {
			result = file.delete();
		}
		if(result) {
			check = 1;
		}
		return check;
	}
	
	
	
	
	
	
	
}	
