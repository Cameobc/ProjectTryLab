package com.project.util;

public class PageMaker {

	private int perPage = 10; //setter
	private Integer curPage; //getter,setter
	private String kind; //getter,setter
	private String search; //getter,setter
	
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public Integer getCurPage() {
		if(curPage == null) {
			this.curPage = 1;
		}
		return curPage;
	}
	public void setCurPage(Integer curPage) {
		this.curPage = curPage;
		if(curPage == null) {
			this.curPage = 1;
		}
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getSearch() {
		if(search == null) {
			this.search = "";
		}
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	
	//rownum
	private int startRow; //getter
	private int lastRow; //getter
	
	public int getStartRow() {
		return startRow;
	}
	public int getLastRow() {
		return lastRow;
	}
	
	//page
	private int totalBlock; //getter
	private int curBlock; //getter
	private int startNum; //getter
	private int lastNum; //getter

	public int getTotalBlock() {
		return totalBlock;
	}
	public int getCurBlock() {
		return curBlock;
	}
	public int getStartNum() {
		return startNum;
	}
	public int getLastNum() {
		return lastNum;
	}
	
	/////////////////////////////////////////////////////////////////////////
	public void makeRow() {
		this.startRow = (this.getCurPage()-1) * this.perPage + 1; //startRow
		this.lastRow = this.curPage * perPage; //lastRow
	}
	
	public void makePage(int totalCount) {
		int totalPage = totalCount / perPage; //totalPage
		if(totalCount % perPage != 0) {
			totalPage++;
		}
		
		int perBlock = 5;
		this.totalBlock = totalPage / perBlock; //totalBlock
		if(totalPage % perBlock != 0) {
			this.totalBlock++;
		}
		
		this.curBlock = curPage / perBlock; //curBlock
		if(this.curPage % perBlock != 0) {
			curBlock++;
		}
		
		this.startNum = (this.curBlock-1) * perBlock+1; //startNum
		this.lastNum = this.curBlock * perBlock; //lastNum
		
		if(this.curBlock == totalBlock) {
			this.lastNum = totalPage;
		}
		
		
		
	}
	
	
	
	 
}
