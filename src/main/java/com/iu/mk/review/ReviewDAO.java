package com.iu.mk.review;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	final String NAMESPACE = "com.iu.mk.review.ReviewDAO.";
	
	public Long reviewNum() throws Exception{
		return sqlSession.selectOne(NAMESPACE + "reviewNum");
	}
	
	
	
	public int reviewWrite(ReviewVO reviewVO) throws Exception{
		System.out.println(reviewVO.getContents());
		
		return sqlSession.insert(NAMESPACE + "reviewWrite", reviewVO);
	}
}
