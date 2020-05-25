package com.iu.mk.review;

import com.iu.mk.board.BoardVO;

public class ReviewVO extends BoardVO{
	private long p_num;
	private String p_name;
	private long review_num;
	
	
	
	

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
