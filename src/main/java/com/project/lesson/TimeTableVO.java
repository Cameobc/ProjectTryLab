package com.project.lesson;

public class TimeTableVO {
	private String class_id;
	private String class_date;
	private String startTime;
	private String endTime;
	private int idx;
	
	private int curPerson;
	
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public String getClass_date() {
		return class_date;
	}
	public void setClass_date(String class_date) {
		this.class_date = class_date;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public int getCurPerson() {
		return curPerson;
	}
	public void setCurPerson(int curPerson) {
		this.curPerson = curPerson;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	
}
