package com.iu.mk.pay;

import java.util.HashMap;
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
	
	
	public PayInfoVO totalPrice(Long order_num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"totalPrice",order_num);
	}
	
	
	
	public List<CartVO> finalCart(HashMap<String, Long> param) throws Exception{ 
		/* System.out.println("dao c :" + cart_num); */
		System.out.println(param.get("cart_num"));
		System.out.println(param.get("order_num"));
		return sqlSession.selectList(NAMESPACE+"finalCart",param);
	}
	
	
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
	

	public Long pCount(Long cq_num) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "pCount", cq_num);
	}

	
	
	/*soyeon*/
	
	//전체 글 갯수 카운트
	public long payCount(String id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"payCount",id);
	}
	

	//페이 리스트
	public PayInfoVO payList(Long m) throws Exception{
		//System.out.println("m dao: "+m);
		
		PayInfoVO a=sqlSession.selectOne(NAMESPACE+"payList",m);
		/*
		 * System.out.println("list정보: "+a.getOrder_num());
		 * System.out.println("list정보: "+a.getTotal_price());
		 * System.out.println("list정보: "+a.getPayDate());
		 * System.out.println("list정보: "+a.getCount());
		 * System.out.println("list정보: "+a.getProductFileVOs().get(0).getFileName());
		 * System.out.println("list정보: "+a.getProductVOs().get(0).getP_name());
		 */
		
		return sqlSession.selectOne(NAMESPACE+"payList",m);
	}
	
	
	public List<Long> orderNum2(HashMap<String, Object>pa) throws Exception {

		return sqlSession.selectList(NAMESPACE + "orderNum2",pa);
	}
	
	public List<PayInfoVO> paySelect(long order_num) throws Exception {

		return sqlSession.selectList(NAMESPACE + "paySelect", order_num);
	}
	
	
	public PayInfoVO paySelect2(long order_num) throws Exception {
		System.out.println("짜증나나mmmmmm"+order_num);
		
		PayInfoVO a = sqlSession.selectOne(NAMESPACE + "paySelect2", order_num);
		System.out.println("ㅉㅉㅉㅉ"+a.getDelivery());
		System.out.println("ㅉㅉㅉㅉ"+a.getTotal_price());
		return sqlSession.selectOne(NAMESPACE + "paySelect2", order_num);
	}
	
	public long selPrice(long cq_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selPrice", cq_num);
	}


}
