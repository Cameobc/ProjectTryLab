package com.project.qna;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class QnaVOValidate implements Validator {
	
	@Inject
	private QnaDAO qnaDAO;

	@Override
	public boolean supports(Class<?> clazz) {
		return QnaVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		QnaVO qnaVO = (QnaVO)target;
		String title = qnaVO.getTitle();
		String writer = qnaVO.getWriter();
		String contents = qnaVO.getContents();
		String email = qnaVO.getEmail();
		
		if(title == null || title.length() == 0) {
			errors.rejectValue("title", "qna.title");
		}
		if(writer == null || writer.length() == 0) {
			errors.rejectValue("writer", "qna.writer");
		}
		if(contents == null || contents.length() == 0) {
			errors.rejectValue("contents", "qna.contents");
		}
		if(email == null || email.length() == 0) {
			errors.rejectValue("email", "qna.email");
		}
	}

}
