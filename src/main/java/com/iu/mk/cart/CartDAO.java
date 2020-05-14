package com.iu.mk.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iu.mk.product.ProductVO;

@Repository
public class CartDAO {

	@Autowired
	private SqlSession sqlSession;

	private final String NAMESPACE = "com.iu.mk.cart.CartDAO.";
	
	
	public List<CartVO> cartList(Long cart_num) throws Exception{
		System.out.println("dao_cart_num : " +cart_num);
		return sqlSession.selectList(NAMESPACE+"cartList",cart_num);

	}

	/*
	 * public Long getCartNum() throws Exception {
	 * return.sqlSession.select(NAMESPACE+"getCartNum"); }
	 */

	public int cartInsert(CartVO cartVO) throws Exception {
		return sqlSession.insert(NAMESPACE + "cartInsert", cartVO);
	}
	

	
	
}
