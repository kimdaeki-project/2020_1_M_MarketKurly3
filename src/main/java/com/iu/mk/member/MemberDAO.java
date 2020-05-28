package com.iu.mk.member;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.iu.mk.member.MemberDAO.";//namespace : 변수, 함수, 객체등의 중복을 방지하기위해 위치를 명시해준다.
	
	public int memberJoin(MemberVO memberVO)throws Exception{
		return sqlSession.insert(NAMESPACE+"memberJoin",memberVO);
	}
	
	public MemberVO memberLogin(MemberVO memberVO)throws Exception {	
		return sqlSession.selectOne(NAMESPACE+"memberLogin",memberVO);
	}
	
	public int memberUpdate(MemberVO memberVO)throws Exception {
		return sqlSession.update(NAMESPACE+"memberUpdate",memberVO);
	}
	
	public int memberDelete(MemberVO memberVO)throws Exception {
		System.out.println("DAO");
		System.out.println(memberVO.getId());
		return sqlSession.delete(NAMESPACE+"memberDelete",memberVO);
	}
	
	public MemberVO checkId(MemberVO memberVO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"checkId",memberVO);
	}
	
	public MemberVO checkEmail(MemberVO memberVO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"checkEmail",memberVO);
	}
	
	
	public String memberFind_Id1(MemberVO memberVO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberFind_Id1",memberVO);
	}
	
	public String memberFind_Pw1(MemberVO memberVO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberFind_Pw1",memberVO);
	}
	
}
