package com.iu.mk.product;

import java.util.List;

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
	
	@GetMapping("productAdminSelect")
	public ModelAndView productSelect(ModelAndView mv, ProductVO productVO, long p_num) throws Exception {
		//상품을 클릭하면 그 상품의 정보가 parameter로 넘어와줘야됨
		
		productVO.setP_num(p_num);
		
		productVO = (ProductVO) productService.productSelect(productVO.getP_num());
		
		
		System.out.println(productVO.getP_name()+"::pname");
		
		
		mv.addObject("product", productVO);
		mv.setViewName("product/productAdminSelect");
		
		return mv;
	}
	
	@GetMapping("productAdminUpdate")
	public String productUpdate(Long p_num ,Model model) throws Exception{
		ProductVO productVO = productService.productSelect(p_num);//수정된 하나 가져오기
		
		/* System.out.println("p_num 가져오기: "+ productVO.getP_num()); */
		
		model.addAttribute("product",productVO);
		return "product/productAdminUpdate";
	}
	
	@PostMapping("productAdminUpdate")
	public String productUpdate(ProductVO productVO,MultipartFile files)throws Exception{
		long result = productService.productUpdate(productVO, files);
		
		System.out.println("result : " + result);
		
		String path="";
		if(result>0) {
			path="redirect:./productList";
		}else {
			path="redirect:./productAdminSelect?p_num="+productVO.getP_num();
		}
		
		return path;
	
	}
}
