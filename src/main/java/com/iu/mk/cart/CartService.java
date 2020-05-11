package com.iu.mk.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {

	@Autowired
	private CartDAO cartDAO;
	
	
	
	
	public List<CartVO> cartList(int num) throws Exception {
		return cartDAO.cartList(num);
	}
	
	
	
	
	
	
	
	
	
	public int cartInsert(CartVO cartVO) throws Exception{
		
		//시퀀스 번호 받기 -- random_num
		
		int result = cartDAO.cartInsert(cartVO);
		
		
		
		return result;
	}
	
}
