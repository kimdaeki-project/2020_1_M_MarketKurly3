package com.iu.mk.pay;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.iu.mk.product.ProductVO;
import com.iu.mk.util.Pager;

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

	@GetMapping("test")
	public ModelAndView testPage(long totalPrice, ModelAndView mv) throws Exception{
		System.out.println(totalPrice + "......");
		mv.addObject("totalPrice", totalPrice);
		mv.setViewName("pay/payInsert");
		return mv;
		
	}
	
	
	
	
	
	@PostMapping("payInsert")
	public ModelAndView pay(int totalPrice, CartVO cartVO, HttpSession session, ModelAndView mv) throws Exception {
		System.out.println("payy");

	

		System.out.println("음..");
		System.out.println(totalPrice+":::");
		mv.addObject("total_price", totalPrice);
		mv.setViewName("cart/pay");

		return mv;
	}
	
	
	

	
	
	

	@GetMapping("totalInfo")
	public ModelAndView totalInfo(ModelAndView mv, HttpSession session, String cqn, HttpServletResponse response) throws Exception {
		System.out.println("totalInfo");
		// pay table -------------------------------------------------
		// 주문번호 생성 후 Pay 테이블에 기존의 cartVO
		CartDAO cartDAO = new CartDAO();

		Long orderNum = payService.orderNum();
		System.out.println("orderNum : " + orderNum);
	
	
		
		session.setAttribute("orderNum", orderNum);

		
		
		
		//여기서 List<CartVO> cq를 만든다
		//List<CartVO> cq = new ArrayList<CartVO>();
		
		//전체 구매----------------------------------------------------------
		// 여기서 cart_num을 꺼낸다.
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		//cq = payService.scCart(memberVO.getCart_num());
		//System.out.println("cq_size : " + cq.size());
		//-----------------------------------------------------------------
		
		//선택 구매----------------------------------------------------------
		//가져온  cq_num을 cq에 넣는다
		
		
	
		//매개변수로 배열을 받아온다.
		//매개변수로 -로 이어진 cqn 받아온다.
		System.out.println(cqn);
		
		//파싱 후 배열에 담기
		String cq [] = cqn.split("-");  
		for(int i=0; i<cq.length; i++) {
			System.out.println("ar : " + cq[i]);
			System.out.println(cq[i]);
		}
		
		
		
		
		
		
		
		
		
		
		//하나만 구매---------------------------------------------------------
		//cq_num 중 젤 위에 것만 cq에 넣는다
		
		
		
		
		
		int result = 0;
		ProductVO productVO = new ProductVO();

		Long price = 0L;
		Long totalPrice = 0L;
		for (int i = 0; i < cq.length; i++) {
			PayVO payVO = new PayVO();

			long cq_num = Long.parseLong(cq[i]);
			
			
			payVO.setCq_num(cq_num);
			payVO.setOrder_num(orderNum);

			/*
			 * payVO.setPay_price(cq.get(i).getProductVOs().get(0).getPrice()); price +=
			 * cq.get(i).getProductVOs().get(0).getPrice(); System.out.println("[" + i +
			 * "] " + price);
			 */
			//cq_num으로 해당 p_num 찾아서 그   p_num의 가격..불러오기ㅎㅎmapper만들기
			price = payService.selPrice(cq_num);
			
			
			
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


		return mv;
	}

	
	//소연

	@GetMapping("payList") 
	  public ModelAndView payList(ModelAndView mv,HttpSession session, Pager pager)throws Exception { 
		  
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String id = memberVO.getId();  
		System.out.println("(service로 보내기전)id : " + id);
		  
		//여기서 pager 넘겨주기(12개씩 끊어서 출력)
		List<Long> order_num = payService.orderNum2(id, pager);

		  //List는 인터페이스+부모형태라서, 자식형태이고 유틸타입인 ArrayList를 선언해주어야 한다.
		  List<PayInfoVO> ar = new ArrayList<PayInfoVO>();
		  
		  for(int i=0; i<order_num.size();i++) {
			 
			  Long m =  order_num.get(i); //order_numd의 i번 인덱스에있는 정보조회
			  //m = 주문번호를 하나씩 가져오는 것
			 // System.out.println("m cont: "+m);
			  PayInfoVO payInfoVO =  payService.payList(m); 
			  ar.add(payInfoVO);

		  }

		 mv.addObject("list",ar);
		 mv.addObject("pager",pager);
		 mv.setViewName("member/memberMyPage_Purchase");
	  
	  return mv; 
	  }
	 
	
	@GetMapping("paySelect")
	public ModelAndView paySelect(ModelAndView mv, HttpSession session, long order_num) throws Exception {

		System.out.println(order_num);
		//HttpSession : getAttribute로 정보보내기
		//ModelAndView : addObject로 정보보내고, setViewName으로 이동
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		
		List<PayInfoVO> ar = payService.paySelect(order_num);
		PayInfoVO select2 = (PayInfoVO) payService.paySelect2(order_num);
		
		System.out.println(select2.getDelivery());
		System.out.println(select2.getTotal_price());
		
		
		mv.addObject("select", ar);
		mv.addObject("select2", select2);
		System.out.println(ar.get(0).getProductFileVOs().get(0).getFileName());
		mv.setViewName("member/memberMyPage_Purchase1");

		return mv;
	}
	
	
}



