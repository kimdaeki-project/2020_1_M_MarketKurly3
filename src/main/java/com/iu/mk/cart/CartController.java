package com.iu.mk.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.iu.mk.member.MemberVO;
import com.iu.mk.product.ProductVO;
import com.iu.mk.product.productfile.ProductFileVO;

@Controller
@RequestMapping(value = "/cart/**")
public class CartController {
	
	private static final List<ProductFileVO> Object = null;
	@Autowired
	private CartService cartService;
	
	

	@GetMapping("cartList")
	public ModelAndView cartList(ModelAndView mv, HttpSession session) throws Exception {
		//로그인시 세션에 정보 저장 session.setAttribute("member", memberVO);
		//memberVO에 있는 cart_num 꺼내서 넘겨주기
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		long cart_num = memberVO.getCart_num();
		
		System.out.println(memberVO.getCart_num()+"::::::현재 cart_num");
		
		//List<CartVO> ar = cartService.cartList(memberVO.getCartNum()); 나중에 받아오기~
		List<CartVO> ar = cartService.cartList(cart_num); //지금은 VO 수정이 안 되어서 일단 나중에!
		System.out.println("---------++++----------");


		

		
		mv.addObject("list", ar);
		mv.setViewName("cart/cartList");
		
		return mv;
	}
	
	
	
	

	
	
	
	@PostMapping("cartInsert")
	public ModelAndView cartInsert(HttpServletRequest request, ProductVO productVO, CartVO cartVO, ModelAndView mv, HttpSession session) throws Exception {
		System.out.println("여기는 cartInsert");
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		System.out.println(memberVO.getCart_num());
		
		cartVO.setCart_num(memberVO.getCart_num());
		
		cartVO.setP_num(productVO.getP_num());

		
		System.out.println("product/p_num" + productVO.getP_num());
		
		System.out.println("cartVO/cp_num" + cartVO.getCq_num());
		System.out.println("cartVO/p_num" + cartVO.getP_num());
		System.out.println("cartVO/count" + cartVO.getCount()+"count..");
		System.out.println("cartVO/cart_num" + cartVO.getCart_num());
		System.out.println("cartVO/payCheck" + cartVO.getPayCheck());
		
		
		
		
		System.out.println(productVO.getP_num());
		System.out.println(cartVO.getP_num());
		System.out.println(cartVO.getCount()+"count..");
		System.out.println(cartVO.getCart_num());
		
		
		
		cartVO.setP_num(productVO.getP_num());
		
	
		/*
		 * int result = 0; cartService.cart
		 */
		
		
		int result = cartService.cartInsert(cartVO);
		if(result>0) {
			//성공시 팝업창  1) 장바구니 이동, 2) 계속 쇼핑하기
			//일단 common/result로 하고, 정상 작동되면 나중에 팝업창으로 바꾸기
			mv.addObject("path", "../cart/cartList");
			mv.addObject("result", "성공했습니다");
			mv.setViewName("common/result");
			
		}else {
			//실패시 팝업팡  1) 실패했습니다.
		}
		
		
		return mv;
	}
	
	
	
	@GetMapping("getList")
	public void getList(Long cart_num, Model model) throws Exception{
		List<CartVO> ar = cartService.cartList(cart_num);
		model.addAttribute("list", ar);
	}
	
	
	
	@PostMapping("cartDelete")
	@ResponseBody
	public int cartDelete(CartVO cartVO) throws Exception {
		System.out.println("cartDelete");
		System.out.println("cartDelete : " + cartVO.getCq_num());
		
		int result = cartService.cartDelete(cartVO.getCq_num());
		System.out.println("result : "+ result);
		return result;
		
	}
	
	
	@PostMapping("selectDelete")
	@ResponseBody
	public int selectDelete(String cqn) throws Exception {
		//- 들로 이어진 cq_num을 잘라서 배열에 넣은 후.. 여러번 다녀온다.
		
		//매개변수로 배열을 받아온다.
		//매개변수로 -로 이어진 cqn 받아온다.
		System.out.println(cqn);
		
		//파싱 후 배열에 담기
		String ar [] = cqn.split("-");  
		for(int i=0; i<ar.length; i++) {
			System.out.println("ar : " + ar[i]);
			System.out.println(ar[i]);
		}
		
	
		int result = 0;
		//다녀오기
		for(int i=0; i<ar.length; i++) {
			result = cartService.cartDelete(Long.parseLong((ar[i])));
			System.out.println(result);
		}
		
		
		
		return result;
	}
	
	
	
	@PostMapping("totalPay")
	public ModelAndView totalPay(int totalPrice, HttpServletRequest request, ModelAndView mv) throws Exception{
		System.out.println("totalPrice : " + totalPrice);
		
		
		mv.addObject("total_price", totalPrice);
		mv.setViewName("cart/pay");
		
		request.setAttribute("total_price", totalPrice);
		/* return "cart/pay"; */
		
		return mv;
	}
	
	
	
	@PostMapping("pay")
	public ModelAndView pay(int totalPrice) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//주문번호 생성 후 Pay 테이블에 기존의 cartVO
		
		
		
		
		
		
		
		System.out.println(totalPrice);
		
		mv.addObject("total_price", totalPrice);
		mv.setViewName("cart/pay");
		
		return mv;
	}
	
	
	
	//cartpay.jsp 연결용 나중에 이름 변경 필요
	@GetMapping("cartPay")
	public String cartPay() throws Exception{
		 return "cart/cartPay";
	}
}
