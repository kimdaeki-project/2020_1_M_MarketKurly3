package com.iu.mk.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iu.mk.product.ProductDAO;
import com.iu.mk.product.ProductVO;

@Service
public class CartService {

	@Autowired
	private CartDAO cartDAO;
	
	
	
	
	
	public List<CartVO> cartList(int num) throws Exception {
		return cartDAO.cartList(num);
	}
	
	

	
	public int cartInsert(CartVO cartVO) throws Exception{
		
		
		
		int result = cartDAO.cartInsert(cartVO);
		
		
		
		return result;
	}
	
}
