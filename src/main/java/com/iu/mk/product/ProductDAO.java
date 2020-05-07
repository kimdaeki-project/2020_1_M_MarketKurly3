package com.iu.mk.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.iu.mk.product.ProductDAO";
	
	public List<ProductVO> productList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"productList");
	}
}
