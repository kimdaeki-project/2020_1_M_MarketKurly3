package com.iu.mk.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.iu.mk.product.ProductVO;
import com.iu.mk.product.QnaService;
import com.iu.mk.product.QnaVO;
import com.iu.mk.util.Pager;

@Controller
@RequestMapping("/qna/**")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	

	
	
	@GetMapping("qnaWrite")
	public ModelAndView qnaWrite(ModelAndView mv, ProductVO productVO) throws Exception{
		mv.addObject("product",productVO);
		mv.setViewName("qna/qnaWrite");
		
		return mv;
	}
	
	@PostMapping("qnaWrite")
	public String qnaWrite(ModelAndView mv, QnaVO qnaVO,ProductVO productVO, long p_num) throws Exception{		
		
		int result = qnaService.qnaWrite(qnaVO);	
		
		String path="";
		if(result>0){
			path="redirect:../product/productSelect?p_num="+productVO.getP_num();
		}else {
			path="redirect:./productSelect?p_num="+productVO.getP_num();
		}
		
		return path;
	}
	
	
	@GetMapping("qnaSelect")
	public ModelAndView qnaSelect(long num, ModelAndView mv,ProductVO productVO) throws Exception{
		
		QnaVO qnaVO = qnaService.qnaSelect(num);
		mv.addObject("vo" ,qnaVO);
		mv.addObject("product",productVO);
		mv.setViewName("qna/qnaSelect");
		
		return mv;
	}
	
	@GetMapping("qnaReply")
	public ModelAndView qnaReply(ModelAndView mv, long num,ProductVO productVO) throws Exception{
		mv.addObject("num",num);//부모의 글번호
		mv.addObject("product",productVO); //p_num넘겨주기
		mv.setViewName("qna/qnaReply");
		
		return mv;
	}
	
	@PostMapping("qnaReply")
	public ModelAndView qnaReply(ModelAndView mv, QnaVO qnaVO,ProductVO productVO) throws Exception{
		int result =qnaService.qnaReply(qnaVO);
		
		if(result>0) {
			mv.setViewName("redirect:../product/productSelect?p_num="+productVO.getP_num());
		}else {
			mv.addObject("result","reply write fail");
			mv.addObject("path","./qnaReply");
			
			mv.setViewName("common/result");
		}
		return mv;
		
	}
	
	@GetMapping("qnaDelete")
	public ModelAndView qnaDelete(ModelAndView mv, long num,ProductVO productVO)throws Exception{
		int result = qnaService.qnaDelete(num);
		
		if(result>0) {
			mv.setViewName("redirect:../product/productSelect?p_num="+productVO.getP_num());
		}else {
			mv.addObject("result","delete fail");
		}
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
}
