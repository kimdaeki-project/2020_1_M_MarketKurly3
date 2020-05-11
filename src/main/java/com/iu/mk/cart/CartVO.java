package com.iu.mk.cart;

import java.util.List;

public class CartVO {
	private long m_num;
	private long random_num;
	private long p_num;
	private long p_count;
	
	
	
	private List<CartVO> cartVOs;
	
	
	
	
	
	
	
	public List<CartVO> getCartVOs() {
		return cartVOs;
	}
	public void setCartVOs(List<CartVO> cartVOs) {
		this.cartVOs = cartVOs;
	}
	public long getM_num() {
		return m_num;
	}
	public void setM_num(long m_num) {
		this.m_num = m_num;
	}
	public long getRandom_num() {
		return random_num;
	}
	public void setRandom_num(long random_num) {
		this.random_num = random_num;
	}
	public long getP_num() {
		return p_num;
	}
	public void setP_num(long p_num) {
		this.p_num = p_num;
	}
	public long getP_count() {
		return p_count;
	}
	public void setP_count(long p_count) {
		this.p_count = p_count;
	}
	
	
	
	
}
