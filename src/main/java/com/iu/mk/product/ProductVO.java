package com.iu.mk.product;

import java.util.List;

import com.iu.mk.product.productfile.ProductFileVO;

public class ProductVO {
	
	private long p_num;
	private String p_name;
	private long price;
	private String contents;
	private String kind;
	
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	
	
	
	
}
