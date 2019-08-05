package com.project.board.qna;

import java.sql.Date;
import java.util.ArrayList;

import com.project.file.FileVO;


public class QnaVO {

	private int num;
	private String title;
	private String writer;
	private String contents;
	private String email;
	private Date reg_date;
	private int hit;
	private int step;
	private int ref;
	private int depth;
	private ArrayList<FileVO> files;
	
	
	public ArrayList<FileVO> getFiles() {
		return files;
	}
	public void setFiles(ArrayList<FileVO> files) {
		this.files = files;
	}
	public int getNum() {
		return num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	
	
	
}
