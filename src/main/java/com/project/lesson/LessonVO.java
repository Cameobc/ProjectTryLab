package com.project.lesson;

import java.sql.Date;
import java.util.List;

public class LessonVO {

	private String class_id;
	private String category_id;
	private String tid;
	private String title;
	private int price;
	private String contents;
	private Date reg_date;
	private int hit;
	private String location;
	private int time;
	private int limit;
	private List<TimeTableVO> timetable;
	private List<LessonFileVO> file;
	
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
	
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}

	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public List<LessonFileVO> getFile() {
		return file;
	}
	public void setFile(List<LessonFileVO> file) {
		this.file = file;
	}
	public List<TimeTableVO> getTimetable() {
		return timetable;
	}
	public void setTimetable(List<TimeTableVO> timetable) {
		this.timetable = timetable;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	
}
