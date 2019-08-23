package com.project.lessonTest;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.project.lesson.LessonDAO;
import com.project.lesson.LessonFileDAO;
import com.project.lesson.LessonFileVO;
import com.project.lesson.LessonService;
import com.project.trylab.AbstractTest;
import com.project.trylab.LessonController;

public class LessonTest extends AbstractTest{

	@Inject
	private LessonDAO lessonDAO;
	@Inject
	private LessonService service;
	@Inject
	private LessonController controller;
	
	
	@Test
	public void test() throws Exception {
		
		assertNotNull(controller);
	}

}
