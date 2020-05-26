package com.iu.mk.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iu.mk.board.BoardVO;
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
	
}
