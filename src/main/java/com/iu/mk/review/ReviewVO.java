package com.iu.mk.review;

import java.sql.Date;

import com.iu.mk.board.BoardVO;

public class ReviewVO extends BoardVO{
	private long p_num;
	private String p_name;
	private long review_num;
	private Date rDate;
	
	private String fileName;
	
	
	
	
	
	

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public long getReview_num() {
		return review_num;
	}

	public void setReview_num(long review_num) {
		this.review_num = review_num;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public long getP_num() {
		return p_num;
	}

	public void setP_num(long p_num) {
		this.p_num = p_num;
	}
	
	
	
}
