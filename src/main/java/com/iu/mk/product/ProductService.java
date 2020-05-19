package com.iu.mk.product;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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
		
		System.out.println(pager.getStartRow()+"star");
		System.out.println(pager.getLastRow()+"last");
		if(pager.getKind()==null ) {
			pager.setKind("");
		}
		long totalCount = productDAO.productCount(pager);//전체 글 갯수 가져오기
		pager.makePage(totalCount);//totalcount넘겨주기
		
		System.out.println("totalcount: " + totalCount);//x
		
		return productDAO.productList(pager);
	}
	
	/*
	 * public List<ProductVO> getProductFile(ProductVO productVO) throws Exception{
	 * return productDAO.getProductFile(productVO); }
	 */
	
	public int productWrite(ProductVO productVO, MultipartFile files) throws Exception{
		
		String path = session.getServletContext().getRealPath("/resources/uploadproduct");
		System.out.println(path); //실제 파일이 들어오는지 확인하는 경로
		
		//시퀀스 번호 받기
		productVO.setP_num(productDAO.productNum());
		
		
		//테이블에 넣어
		int result = productDAO.productWrite(productVO); //product 채워짐
		
		if(files.getSize()>0) {
			ProductFileVO productFileVO = new ProductFileVO();
			String fileName = fileSaver.saveByTransfer(files, path); //이미지파일 저장
			productFileVO.setP_num(productVO.getP_num());
			productFileVO.setFileName(fileName);;
			productFileVO.setOriName(files.getOriginalFilename());
			productFileVO.setKind(productVO.getKind());
			
			System.out.println("service img :" + files.getOriginalFilename());
			
			productFileDAO.fileInsert(productFileVO);//보드파일테이블 삽입
			if(result<1) {
				throw new Exception();// 롤백을 위한 강제 예외처리
			}
			
			
		}
		
		return result;
	
	}
	
	//select
	public ProductVO productSelect(Long p_num) throws Exception{
		System.out.println(p_num+":::sservice_num");
		return productDAO.productSelect(p_num);
	}
	
	
	//하드디스크의 file save
	public long productUpdate(ProductVO productVO,MultipartFile files) throws Exception{

		//하드디스크에 file이 들어있는 실제 경로
		String path = servletContext.getRealPath("/resources/uploadproduct");
		System.out.println(path);
		
		//table insert
		long result = productDAO.productUpdate(productVO);
		
		if(files.getSize()>0) {
			ProductFileVO productFileVO  = new ProductFileVO();
			//filesaver 파일이름 랜덤 생성
			productFileVO.setP_num(productVO.getP_num());//product p_num과 같은것으로 입력	
			productFileVO.setOriName(files.getOriginalFilename());
			productFileVO.setFileName(fileSaver.saveByTransfer(files, path));
			productFileVO.setKind(productVO.getKind());
			//productfiledao insert 시켜줌
			
			System.out.println("check  num: "+productFileVO.getP_num());
			System.out.println("check name : "+productFileVO.getKind());
			result = productFileDAO.fileInsert(productFileVO);
		}
		
		return result;
	}
	
	
	public int productDelete(long p_num) throws Exception{
		List<ProductFileVO> list = productFileDAO.fileList(p_num);
		//1.hdd에 해당 파일들을 삭제
		String path = servletContext.getRealPath("resources/uploadproduct");
		
		for(ProductFileVO productFileVO :list) {
			fileSaver.deleteFile(productFileVO.getFileName(), path);
		}
		//2.db에서 삭제
		productFileDAO.fileDeleteAll(p_num);
		
		return productDAO.productDelete(p_num);
	}
	
	
}
