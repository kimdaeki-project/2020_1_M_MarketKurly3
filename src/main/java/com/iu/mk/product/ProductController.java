package com.iu.mk.product;

import java.util.List;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		System.out.println("kind : " + pager.getKind());
		System.out.println("search : " + pager.getSearch());
		
		List<ProductVO> ar = productService.productList(pager);
		/*
		 * System.out.println(ar.get(1).getP_name());
		 * System.out.println(pager.getTotalPage());
		 */
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
		
		Enumeration<String> er = request.getParameterNames();//넘어오는 파라미터 이름들
				
			
		while(er.hasMoreElements()) {
		System.out.println(er.nextElement());//다음요소를  꺼내와
		}
		//------------확인end-----------------
		//kind 가져와서  vo에 넣기
		String kind = request.getParameter("kind");
		
		productVO.setKind(kind);
				
		//System.out.println("productVO:"+productVO.getP_kind());
		
		System.out.println("controller img : "+files.getOriginalFilename());
		
		int result = productService.productWrite(productVO, files);
		
		System.out.println("controller result : "+result);
		
		
		 if(result > 0) {
			 mv.setViewName("redirect:./productList");
		 }else {
			 mv.addObject("result","write fail");
			 mv.addObject("path", "./productList");
			 
			 mv.setViewName("common/result");
		 }
		return mv;
	}
	

	
	
	@GetMapping("productSelect")
	public ModelAndView productSelect(ModelAndView mv, ProductVO productVO, long p_num) throws Exception {
		//상품을 클릭하면 그 상품의 정보가 parameter로 넘어와줘야됨
		
		productVO.setP_num(p_num);
		
		productVO = (ProductVO) productService.productSelect(productVO.getP_num());
		
		
		System.out.println(productVO.getP_name()+"::pname");
		
		
		mv.addObject("product", productVO);
		mv.setViewName("product/productSelect");
		
		return mv;
	}
	
	
	
	
	
	
}
