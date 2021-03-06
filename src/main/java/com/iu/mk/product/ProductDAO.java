package com.iu.mk.product;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iu.mk.review.ReviewVO;
import com.iu.mk.util.Pager;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.iu.mk.product.ProductDAO.";
	
	//전체 글 갯수 카운트
	public long productCount(Pager pager) throws Exception{
		System.out.println(pager.getBar() + "00000000 ");
		
		return sqlSession.selectOne(NAMESPACE+"productCount",pager);
	}
	
	//p_num 받아오기
	public long productNum() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"productNum");
	}
	
	public int productWrite(ProductVO productVO)throws Exception{	
		return sqlSession.insert(NAMESPACE+"productWrite",productVO);
	}
	
	public List<ProductVO> productList(HashMap<String, Object> pa) throws Exception{
		/*
		 * System.out.println(pager.getKind()); System.out.println(pager.getSearch());
		 */
		System.out.println("dao ?:) " + pa.get("tbar"));
		
		return sqlSession.selectList(NAMESPACE+"productList",pa);
	}
	

	public ProductVO productSelect(Long p_num) throws Exception{
		System.out.println(p_num+":::dao_num");
		
		return sqlSession.selectOne(NAMESPACE+"productSelect",p_num);
	}
	
	
	//파라미터로 받아오는 p_num 이라서 long로
	public long productUpdate(ProductVO productVO)throws Exception{
		System.out.println("dao p_num : "+productVO.getP_num());
		System.out.println("dao bar"+productVO.getBar());
		return sqlSession.update(NAMESPACE+"productUpdate",productVO);
	}
	
	public int productDelete(long p_num) throws Exception{
		return sqlSession.delete(NAMESPACE+"productDelete",p_num);
	}
	
	
	public List<ReviewVO> selectReview(long p_num) throws Exception {
		System.out.println("serP_num : " + p_num);
		return sqlSession.selectList(NAMESPACE + "selectReview", p_num);
	}
	
}
