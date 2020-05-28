package com.iu.s5.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.iu.mk.member.MemberVO;


public class PayInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("Controller 진입");
		boolean check = false;
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		if(memberVO != null) {
			check = true;
		}else {
			System.out.println("일반 사용자 계정입니다.");
			response.sendRedirect("/mk");
		}
		
		
		return check;
	}
}
