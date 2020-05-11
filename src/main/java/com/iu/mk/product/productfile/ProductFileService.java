package com.iu.mk.product.productfile;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iu.mk.util.FileSaver;

@Service
public class ProductFileService {

	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private FileSaver fileSaver;
	
	@Autowired
	private ProductFileDAO productFileDAO;
	
	//contents에서 사진을 넣었을 때 사용
	public String fileInsert(MultipartFile files) throws Exception{
		//db에는 안들어가고 하드디스크에만 들어가서 불러오는 경로
		String path = servletContext.getRealPath("/resources/product");
		path = fileSaver.saveByTransfer(files, path);
		path = servletContext.getContextPath()+"/resources/product/"+path;
		return fileSaver.saveByTransfer(files, path);
	}
	
	
	public List<ProductFileVO> fileList(Long p_num) throws Exception{
		return productFileDAO.fileList(p_num);
	}
	
	
	
	
	
}
