package com.iu.mk.pay;

import java.util.List;

import com.iu.mk.product.ProductVO;
import com.iu.mk.product.productfile.ProductFileVO;

public class PayInfoVO {
	private Long order_num;
	private Long total_price;
	private Long delivery;
	private Long payDate;
	
	//외부테이블에서 받아온 정보들(Product, ProductFile)
	
	private List<ProductVO> productVOs;
	
	private List<ProductFileVO> productFileVOs;
	
	
	
	public List<ProductVO> getProductVOs() {
		return productVOs;
	}
	public void setProductVOs(List<ProductVO> productVOs) {
		this.productVOs = productVOs;
	}
	public List<ProductFileVO> getProductFileVOs() {
		return productFileVOs;
	}
	public void setProductFileVOs(List<ProductFileVO> productFileVOs) {
		this.productFileVOs = productFileVOs;
	}
	
	
	
	
	public Long getOrder_num() {
		return order_num;
	}
	public void setOrder_num(Long order_num) {
		this.order_num = order_num;
	}
	public Long getTotal_price() {
		return total_price;
	}
	public void setTotal_price(Long total_price) {
		this.total_price = total_price;
	}
	public Long getDelivery() {
		return delivery;
	}
	public void setDelivery(Long delivery) {
		this.delivery = delivery;
	}
	public Long getPayDate() {
		return payDate;
	}
	public void setPayDate(Long payDate) {
		this.payDate = payDate;
	}
	
	
	
	
}
