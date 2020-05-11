package com.iu.mk.product;

import java.util.List;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
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
	public String productWrite()  throws Exception{
		return "product/productWrite";
	}
	
	@PostMapping("productWrite")
	public ModelAndView productWrite(ProductVO productVO, ModelAndView mv,MultipartFile files,HttpServletRequest request) throws Exception{
		//컨텐츠가 안넘오면 넘어오는 파라미터가 있는지 없느지 확인하는 방법
		System.out.println("dddd");
		Enumeration<String> er = request.getParameterNames();//넘어오는 파라미터 이름들
				
			
		while(er.hasMoreElements()) {
		System.out.println(er.nextElement());//다음요소를  꺼내와
		}
				
		
		int result = productService.productWrite(productVO, files);
		 
		 if(result > 0) {
			 mv.setViewName("redirect:./productList");
		 }else {
			 mv.addObject("result","write fail");
			 mv.addObject("path", "./productList");
			 
			 mv.setViewName("common/result");
		 }
		return mv;
	}
	
	//cartpay.jsp 연결용 나중에 이름 변경 필요
	@GetMapping("productPay")
	public String productPay() throws Exception{
		 return "product/productPay";
	}
}
