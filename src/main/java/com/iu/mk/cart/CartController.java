package com.iu.mk.cart;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
		
		if(!(memberVO==null)) {
			long cart_num = memberVO.getCart_num();
			
			System.out.println(memberVO.getCart_num()+"::::::현재 cart_num");
			
			//List<CartVO> ar = cartService.cartList(memberVO.getCartNum()); 나중에 받아오기~
			List<CartVO> ar = cartService.cartList(cart_num); //지금은 VO 수정이 안 되어서 일단 나중에!
			System.out.println("---------++++----------");

			mv.addObject("list", ar);
			mv.setViewName("cart/cartList");
			
		}else {
			mv.setViewName("redirect:../member/memberLogin");
		}
		
		

		
		return mv;
	}
	
	
	
	

	
	
	
	@PostMapping("cartInsert")
	public ModelAndView cartInsert(long count, HttpServletRequest request, ProductVO productVO, CartVO cartVO, ModelAndView mv, HttpSession session) throws Exception {
		System.out.println("여기는 cartInsert");
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");

		
		
		
		System.out.println("count ::: " + cartVO.getCount());
		System.out.println("p_num ::: " + productVO.getP_num());
	
		
		
		
		
		
		cartVO.setCart_num(memberVO.getCart_num());
		cartVO.setP_num(productVO.getP_num());
		


		CartVO cVO = (CartVO)cartService.cartSearch(productVO.getP_num(),memberVO.getCart_num());
		System.out.println("되나?");

		if(cVO!=null) {
			//검색 중단, 경고창

			mv.addObject("result", "이미 추가된 상품입니다.");
			mv.setViewName("common/ajaxResult");
			
			
			
			
		}else {
			System.out.println("1");
			int result = cartService.cartInsert(cartVO);
			System.out.println("2");
			if(result>0) {
				System.out.println("3");
				//성공시 팝업창  1) 장바구니 이동, 2) 계속 쇼핑하기
				//일단 common/result로 하고, 정상 작동되면 나중에 팝업창으로 바꾸기
				mv.addObject("result", "상품이 장바구니에 담겼습니다.");
				mv.setViewName("common/ajaxResult");
			}else {
				//실패시 팝업팡  1) 실패했습니다.
			}
			
		}

		return mv;
	}
	
	
	
	//cartInsert2 test--------------------------------------------------------------------
	
	@PostMapping("cartInsert2")//즉시구매
	public ModelAndView cartInsert2(int totalPrice, HttpServletRequest request, ProductVO productVO, CartVO cartVO, ModelAndView mv, HttpSession session) throws Exception {

		MemberVO memberVO = (MemberVO)session.getAttribute("member");

		System.out.println("----test-----");
		System.out.println(cartVO.getCount());
		System.out.println(cartVO.getP_num());
	
		System.out.println(memberVO.getId());

		
		
		cartVO.setCart_num(memberVO.getCart_num());
		cartVO.setP_num(productVO.getP_num());
		
		
		

		int result = cartService.cartInsert(cartVO);
		
		//젤 위에거 뽑아와서 set 하기
		String cqn = String.valueOf(cartService.selCqNum(memberVO.getCart_num()));
		
		
		
		if(totalPrice<50000) {
			totalPrice += 3000;
		}
		
		
		
		mv.addObject("cqn", cqn);
		mv.addObject("total_price", totalPrice);
		/* mv.setViewName("pay/payInsert"); */
		mv.setViewName("cart/pay");
		return mv;
		
	}
	//end cartInsert2 test----------------------------------------------------------------
	
	

	
	
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
	
	
	
	
	@PostMapping("countUpdate")
	@ResponseBody
	public void countUpdate(Long cq_num, Long num) throws Exception{
		System.out.println("-----update------");
		System.out.println(cq_num);
		System.out.println(num);
		HashMap<String, Long> param = new HashMap<String, Long>();
		param.put("cq_num", cq_num);
		param.put("num", num);
		
		int result = cartService.countUpdate(param);
		
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
	
	
	
	/*
	 * @PostMapping("pay") public ModelAndView pay(int totalPrice) throws Exception{
	 * ModelAndView mv = new ModelAndView();
	 * 
	 * //주문번호 생성 후 Pay 테이블에 기존의 cartVO CartDAO cartDAO = new CartDAO();
	 * 
	 * //주문번호 생성 Long orderNum = cartDAO.orderNum();
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * System.out.println(totalPrice);
	 * 
	 * mv.addObject("total_price", totalPrice); mv.setViewName("cart/pay");
	 * 
	 * return mv; }
	 */
	

	
	//cartpay.jsp 연결용 나중에 이름 변경 필요
	/*
	 * @GetMapping("cartPay") public String cartPay() throws Exception{ return
	 * "cart/cartPay"; }
	 */

}
