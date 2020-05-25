package com.iu.mk.pay;

import java.sql.Date;
import java.util.List;

import com.iu.mk.cart.CartVO;
import com.iu.mk.product.ProductVO;
import com.iu.mk.product.productfile.ProductFileVO;

public class PayInfoVO {
	private Long order_num;
	private Long total_price;
	private Long delivery;
	private Date payDate;
	private Long count;

	
	//외부테이블에서 받아온 정보들(Product, ProductFile)

	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	
	
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
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	
	
	
	
}
