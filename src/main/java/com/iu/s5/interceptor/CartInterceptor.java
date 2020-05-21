package com.iu.s5.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.iu.mk.member.MemberVO;


public class CartInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("Controller 진입");
		boolean check = false;
		
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		if(memberVO != null) {
			check = true;
			//로그인시 cartList만 가능
			
		}else {
			
			response.sendRedirect("../");
		}
		
		
		return check;
	}
}
