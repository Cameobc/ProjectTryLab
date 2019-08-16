package com.project.member;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.mail.MailForm;
import com.project.mail.MailService;
import com.project.mail.MailSet;
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
	private MailService mailService;
	@Inject
	private MailSet mailSet;
	
	
	
	//회원정보 조회
	public MemberVO selectOne(String id) throws Exception{
		
		
		return memberDAO.selectOne(id);
	}
	
	
	//비밀번호 찾기
	public int setFindPw(MemberVO memberVO) throws Exception{
		int result = memberDAO.findPw(memberVO);
		
		if(result>0) {
			//임시 비밀번호 발급 후 암호화
			String pw = mailService.createTempPassword();
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			memberVO.setPw(passwordEncoder.encode(pw));
			result = memberDAO.setUpdatePw(memberVO);

			if(result>0) {
				MailForm mailForm = mailSet.sendPw(memberVO, pw);
				mailService.mailSend(memberVO, mailForm);
			}
			
		}
		
		return result;
	}
	
	//아이디 찾기
	public String getId(MemberVO memberVO) throws Exception{
		return memberDAO.getId(memberVO);
	}
	
	//메일 인증 후 업데이트
	public int updateGrade(MemberVO memberVO) throws Exception{
		return memberDAO.updateGrade(memberVO);
	}
	
	//회원가입
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
		String key = mailService.createKey();
		memberVO.setMail_key(key);
		
		//가입성공
		int result = memberDAO.setWrite(memberVO);
		result = memberFileDAO.setWrite(memberFileVO);

		//MAIL발송
		MailForm mailForm = mailSet.joinTrylab(memberVO);
		mailService.mailSend(memberVO, mailForm);
		
		return result;
	}
	
	
	//로그인
	public MemberVO getSelect(MemberVO memberVO) throws Exception {
		return memberVO=memberDAO.getSelect(memberVO);
		
	}
	
	//중복확인
	public int checkMember(Map<String, Object> map) throws Exception{
		return memberDAO.checkMember(map);
	}
}
