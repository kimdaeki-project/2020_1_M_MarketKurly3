package com.iu.mk.cart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/cart/**")
public class CartController {

	@GetMapping("cartList")
	public ModelAndView cartList(ModelAndView mv) {
		mv.setViewName("cart/cartList");
		
		return mv;
	}

	@GetMapping("productSelect")
	public ModelAndView productSelect(ModelAndView mv) {
		mv.setViewName("cart/productSelect");
		
		return mv;
	}
	
}
