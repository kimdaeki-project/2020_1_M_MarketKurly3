package com.iu.mk.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/product/**")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	
	@GetMapping("productList")
	public ModelAndView productList(ModelAndView mv) throws Exception{
		List<ProductVO> ar = productService.productList();
		mv.addObject("list",ar);
		mv.setViewName("product/productList");
		
		return mv;
	}
	
	@GetMapping("productWrite")
	public String productWrite() throws Exception{
		return "product/productWrite";
	}
}
