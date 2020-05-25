package com.iu.mk.review.reviewfile;

public class ReviewFileVO {
	private long fileNum;
	private long review_num;

	private String oriName;
	private String fileName;
	
	
	public long getFileNum() {
		return fileNum;
	}
	public void setFileNum(long fileNum) {
		this.fileNum = fileNum;
	}
	public long getReview_num() {
		return review_num;
	}
	public void setReview_num(long review_num) {
		this.review_num = review_num;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	
	
}
