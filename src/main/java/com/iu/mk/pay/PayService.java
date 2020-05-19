package com.iu.mk.pay;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iu.mk.cart.CartVO;

@Service
public class PayService {
	
	@Autowired
	private PayDAO payDAO;
	
	
	public int pay(PayVO payVO) throws Exception{
		return payDAO.pay(payVO);
	}
	
	public List<CartVO> scCart (long cart_num) throws Exception{
		return payDAO.scCart(cart_num);
	}

	public int payInsert(PayVO payVO) throws Exception{
		return payDAO.payInsert(payVO);
	}
	
	
	public Long orderNum() throws Exception{
		return payDAO.orderNum();
	}
	
	public List<Long> scPrice(Long order_num) throws Exception{
		return payDAO.scPrice(order_num);
	}
	
	
	public int payInfoInsert(PayInfoVO payInfoVO) throws Exception{
		return payDAO.payInfoInsert(payInfoVO);
	}
}
