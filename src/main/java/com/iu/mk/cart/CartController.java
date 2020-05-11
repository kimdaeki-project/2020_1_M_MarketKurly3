package com.iu.mk.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/cart/**")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	

	@GetMapping("cartList")
	public ModelAndView cartList(ModelAndView mv, int m_num) throws Exception {
		
		
		m_num = 1;
		List<CartVO> ar = cartService.cartList(m_num);
		
		mv.addObject("list", ar);
		mv.setViewName("cart/cartList");
		
		return mv;
	}
	
	
	
	

	@GetMapping("productSelect")
	public ModelAndView productSelect(ModelAndView mv) {
		mv.setViewName("cart/productSelect");
		
		return mv;
	}
	
	
	@PostMapping("cartInsert")
	public ModelAndView cartInsert(HttpServletRequest request, CartVO cartVO, ModelAndView mv) throws Exception {
		
		
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
