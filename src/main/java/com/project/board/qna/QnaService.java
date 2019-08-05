package com.project.board.qna;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.file.FileDAO;
import com.project.file.FileVO;
import com.project.util.FileSaver;
import com.project.util.PageMaker;

@Service
public class QnaService {

	@Inject
	private QnaDAO qnaDAO;
	@Inject
	private FileDAO fileDAO;
	@Inject
	private FileSaver fileSaver;
	
	
	//write
	public int setWrite(QnaVO qnaVO, HttpSession session, List<MultipartFile> multipartFiles) throws Exception {
		int result = qnaDAO.setWrite(qnaVO);
		String realPath = session.getServletContext().getRealPath("/resources/qna");
		
		System.out.println("realPath :"+realPath);
		ArrayList<FileVO> files = new ArrayList<FileVO>();
		
		for(MultipartFile f:multipartFiles) {
			if(f.getOriginalFilename().length()>0) {
				FileVO fileVO = new FileVO();
				fileVO.setNum(qnaVO.getNum());
				fileVO.setOname(f.getOriginalFilename());
				fileVO.setFname(fileSaver.saveFile(realPath, f));
				files.add(fileVO);
			}
		}
		if(files.size()>0) {
			result = fileDAO.setWrite(files);
		}
		return result;
	}
	
	//delete
	public int setDelete(int num, HttpSession session) throws Exception {
		String realPath = session.getServletContext().getRealPath("/resources/qna");
		List<FileVO> files = fileDAO.getList(num);
		int result = fileDAO.setDeleteAll(num);
		result = qnaDAO.setDelete(num);
		
		for(int i=0; i<files.size(); i++) {
			fileSaver.deleteFile(realPath, files.get(i).getFname());
		}
		return result;
	}
	
	//update
	public int setUpdate(QnaVO qnaVO, HttpSession session, List<MultipartFile> f1) throws Exception{
		int result = qnaDAO.setUpdate(qnaVO);
		String realPath = session.getServletContext().getRealPath("/resources/qna");
		
		ArrayList<FileVO> files = new ArrayList<FileVO>();
		for(MultipartFile multipartFile:f1) {
			if(multipartFile.getOriginalFilename().length()>0) {
				FileVO fileVO = new FileVO();
				fileVO.setNum(qnaVO.getNum());
				fileVO.setOname(multipartFile.getOriginalFilename());
				fileVO.setFname(fileSaver.saveFile(realPath, multipartFile));
				files.add(fileVO);
			}
		}
		if(files.size()>0) {
			result = fileDAO.setWrite(files);
		}
		return result;
	}
	
	//select
	public QnaVO getSelect(int num) throws Exception {
		QnaVO qnaVO = qnaDAO.getSelect(num);
		if(qnaVO.getFiles().size() == 1) {
			if(qnaVO.getFiles().get(0).getFname() == null) {
				qnaVO.setFiles(new ArrayList<FileVO>());
			}
		}
		return qnaVO;
		
	}
	
	//list
	public List<QnaVO> getList(PageMaker pageMaker) throws Exception {
		pageMaker.makeRow();
		List<QnaVO> list = qnaDAO.getList(pageMaker);
		
		int totalCount = qnaDAO.getTotalCount(pageMaker);
		pageMaker.makePage(totalCount);
		
		return list;
	}
	
	//reply
	public int setReply(QnaVO qnaVO) throws Exception {
		int result = qnaDAO.setReplyUpdate(qnaVO);
		result = qnaDAO.setReply(qnaVO);
		
		return result;

	}
	
	
	
}
