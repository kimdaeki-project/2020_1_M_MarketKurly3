package com.iu.mk.pay;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iu.mk.cart.CartDAO;
import com.iu.mk.cart.CartVO;
import com.iu.mk.member.MemberVO;
import com.iu.mk.product.ProductVO;

@Controller
@RequestMapping(value = "/pay/**")
public class PayController {
	
	@Autowired
	private PayService payService;
	
	
	
	
	
	
	@PostMapping("payInsert")
	public ModelAndView pay(int totalPrice, CartVO cartVO, HttpSession session, ModelAndView mv) throws Exception{
		System.out.println("payy");
		
		
		//pay table -------------------------------------------------
		//주문번호 생성 후 Pay 테이블에 기존의 cartVO
		CartDAO cartDAO = new CartDAO();
	
		
		Long orderNum = payService.orderNum();
		System.out.println("orderNum : " +orderNum);
		
		
		//여기서 cart_num을 꺼낸다.
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		List<CartVO> cq = payService.scCart(memberVO.getCart_num());
		System.out.println("cq_size : " + cq.size());
		/*
		 * System.out.println(cq.get(0).getCq_num());
		 * System.out.println(cq.get(1).getCq_num());
		 * System.out.println(cq.get(0).getProductVOs().get(0).getPrice());
		 */
		
		int result = 0;
		ProductVO productVO = new ProductVO();
		
		
		Long price = 0L;
		for(int i=0; i<cq.size(); i++) {
			PayVO payVO = new PayVO();
		
			payVO.setCq_num(cq.get(i).getCq_num());
			payVO.setOrder_num(orderNum);
			payVO.setPay_price(cq.get(i).getProductVOs().get(0).getPrice());
			price += cq.get(i).getProductVOs().get(0).getPrice();
			result = payService.payInsert(payVO);

		}
		
		System.out.println("totalPrice : " + price);
		//end pay table -------------------------------------------------
		

		//payInfo table -------------------------------------------------
		PayInfoVO payInfoVO = new PayInfoVO();
		payInfoVO.setOrder_num(orderNum);
		payInfoVO.setTotal_price(price);
		
		Long delivery = 0L;
		if(price>=50000) {
			delivery = 0L;
		}else {
			delivery = 3000L;
		}
		
		payInfoVO.setDelivery(delivery);
		
		int rs = payService.payInfoInsert(payInfoVO);
		
		//end payInfo table----------------------------------------------
		

		
		//cart table payCheck update ------------------------------------
		if(rs>0) {
			//payInfo 삽입 성공
			//cart의 payCheck 0으로 바꿔줌
		}else {
			//실패
		}
		
		
		
		
		//end cart table-------------------------------------------------
		
		
		
		
		
		

		
		
		System.out.println("음..");
		
		mv.addObject("total_price", totalPrice);
		mv.setViewName("cart/pay");
		
		return mv;
	}
}
