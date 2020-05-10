package com.iu.mk.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iu.mk.product.productfile.ProductFileService;
import com.iu.mk.product.productfile.ProductFileVO;
import com.iu.mk.util.Pager;

@Controller
@RequestMapping("/product/**")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	

	
	@GetMapping("productList")
	public ModelAndView productList(ModelAndView mv,Pager pager,ProductVO productVO) throws Exception{
		List<ProductVO> ar = productService.productList(pager);
	//	List<ProductFileVO> ar2 = productFileService.fileList(productVO.getP_num());
		System.out.println(pager.getTotalPage());
		mv.addObject("list",ar);
		mv.addObject("pager",pager);
		mv.setViewName("product/productList");
		
		return mv;
	}
	
	@GetMapping("productWrite")
	public String productWrite() throws Exception{

		return "product/productWrite";
	}
	
	//cartpay.jsp 연결용 나중에 이름 변경 필요
	@GetMapping("productPay")
	public String productPay() throws Exception{
		 return "product/productPay";
	}
}
