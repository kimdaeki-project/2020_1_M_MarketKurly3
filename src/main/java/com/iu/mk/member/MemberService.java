package com.iu.mk.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iu.mk.member.MemberVO;

@Service
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	public int memberJoin(MemberVO memberVO)throws Exception{
		return memberDAO.memberJoin(memberVO);
	}
	
	public MemberVO memberLogin(MemberVO memberVO)throws Exception{
		return memberDAO.memberLogin(memberVO);
	}
	
	public int memberDelete(MemberVO memberVO)throws Exception{
		return memberDAO.memberDelete(memberVO);
	}
	
	public MemberVO checkId(MemberVO memberVO)throws Exception{
		return memberDAO.checkId(memberVO);
	}
	
	public MemberVO checkEmail(MemberVO memberVO)throws Exception{
		return memberDAO.checkEmail(memberVO);
	}
	//update,insert,delete > int
	
}
