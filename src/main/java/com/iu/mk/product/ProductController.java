package com.iu.mk.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product/**")
public class ProductController {
	@GetMapping("productList")
	public String productList() throws Exception{
		return "product/productList";
	}
}
