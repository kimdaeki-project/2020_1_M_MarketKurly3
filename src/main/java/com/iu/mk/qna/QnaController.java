package com.iu.mk.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iu.mk.board.BoardVO;
import com.iu.mk.util.Pager;

@Controller
@RequestMapping("/qna/**")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	/*
	 * @ModelAttribute("board") public String getBoard() throws Exception{ return
	 * "qna"; }
	 */
	
	@GetMapping("qnaList")
	public ModelAndView boardList(ModelAndView mv, Pager pager) throws Exception{
		
		List<BoardVO> ar = qnaService.boardList(pager);
		System.out.println(ar.get(0).getTitle()+"title");
		
		mv.addObject("qlist", ar);
		mv.addObject("pager",pager);
		
		mv.setViewName("product/productSelect");
		
		return mv;
		
	}
	
}
