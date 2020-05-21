package com.iu.mk.pay;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iu.mk.cart.CartDAO;
import com.iu.mk.cart.CartVO;
import com.iu.mk.member.MemberVO;
import com.iu.mk.product.ProductService;
import com.iu.mk.product.ProductVO;
import com.iu.mk.util.Pager;

@Controller
@RequestMapping(value = "/pay/**")
public class PayController {

	@Autowired
	private PayService payService;
	
	@GetMapping("payFinal")
	public ModelAndView payFinal(long p_num, ModelAndView mv, CartVO cartVO,HttpSession session) throws Exception{
		CartDAO cartDAO = new CartDAO();
		
		//membervo에서 cart_num 넘겨주기
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		long cart_num = memberVO.getCart_num();
		
		 List<CartVO> ar = payService.finalCart(cart_num);
		 System.out.println("ar size : " + ar.size());
		 
		 mv.addObject("list",ar);
		 mv.setViewName("cart/cartPay");
		
		
		return mv;
	}
	
	
	
	

	@PostMapping("payInsert")
	public ModelAndView pay(int totalPrice, CartVO cartVO, HttpSession session, ModelAndView mv) throws Exception {
		System.out.println("payy");

		/*
		 * //pay table ------------------------------------------------- //주문번호 생성 후 Pay
		 * 테이블에 기존의 cartVO CartDAO cartDAO = new CartDAO();
		 * 
		 * 
		 * Long orderNum = payService.orderNum(); System.out.println("orderNum : "
		 * +orderNum);
		 * 
		 * 
		 * //여기서 cart_num을 꺼낸다. MemberVO memberVO =
		 * (MemberVO)session.getAttribute("member"); List<CartVO> cq =
		 * payService.scCart(memberVO.getCart_num()); System.out.println("cq_size : " +
		 * cq.size());
		 * 
		 * System.out.println(cq.get(0).getCq_num());
		 * System.out.println(cq.get(1).getCq_num());
		 * System.out.println(cq.get(0).getProductVOs().get(0).getPrice());
		 * 
		 * 
		 * int result = 0; ProductVO productVO = new ProductVO();
		 * 
		 * 
		 * Long price = 0L; for(int i=0; i<cq.size(); i++) { PayVO payVO = new PayVO();
		 * 
		 * payVO.setCq_num(cq.get(i).getCq_num()); payVO.setOrder_num(orderNum);
		 * payVO.setPay_price(cq.get(i).getProductVOs().get(0).getPrice()); price +=
		 * cq.get(i).getProductVOs().get(0).getPrice(); result =
		 * payService.payInsert(payVO);
		 * 
		 * }
		 * 
		 * System.out.println("totalPrice : " + price); //end pay table
		 * -------------------------------------------------
		 * 
		 * 
		 * //payInfo table ------------------------------------------------- PayInfoVO
		 * payInfoVO = new PayInfoVO(); payInfoVO.setOrder_num(orderNum);
		 * payInfoVO.setTotal_price(price);
		 * 
		 * Long delivery = 0L; if(price>=50000) { delivery = 0L; }else { delivery =
		 * 3000L; }
		 * 
		 * payInfoVO.setDelivery(delivery);
		 * 
		 * int rs = payService.payInfoInsert(payInfoVO);
		 * 
		 * //end payInfo table----------------------------------------------
		 * 
		 * 
		 * 
		 * //cart table payCheck update ------------------------------------ if(rs>0) {
		 * //payInfo 삽입 성공 //cart의 payCheck 0으로 바꿔줌 //orderNum으로 pay에 삽입된 cq_num들을 조회한 후
		 * //해당 cq_num의 cart의 payCheck를 1로 업데이트 payService.payCheckUpdate(orderNum);
		 * 
		 * }else { //실패 System.out.println("payInfo update 실패"); }
		 * 
		 * 
		 * 
		 * 
		 * 
		 * //end cart table-------------------------------------------------
		 */

		System.out.println("음..");

		mv.addObject("total_price", totalPrice);
		mv.setViewName("cart/pay");

		return mv;
	}

	@GetMapping("totalInfo")
	public ModelAndView totalInfo(ModelAndView mv, HttpSession session) throws Exception {
		System.out.println("totalInfo");
		// pay table -------------------------------------------------
		// 주문번호 생성 후 Pay 테이블에 기존의 cartVO
		CartDAO cartDAO = new CartDAO();

		Long orderNum = payService.orderNum();
		System.out.println("orderNum : " + orderNum);

		// 여기서 cart_num을 꺼낸다.
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
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
		for (int i = 0; i < cq.size(); i++) {
			PayVO payVO = new PayVO();

			payVO.setCq_num(cq.get(i).getCq_num());
			payVO.setOrder_num(orderNum);
			
			
			
			payVO.setPay_price(cq.get(i).getProductVOs().get(0).getPrice());
			price += cq.get(i).getProductVOs().get(0).getPrice();
			result = payService.payInsert(payVO);

		}

		System.out.println("totalPrice : " + price);
		// end pay table -------------------------------------------------

		// payInfo table -------------------------------------------------
		PayInfoVO payInfoVO = new PayInfoVO();
		payInfoVO.setOrder_num(orderNum);
		payInfoVO.setTotal_price(price);

		Long delivery = 0L;
		if (price >= 50000) {
			delivery = 0L;
		} else {
			delivery = 3000L;
		}

		payInfoVO.setDelivery(delivery);

		int rs = payService.payInfoInsert(payInfoVO);

		// end payInfo table----------------------------------------------

		// cart table payCheck update ------------------------------------
		if (rs > 0) {
			// payInfo 삽입 성공
			// cart의 payCheck 0으로 바꿔줌
			// orderNum으로 pay에 삽입된 cq_num들을 조회한 후
			// 해당 cq_num의 cart의 payCheck를 1로 업데이트
			payService.payCheckUpdate(orderNum);

		} else {
			// 실패
			System.out.println("payInfo update 실패");
		}

		// end cart table-------------------------------------------------

		mv.setViewName("redirect:../cart/cartPay");

		return mv;
	}

	@GetMapping("payList")
	public ModelAndView payList(ModelAndView mv,Pager pager,PayInfoVO payInfoVO)throws Exception {
		
		List<PayInfoVO> ar = payService.payList(pager);
		
		mv.addObject("list",ar);
		mv.addObject("pager",pager);
		mv.setViewName("member/memberMyPage_Purchase");
		
		return mv;
	}
	
}
