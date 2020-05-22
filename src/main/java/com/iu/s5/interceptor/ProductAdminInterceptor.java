package com.iu.s5.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.iu.mk.member.MemberVO;


public class ProductAdminInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("Controller 진입");
		boolean check = false;
		
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		if(memberVO != null && memberVO.getId().equals("admin")) {
			check = true;
			System.out.println("관리자 계정입니다.");
		}else {
			System.out.println("일반 사용자 계정입니다.");
			response.sendRedirect("/mk");
		}

		
		return check;
	}
}
