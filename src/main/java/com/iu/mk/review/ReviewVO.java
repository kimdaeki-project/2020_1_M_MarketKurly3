package com.iu.mk.review;

import java.sql.Date;


public class ReviewVO{
	
	private long review_num;
	private long p_num;
	private String p_name;
	private String id;
	private String title;
	private String contents;
	private Date rDate;
	private long hit;
	private long ref;
	private long step;
	private long depth;
	

	
	private String fileName;



	public long getReview_num() {
		return review_num;
	}



	public void setReview_num(long review_num) {
		this.review_num = review_num;
	}



	public long getP_num() {
		return p_num;
	}



	public void setP_num(long p_num) {
		this.p_num = p_num;
	}



	public String getP_name() {
		return p_name;
	}



	public void setP_name(String p_name) {
		this.p_name = p_name;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getContents() {
		return contents;
	}



	public void setContents(String contents) {
		this.contents = contents;
	}



	public Date getrDate() {
		return rDate;
	}



	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}



	public long getHit() {
		return hit;
	}



	public void setHit(long hit) {
		this.hit = hit;
	}



	public long getRef() {
		return ref;
	}



	public void setRef(long ref) {
		this.ref = ref;
	}



	public long getStep() {
		return step;
	}



	public void setStep(long step) {
		this.step = step;
	}



	public long getDepth() {
		return depth;
	}



	public void setDepth(long depth) {
		this.depth = depth;
	}



	public String getFileName() {
		return fileName;
	}



	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
	
	
	
	
}
