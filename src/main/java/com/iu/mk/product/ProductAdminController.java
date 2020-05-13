package com.iu.mk.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iu.mk.util.Pager;

@Controller
@RequestMapping("/product/**")
public class ProductAdminController {
	@Autowired
	private ProductService productService;
	
	@GetMapping("productAdmin")
	public ModelAndView productAdmin(ModelAndView mv,Pager pager,ProductVO productVO) throws Exception{
		
		List<ProductVO> ar = productService.productList(pager);
		System.out.println(pager.getTotalPage());
		mv.addObject("list",ar);
		mv.addObject("pager",pager);
		mv.setViewName("product/productAdmin");
		
		return mv;
	}
}
