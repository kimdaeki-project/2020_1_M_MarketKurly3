package com.iu.mk.product;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iu.mk.product.productfile.ProductFileDAO;
import com.iu.mk.product.productfile.ProductFileVO;
import com.iu.mk.util.FileSaver;
import com.iu.mk.util.Pager;

@Service
public class ProductService {
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private HttpSession session;
	@Autowired
	private FileSaver fileSaver;
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private ProductFileDAO productFileDAO;
	
	
	public List<ProductVO> productList(Pager pager) throws Exception{
		pager.makeRow(); //시작,끝 row 계산
		
		long totalCount = productDAO.productCount(pager);//전체 글 갯수 가져오기
		pager.makePage(totalCount);//totalcount넘겨주기

		return productDAO.productList(pager);
	}
	
	/*
	 * public List<ProductVO> getProductFile(ProductVO productVO) throws Exception{
	 * return productDAO.getProductFile(productVO); }
	 */
	
	public int productWrite(ProductVO productVO, MultipartFile files) throws Exception{
		String path = session.getServletContext().getRealPath("/resources/uploadproduct");
		
		//시퀀스 번호 받기
		productVO.setP_num(productDAO.productNum());
		
		
		//테이블에 넣어
		int result = productDAO.productWrite(productVO); //product 채워짐
		
		if(files.getSize()>0) {
			ProductFileVO productFileVO = new ProductFileVO();
			String fileName = fileSaver.saveByTransfer(files, path); //이미지파일 저장
			productFileVO.setP_num(productVO.getP_num());
			productFileVO.setFilename(fileName);
			productFileVO.setOriname(files.getOriginalFilename());
			productFileVO.setP_kind(productVO.getP_kind());
			productFileDAO.fileInsert(productFileVO);//보드파일테이블 삽입
			if(result<1) {
				throw new Exception();// 롤백을 위한 강제 예외처리
			}
			
			
		}
		
		return result;
		
	
	}
	
	
	
}
