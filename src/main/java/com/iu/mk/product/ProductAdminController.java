package com.iu.mk.product;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public ModelAndView productAdmin(ModelAndView mv,Pager pager,ProductVO productVO, String bar) throws Exception{
		
		List<ProductVO> ar = productService.productList(pager,bar);
		System.out.println("admin totalpage"+pager.getTotalPage());
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
		System.out.println(productVO.getKind()+";;kind");
		System.out.println(productVO.getBar()+"::::::bar");
		
		
		mv.addObject("product", productVO);
		mv.setViewName("product/productAdminSelect");
		
		return mv;
	}
	
	@GetMapping("productAdminUpdate")
	public String productUpdate(Long p_num ,Model model) throws Exception{
		ProductVO productVO = productService.productSelect(p_num);//수정된 하나 가져오기
		
		model.addAttribute("product",productVO);
		return "product/productAdminUpdate";
	}
	
	@PostMapping("productAdminUpdate")
	public String productUpdate(ProductVO productVO,MultipartFile files,HttpServletRequest request)throws Exception{
		//
		Enumeration<String> er = request.getParameterNames();
		while(er.hasMoreElements()) {
			System.out.println("꺼내오는지 확인"+er.nextElement());//다음요소를  꺼내와
	}
		
		
		//sevice전에 확인을 찍엉봐야함. 제대로 넘어오는지
		System.out.println("p_num 가져오기: "+ productVO.getP_num()); 
		System.out.println("p_name 가져오기: "+ productVO.getP_name()); 
		System.out.println("p_name 가져오기: "+ productVO.getKind());
		System.out.println("p_name 가져오기: "+ productVO.getContents()); 
		System.out.println("bar 가져오기: "+ productVO.getBar()); 
		
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
	
	
	@PostMapping("productAdminDelete")
	public ModelAndView productDelete(long p_num , ModelAndView mv) throws Exception{
		int result = productService.productDelete(p_num);
		
		mv.setViewName("redirect:./productAdmin");
		
		return mv;
	}
	
	//선택 삭제
	@PostMapping("selectAdminDelete")
	@ResponseBody
	public int selectDelete(String pn) throws Exception{
		System.out.println(pn);
		
		//파싱후 배열에 담기
	
		String ar[] = pn.split("-");
		for(int i=0;i<ar.length;i++) {
			System.out.println("ar : "+ar[i]);
			System.out.println(ar[i]);
		}
		
		int result =0;
		//다녀오기
		for(int i=0;i<ar.length;i++) {
			result = productService.productDelete(Long.parseLong((ar[i])));
			System.out.println(result);
		}
		return result;
	}
	
	
}
