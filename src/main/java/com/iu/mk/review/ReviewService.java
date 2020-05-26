package com.iu.mk.review;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iu.mk.board.BoardService;
import com.iu.mk.review.reviewfile.ReviewFileDAO;
import com.iu.mk.review.reviewfile.ReviewFileVO;
import com.iu.mk.util.FileSaver;


@Service
public class ReviewService{
	

	@Autowired
	private ReviewDAO reviewDAO;
	
	@Autowired
	private FileSaver fileSaver;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ReviewFileDAO reviewFileDAO;
	
	
	public int reviewWrite(ReviewVO reviewVO, MultipartFile files) throws Exception{
		String path = session.getServletContext().getRealPath("/resources/uploadReview");
		System.out.println("path" + path);
		
		
		
		//시퀀스 번호 받기
		reviewVO.setReview_num(reviewDAO.reviewNum());
		
		
		
		
		
		
		reviewVO.setP_num(10170);
	
		
		
		int result = reviewDAO.reviewWrite(reviewVO);
		
		
		
		if(files.getSize()>0) {
			ReviewFileVO reviewFileVO = new ReviewFileVO();
			String fileName = fileSaver.saveByTransfer(files, path);
			reviewFileVO.setReview_num(reviewVO.getReview_num());
			reviewFileVO.setFileName(fileName);
			reviewFileVO.setOriName(files.getOriginalFilename());
			
			reviewFileDAO.fileInsert(reviewFileVO);
			if(result<1) {
				throw new Exception();
			}
			
			
		}
		
		
		return result;
	}
	
	

}
