package com.iu.s5.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.iu.mk.member.MemberVO;

public class Qna2Interceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler) throws Exception{
		
		System.out.println("Controller 진입");
		boolean check = false;
		
		MemberVO memberVO=(MemberVO)request.getSession().getAttribute("member");
		
		
		if(memberVO != null) {
			check = true;
			System.out.println("로그인한 계정입니다..");
		}else {
			System.out.println("로그인 계정이 아닙니다.");
			response.sendRedirect("/mk");
		}
		
		return check;
	}
}
