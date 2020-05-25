package com.iu.mk.review.reviewfile;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewFileDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	final String NAMESPACE="com.iu.mk.review.reviewfile.ReviewFileDAO.";
	
	public int fileInsert(ReviewFileVO reviewFileVO) throws Exception{
		return sqlSession.insert(NAMESPACE + "fileInsert", reviewFileVO);
	}
	
}
