package com.project.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.file.MemberFileDAO;
import com.project.file.MemberFileVO;
import com.project.util.FileSaver;

@Service
public class MemberService {

	@Inject
	private MemberDAO memberDAO;
	@Inject
	private FileSaver fileSaver;
	@Inject
	private MemberFileDAO memberFileDAO;
	
	public int setWrite(MemberVO memberVO, MultipartFile photo, HttpSession session) throws Exception {
		
		String realPath = session.getServletContext().getRealPath("/resources/member");
		System.out.println(realPath);
		
		String fname = fileSaver.saveFile(realPath, photo);
		String oname = photo.getOriginalFilename();
		System.out.println(fname);
		MemberFileVO memberFileVO = new MemberFileVO();
		memberFileVO.setId(memberVO.getId());
		memberFileVO.setFname(fname);
		memberFileVO.setOname(oname);
		
		int result = memberDAO.setWrite(memberVO);
		result = memberFileDAO.setWrite(memberFileVO);
		
		return result;
	}
	
	public MemberVO getSelect(MemberVO memberVO) throws Exception {
		return memberVO=memberDAO.getSelect(memberVO);
		
	}
}
