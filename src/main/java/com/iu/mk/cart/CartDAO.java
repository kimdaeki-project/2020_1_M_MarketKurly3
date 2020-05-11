package com.iu.mk.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.iu.mk.cart.CartDAO.";

	public List<CartVO> cartList(int num) throws Exception {
		return sqlSession.selectList(NAMESPACE + "cartList");
	}

	/*
	 * public Long getCartNum() throws Exception {
	 * return.sqlSession.select(NAMESPACE+"getCartNum"); }
	 */

	public int cartInsert(CartVO cartVO) throws Exception {
		return sqlSession.insert(NAMESPACE + "cartInsert");
	}
}
