package com.project.memberProfile;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.project.util.FileSaver;

@Service
public class MemberFileService {
	@Inject
	private MemberFileDAO memberFileDAO;
	@Inject
	private FileSaver fileSaver;
	
	public int profileUpdate(String id, HttpSession session) throws Exception {
		String realPath = session.getServletContext().getRealPath("/resources/member");
		
		return memberFileDAO.profileUpdate(id);
	}

}
