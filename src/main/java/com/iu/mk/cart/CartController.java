package com.iu.mk.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.iu.mk.member.MemberVO;
import com.iu.mk.product.ProductVO;

@Controller
@RequestMapping(value = "/cart/**")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	

	@GetMapping("cartList")
	public ModelAndView cartList(ModelAndView mv, int cart_num, HttpSession session) throws Exception {
		//로그인시 세션에 정보 저장 session.setAttribute("member", memberVO);
		//memberVO에 있는 cart_num 꺼내서 넘겨주기
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		//List<CartVO> ar = cartService.cartList(memberVO.getCartNum()); 나중에 받아오기~
		List<CartVO> ar = cartService.cartList(cart_num); //지금은 VO 수정이 안 되어서 일단 나중에!
		
		
		mv.addObject("list", ar);
		mv.setViewName("cart/cartList");
		
		return mv;
	}
	
	
	
	

	@GetMapping("productSelect")
	public ModelAndView productSelect(ModelAndView mv, ProductVO productVO, long p_num) throws Exception {
		//상품을 클릭하면 그 상품의 정보가 parameter로 넘어와줘야됨
		
		productVO.setP_num(p_num);
		System.out.println(productVO.getP_num()+":::pnum");
		System.out.println(productVO.getContents());
		System.out.println(productVO.getKind());
		System.out.println(productVO.getP_name());
		System.out.println(productVO.getP_num());
		System.out.println(productVO.getPrice());
		System.out.println(productVO.getProductFileVOs());
		
		productVO = (ProductVO) cartService.productSelect(productVO.getP_num());
		
		System.out.println("==========================");
		System.out.println(productVO.getContents());
		System.out.println(productVO.getKind());
		System.out.println(productVO.getP_name());
		System.out.println(productVO.getP_num());
		System.out.println(productVO.getPrice());
		System.out.println(productVO.getProductFileVOs());
		
		
		
		System.out.println(productVO.getP_name()+"::pname");
		
		
		mv.addObject("product", productVO);
		mv.setViewName("cart/productSelect");
		
		return mv;
	}
	
	
	
	
	
	
	
	@PostMapping("cartInsert")
	public ModelAndView cartInsert(HttpServletRequest request, ProductVO productVO, CartVO cartVO, ModelAndView mv, HttpSession session) throws Exception {

		
		
		System.out.println(productVO.getP_num());
		System.out.println(cartVO.getP_num());
		System.out.println(cartVO.getCount()+"count..");
		System.out.println(cartVO.getCart_num());
		
		
		
		cartVO.setP_num(productVO.getP_num());
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		//cartVO.setCart_num(memberVO.getCount_Num); 해서 장바구니 번호 넣어주기
		
		
		int result = cartService.cartInsert(cartVO);
		if(result>0) {
			//성공시 팝업창  1) 장바구니 이동, 2) 계속 쇼핑하기
			//일단 common/result로 하고, 정상 작동되면 나중에 팝업창으로 바꾸기
			mv.addObject("path", "./productSelet");
			mv.addObject("result", "성공했습니다");
			mv.setViewName("common/result");
			
		}else {
			//실패시 팝업팡  1) 실패했습니다.
		}
		
		
		return mv;
	}
	
}
