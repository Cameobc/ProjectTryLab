package com.project.util;

import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class FileSaver {
	// 파일 저장
	//
	//1. Spring에서 제공하는 FileCopyUtils 클래스의 copy 메서드 사용
	// 저장경로, MultipartFile
	public String saveFile(String realPath, MultipartFile f1) throws Exception {
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		//a. 저장할 파일명 생성 (중복이 없어야 함)
		// 	 UUID 클래스 사용 (Universal Unique ID)
		// 저장될 이름
		String fileSystemName= UUID.randomUUID().toString();
		String originalName = f1.getOriginalFilename();
		originalName = originalName.substring(originalName.lastIndexOf("."));	// 확장자
		
		fileSystemName = fileSystemName + originalName;
		
		//b. 저장
		file = new File(realPath, fileSystemName);
		FileCopyUtils.copy(f1.getBytes(), file);
		
		return fileSystemName;
		
	}
	
	public String saveFile_test(String realPath, MultipartFile f1, MultipartFile multipartFile2) throws Exception {
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		//a. 저장할 파일명 생성 (중복이 없어야 함)
		// 	 UUID 클래스 사용 (Universal Unique ID)
		// 저장될 이름
		String fileSystemName= UUID.randomUUID().toString();
		String originalName = f1.getOriginalFilename();
		originalName = originalName.substring(originalName.lastIndexOf("."));	// 확장자
		
		fileSystemName = fileSystemName + originalName;
		
		//b. 저장
		file = new File(realPath, fileSystemName);
		FileCopyUtils.copy(f1.getBytes(), file);
		
		return fileSystemName;
		
	}
	
	//2. OutputStream 연결
	public String saveFile2(String realPath, MultipartFile f1) throws Exception {
		
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		//a. 저장할 파일명 생성 (중복이 없어야 함)
		// 	 UUID 클래스 사용 (Universal Unique ID)
		// 저장될 이름
		String fileSystemName= UUID.randomUUID().toString();
		String originalName = f1.getOriginalFilename();
		originalName = originalName.substring(originalName.lastIndexOf("."));	// 확장자
		
		fileSystemName = fileSystemName + originalName;
		
		//저장
		file = new File(realPath, fileSystemName);
		FileOutputStream fs = new FileOutputStream(file);
		fs.write(f1.getBytes());

		return fileSystemName;
	}
	
	//3. MultipartFile 클래스의  transferTo 메서드 사용
	 public String saveFile3(String realPath, MultipartFile f1) throws Exception {
			File file = new File(realPath);
			if(!file.exists()) {
				file.mkdirs();
			}
			
			//a. 저장할 파일명 생성 (중복이 없어야 함)
			// 	 UUID 클래스 사용 (Universal Unique ID)
			// 저장될 이름
			String fileSystemName= UUID.randomUUID().toString();
			String originalName = f1.getOriginalFilename();
			if(originalName.length()>0)
			originalName = originalName.substring(originalName.lastIndexOf("."));	// 확장자
			
			fileSystemName = fileSystemName + originalName;
		 
			// 저장
			file = new File(realPath, fileSystemName);
			f1.transferTo(file);
			
			return fileSystemName;
			
	 }
	 public int deleteFile(String realPath, String fname) throws Exception{
		 File file = new File(realPath, fname);
		 boolean result  = false;
		 int check=0;
		 if(file.exists()) {
			 result = file.delete();
			 
		 }
		 if(result) {
			 check=1;
		 }
		 return check;
	 }
	 
	 
	 
	 
	 
	 
	 
	
}
