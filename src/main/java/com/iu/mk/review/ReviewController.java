package com.iu.mk.review;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iu.mk.product.ProductVO;

@Controller
@RequestMapping("/review/**")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	
	@GetMapping("reviewWrite")
	public ModelAndView reviewWrite(ReviewVO reviewVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		reviewVO.setP_num(10170);
		reviewVO.setP_name("치즈");
		reviewVO.setId("admin");
		
		
		mv.addObject("review", reviewVO);
		mv.setViewName("review/reviewWrite");
		
		
		return mv;
	}
	
	@PostMapping("reviewWrite")
	public ModelAndView reviewWrite(ReviewVO reviewVO, MultipartFile files, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();

		System.out.println(reviewVO.getP_num());
		System.out.println(reviewVO.getP_name());
		System.out.println(reviewVO.getId());
		
		System.out.println(reviewVO.getTitle());
		System.out.println(reviewVO.getContents());
		
		//System.out.println(reviewVO.getNum());
		
		reviewVO.setP_num(10170);
		
		
		
		int result = reviewService.reviewWrite(reviewVO, files);
		
		
		
		
		
		
		
		
		System.out.println("result : " + result);
	
		
		mv.addObject("review", reviewVO);
		mv.setViewName("product/productSelect?p_num="+reviewVO.getP_num());
		
		
		return mv;
	}
	
	
	
} 
