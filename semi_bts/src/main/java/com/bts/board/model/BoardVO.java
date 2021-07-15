package com.bts.board.model;

import java.sql.Timestamp;

public class BoardVO {
	private int cbNo;
	private String userid;
	private String title;
	private String content;
	private Timestamp regdate;
	private int count;
	
	public BoardVO() {
		super();
	}

	public BoardVO(int cbNo, String userid, String title, String content, Timestamp regdate, int count) {
		super();
		this.cbNo = cbNo;
		this.userid = userid;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.count = count;
	}

	public int getCbNo() {
		return cbNo;
	}

	public void setCbNo(int cbNo) {
		this.cbNo = cbNo;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
}
