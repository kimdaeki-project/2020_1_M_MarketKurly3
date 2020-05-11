package com.iu.mk.product;

import java.util.List;

import com.iu.mk.product.productfile.ProductFileVO;

public class ProductVO {
	
	private long p_num;
	private String p_name;
	private long price;
	private int p_kind;
	private String contents;
	
	private List<ProductFileVO> productFileVOs;
	

	
	public List<ProductFileVO> getProductFileVOs() {
		return productFileVOs;
	}
	public void setProductFileVOs(List<ProductFileVO> productFileVOs) {
		this.productFileVOs = productFileVOs;
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
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public int getP_kind() {
		return p_kind;
	}
	public void setP_kind(int p_kind) {
		this.p_kind = p_kind;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	
	
}
