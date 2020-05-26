package com.iu.mk.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iu.mk.member.MemberVO;

@Controller
@RequestMapping("/review/**")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	
	@GetMapping("reviewWrite")
	public ModelAndView reviewWrite(ReviewVO reviewVO, long p_num, String p_name, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("받아온 p_num : " + p_num);
		
		
		reviewVO.setP_num(p_num);
		reviewVO.setP_name(p_name);
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		reviewVO.setId(memberVO.getId());
		
		
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
		
		
		
		
		
		int result = reviewService.reviewWrite(reviewVO, files);
		
		
		System.out.println("result : " + result);
	
		
		mv.addObject("p_num", reviewVO.getP_num());
		mv.setViewName("review/reviewSuccess");
		
		
		return mv;
	}
	
	
	@PostMapping("reviewSuccess")
	public ModelAndView reviewSuccess(long p_num, ModelAndView mv) throws Exception{
		
		mv.addObject("p_num", p_num);
		mv.setViewName("review/reviewSuccess");
		return mv;
	}
	
} 
