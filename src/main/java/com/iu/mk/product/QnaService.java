package com.iu.mk.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.iu.mk.util.Pager;

@Service
public class QnaService  {
	
	@Autowired
	private QnaDAO qnaDAO;
	

	public List<QnaVO> qnaList(Pager pager) throws Exception {
		pager.makeRow();// 시작 끝 설정
		//전체 글 갯수 가지고 오기
		
		
		long totalCount = qnaDAO.qnaCount(pager);
		//글 갯수로 블록 정하기
		System.out.println("sevice count" + totalCount);
		pager.makePage(totalCount);
		
		return qnaDAO.qnaList(pager);
	}



	public int qnaWrite(QnaVO qnaVO) throws Exception {
		//시퀀스 번호 받기
		 qnaVO.setNum(qnaDAO.qnaNum()); 
		
		//테이블에 넣기
		int result =qnaDAO.qnaWrite(qnaVO);
		
		
		System.out.println(result + "성공여부");
		
		if(result<1) {
			throw new Exception();// 롤백을 위한 강제 처리
		}
		 
		return  result;
	}
	
	
	public QnaVO qnaSelect(long num) throws Exception{
		return qnaDAO.qnaSelect(num);
	}
	
	
	public int qnaReply(QnaVO qnaVO)throws Exception{
		return qnaDAO.qnaReply(qnaVO);
	}

}