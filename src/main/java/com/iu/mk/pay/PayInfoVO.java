package com.iu.mk.pay;

public class PayInfoVO {
	private Long order_num;
	private Long total_price;
	private Long delivery;
	private Long payDate;
	
	
	
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
