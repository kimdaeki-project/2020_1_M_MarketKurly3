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
		//개수와 곱해서 다시 넣어주기
		Long price = payVO.getPay_price();
		Long count = (long) payDAO.pCount(payVO.getCq_num());
		payVO.setPay_price(price*count);
		
		
		
		
		
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
	
	public int payCheckUpdate(Long order_num) throws Exception {
		return payDAO.payCheckUpdate(order_num);
	}
	

} 
