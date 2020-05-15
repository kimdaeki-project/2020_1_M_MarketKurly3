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
		System.out.println(pager.getKind());
		System.out.println(pager.getSearch());
		return sqlSession.selectList(NAMESPACE+"productList",pager);
	}
	

	public ProductVO productSelect(Long p_num) throws Exception{
		System.out.println(p_num+":::dao_num");
		return sqlSession.selectOne(NAMESPACE+"productSelect",p_num);
	}
	
	
	//파라미터로 받아오는 p_num 이라서 long로
	public long productUpdate(ProductVO productVO)throws Exception{
		System.out.println("dao p_num : "+productVO.getP_num());
		return sqlSession.update(NAMESPACE+"productUpdate",productVO);
	}
	
	public long productDelete(long p_num) throws Exception{
		return sqlSession.delete(NAMESPACE+"productDelete",p_num);
	}
	
}
