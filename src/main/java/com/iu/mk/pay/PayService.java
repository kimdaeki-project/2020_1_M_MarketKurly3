package com.iu.mk.pay;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iu.mk.cart.CartVO;
import com.iu.mk.product.ProductVO;
import com.iu.mk.util.Pager;

@Service
public class PayService {
	
	@Autowired
	private PayDAO payDAO;
	
	public PayInfoVO totalPrice(Long order_num) throws Exception{
		return payDAO.totalPrice(order_num);
	}
	
	
	public List<CartVO> finalCart (long cart_num,long order_num) throws Exception{
		System.out.println("se :" + cart_num);
		
		HashMap<String, Long> param = new HashMap<String, Long>();
		param.put("cart_num",cart_num);
		param.put("order_num",order_num);
		
		return payDAO.finalCart(param);
	}
	
	
	public int pay(PayVO payVO) throws Exception{
		return payDAO.pay(payVO);
	}
	
	public List<CartVO> scCart (long cart_num) throws Exception{
		return payDAO.scCart(cart_num);
	}

	public int payInsert(PayVO payVO) throws Exception{

		return payDAO.payInsert(payVO);
	}
	

	public int payInfoInsert(PayInfoVO payInfoVO) throws Exception{
		return payDAO.payInfoInsert(payInfoVO);
	}
	

	public int payCheckUpdate(Long order_num) throws Exception {
		return payDAO.payCheckUpdate(order_num);
	}
	

	public List<Long> scPrice(Long order_num) throws Exception{
		return payDAO.scPrice(order_num);
	}

	public Long orderNum() throws Exception{
		return payDAO.orderNum();
	}


	
	
	//soyeon
	public PayInfoVO payList(Long m) throws Exception{
		//System.out.println("m s: "+m);
		return payDAO.payList(m);
	}
	

	public List<Long> orderNum2(String id, Pager pager) throws Exception{
		pager.makeRow(); //1-12번 설정
		
		System.out.println("id s : " + id);
		
		long totalCount = payDAO.payCount(id);
		System.out.println("totalCount : "+totalCount);
		pager.makePage(totalCount);//totalcount넘겨주기
		
		System.out.println(totalCount +"들어오니?");
		System.out.println(pager.getTotalPage()+"a몇개니?");
		
		HashMap<String, Object> pa = new HashMap<String, Object>();
		pa.put("id", id);
		pa.put("pager", pager);
		
		return payDAO.orderNum2(pa); 
	}
	  
	public void paySelect() throws Exception {
		
	}
} 
