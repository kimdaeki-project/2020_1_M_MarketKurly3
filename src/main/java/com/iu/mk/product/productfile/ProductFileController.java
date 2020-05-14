package com.iu.mk.product.productfile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/productFile/**") ///     productFile/fileInsert
public class ProductFileController {
	
	@Autowired
	private ProductFileService productFileService;
	
	@PostMapping("fileInsert")
	public ModelAndView fileInsert(MultipartFile files) throws Exception{
		ModelAndView mv = new ModelAndView();
		String fileName = productFileService.fileInsert(files);
		mv.addObject("result", fileName);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@PostMapping("fileDelete")
	@ResponseBody
	public int fileDelete(ProductFileVO productFileVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = productFileService.fileDelete(productFileVO);
		System.out.println("result : "+result);
		mv.addObject("result",result);
		mv.setViewName("common/ajaxResult");
		
		return result;
	}
	
	
	
}
