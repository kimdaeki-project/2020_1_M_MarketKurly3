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

@Controller
@RequestMapping(value = "/pay/**")
public class PayController {

	@Autowired
	private PayService payService;

	@Autowired
	private PayDAO payDAO;



	@GetMapping("payFinal")
	public ModelAndView payFinal(ModelAndView mv, HttpSession session) throws Exception {

		// membervo에서 cart_num 넘겨주기
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		long cart_num = memberVO.getCart_num();
		long order_num = (Long) session.getAttribute("orderNum");

		System.out.println("con : " + cart_num);

		List<CartVO> ar = payService.finalCart(cart_num, order_num);
		PayInfoVO infoP = (PayInfoVO) payService.totalPrice(order_num);

		System.out.println("ar size : " + ar.size());

		mv.addObject("yeon", ar);
		mv.addObject("infoP", infoP);
		
		System.out.println(ar.get(0).getCount() + "cccccc");
		System.out.println(ar.get(0).getProductFileVOs().get(0).getFileName());
		System.out.println(infoP.getTotal_price()+"ppp");
		
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
		session.setAttribute("orderNum", orderNum);

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
		Long totalPrice = 0L;
		for (int i = 0; i < cq.size(); i++) {
			PayVO payVO = new PayVO();

			payVO.setCq_num(cq.get(i).getCq_num());
			payVO.setOrder_num(orderNum);

			/*
			 * payVO.setPay_price(cq.get(i).getProductVOs().get(0).getPrice()); price +=
			 * cq.get(i).getProductVOs().get(0).getPrice(); System.out.println("[" + i +
			 * "] " + price);
			 */

			price = cq.get(i).getProductVOs().get(0).getPrice();
			System.out.println("[" + i + "] " + price);

			Long count = (long) payDAO.pCount(payVO.getCq_num());

			price = price * count;

			payVO.setPay_price(price);

			result = payService.payInsert(payVO);

			totalPrice += price;

		}

		System.out.println("totalPrice : " + price);
		// end pay table -------------------------------------------------

		// payInfo table -------------------------------------------------
		PayInfoVO payInfoVO = new PayInfoVO();
		payInfoVO.setOrder_num(orderNum);
		payInfoVO.setTotal_price(totalPrice);

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

		mv.setViewName("redirect:./payFinal");

		return mv;
	}

	

	@GetMapping("payList") 
	  public ModelAndView payList(ModelAndView mv,HttpSession session)throws Exception { 
		  
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String id = memberVO.getId();  
		System.out.println("(service로 보내기전)id : " + id);
		  
		List<Long> order_num = payService.orderNum2(id);
		  
		System.out.println("첫번쨰 주문번호 출력하기: "+order_num.get(0));
		  
		  //List는 인터페이스+부모형태라서, 자식형태이고 유틸타입인 ArrayList를 선언해주어야 한다.
		  List<PayInfoVO> ar = new ArrayList<PayInfoVO>();
		  
		  for(int i=0; i<order_num.size();i++) {
			  Long m =  order_num.get(i); //m = 주문번호를 하나씩 가져오는 것
			  System.out.println("m cont: "+m);
			  PayInfoVO payInfoVO =  payService.payList(m);
			  ar.add(payInfoVO);

		  }

		 mv.addObject("list",ar);
		 mv.setViewName("member/memberMyPage_Purchase");
	  
	  return mv; 
	  }
	 

}
