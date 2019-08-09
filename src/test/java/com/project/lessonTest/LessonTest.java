package com.project.lessonTest;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.project.lesson.LessonFileDAO;
import com.project.lesson.LessonFileVO;
import com.project.trylab.AbstractTest;

public class LessonTest extends AbstractTest{

	@Inject
	private LessonFileDAO lessonFileDAO;
	@Test
	public void test() throws Exception {
		List<LessonFileVO> files = new ArrayList<LessonFileVO>();
		for(int i=3;i<6;i++) {
			LessonFileVO f = new LessonFileVO();
			f.setClass_id("test"+i);
			f.setFname("fname"+i);
			f.setOname("oname"+i);
			f.setThumbnail(0);
			files.add(f);
		}
		int result =lessonFileDAO.setWrite(files);
		
		assertEquals(1, result);
	}

}
