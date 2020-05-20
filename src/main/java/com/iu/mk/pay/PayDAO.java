package com.iu.mk.pay;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iu.mk.cart.CartVO;
import com.iu.mk.product.ProductVO;
import com.iu.mk.util.Pager;

@Repository
public class PayDAO {
	
	@Autowired
	private SqlSession sqlSession;

	private final String NAMESPACE = "com.iu.mk.pay.PayDAO.";
	
	public int pay(PayVO payVO) throws Exception {
		return sqlSession.insert(NAMESPACE + "payInsert", payVO);
	}
	
	
	public List<CartVO> scCart(Long cart_num) throws Exception{
		return sqlSession.selectList(NAMESPACE + "scCart", cart_num);
	}
	
	public int payInsert(PayVO payVO) throws Exception{
		return sqlSession.insert(NAMESPACE + "payInsert", payVO);
				
	}
	
	public long orderNum() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "orderNum");
	}
	
	public List<Long> scPrice(Long order_num) throws Exception {
		return sqlSession.selectList(NAMESPACE + "scPrice");
	}
	
	
	public int payInfoInsert(PayInfoVO payInfoVO) throws Exception{
		return sqlSession.insert(NAMESPACE + "payInfoInsert", payInfoVO);
				
	}
	
	public int payCheckUpdate(Long order_num) throws Exception{
		return sqlSession.update(NAMESPACE + "payCheckUpdate", order_num);
	}
	
	//전체 글 갯수 카운트
	public long payCount(Pager pager) throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"payCount",pager);
	}
	
	public List<PayInfoVO> payList(Pager pager) throws Exception{
		System.out.println(pager.getKind());
		System.out.println(pager.getSearch());
		
		return sqlSession.selectList(NAMESPACE+"payList",pager);
	}
	

}
