package com.project.member;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.mail.MailKey;
import com.project.memberProfile.MemberFileDAO;
import com.project.memberProfile.MemberFileVO;
import com.project.util.FileSaver;

@Service
public class MemberService {

	@Inject
	private MemberDAO memberDAO;
	@Inject
	private FileSaver fileSaver;
	@Inject
	private MemberFileDAO memberFileDAO;
	@Inject
	private MailKey mailKey;
	
	//MAIL발송
	
	public int setWrite(MemberVO memberVO, MultipartFile photo, HttpSession session) throws Exception {
		
		String realPath = session.getServletContext().getRealPath("/resources/member");
		//System.out.println(realPath);
		
		String fname = fileSaver.saveFile(realPath, photo);
		String oname = photo.getOriginalFilename();
		MemberFileVO memberFileVO = new MemberFileVO();
		memberFileVO.setId(memberVO.getId());
		memberFileVO.setFname(fname);
		memberFileVO.setOname(oname);
		
		//비밀번호 암호화
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		memberVO.setPw(passwordEncoder.encode(memberVO.getPw()));
		
		//메일 키 발급
		String key = mailKey.createKey();
		memberVO.setMail_key(key);
		
		int result = memberDAO.setWrite(memberVO);
		result = memberFileDAO.setWrite(memberFileVO);
		
		return result;
	}
	
	public MemberVO getSelect(MemberVO memberVO) throws Exception {
		return memberVO=memberDAO.getSelect(memberVO);
		
	}
	
	//중복확인
	public int checkMember(Map<String, Object> map) throws Exception{
		return memberDAO.checkMember(map);
	}
}
