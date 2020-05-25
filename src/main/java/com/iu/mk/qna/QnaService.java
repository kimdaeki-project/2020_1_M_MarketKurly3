package com.iu.mk.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iu.mk.board.BoardService;
import com.iu.mk.board.BoardVO;
import com.iu.mk.util.Pager;

@Service
public class QnaService implements BoardService {
	
	@Autowired
	private QnaDAO qnaDAO;
	
	

	@Override
	public List<BoardVO> boardList(Pager pager) throws Exception {
		pager.makeRow();// 시작 끝 설정
		//전체 글 갯수 가지고 오기
		long totalCount = qnaDAO.boardCount(pager);
		//글 갯수로 블록 정하기
		pager.makePage(totalCount);
		return null;
	}

	@Override
	public BoardVO boardSelect(long num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int boardWrite(BoardVO boardVO, MultipartFile[] files) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardUpdate(BoardVO boardVO, MultipartFile[] files) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardDelete(long num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
