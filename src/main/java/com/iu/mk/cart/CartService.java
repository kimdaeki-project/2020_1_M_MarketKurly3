package com.iu.mk.cart;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iu.mk.product.ProductDAO;
import com.iu.mk.product.ProductVO;

@Service
public class CartService {

	@Autowired
	private CartDAO cartDAO;
	
	
	
	
	
	public List<CartVO> cartList(Long cart_num) throws Exception {
		return cartDAO.cartList(cart_num);
	}
	
	
	
	public int cartInsert(CartVO cartVO) throws Exception{

		int result = cartDAO.cartInsert(cartVO);
	
		return result;
	}
	
	
	
	public int cartDelete(Long cq_num) throws Exception {
		return cartDAO.cartDelete(cq_num);
	}
	
	
	public CartVO cartSearch(Long p_num, Long cart_num) throws Exception {
		System.out.println("search - service");
		System.out.println(p_num);
		
		HashMap<String, Long> param = new HashMap<String, Long>();
		param.put("p_num", p_num);
		param.put("cart_num", cart_num);
		
		return cartDAO.cartSearch(param);
	}
	
	
	public int countUpdate(HashMap<String, Long> param) throws Exception{
		return cartDAO.countUpdate(param);
	}
	
	
	
}
