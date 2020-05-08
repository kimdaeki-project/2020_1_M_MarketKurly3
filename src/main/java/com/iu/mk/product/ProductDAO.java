package com.iu.mk.product;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iu.mk.util.Pager;

import com.iu.mk.product.ProductVO;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.iu.mk.product.ProductDAO.";
	
	//전체 글 갯수 카운트
	public long productCount(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"productCount",pager);
	}
	
	//p_num 받아오기
	public long productNum() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"productNum");
	}
	
	public int productWrite(ProductVO productVO)throws Exception{
		return sqlSession.insert(NAMESPACE+"productWrite",productVO);
	}
	
	public List<ProductVO> productList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"productList",pager);
	}
	
	public List<ProductVO> getProductFile(ProductVO productVO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getProductFile",productVO);
	}
}
