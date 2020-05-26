package com.iu.mk.board;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.iu.mk.board.BoardVO;
import com.iu.mk.util.Pager;

public interface BoardService {
	//List
	public List<BoardVO> boardList(Pager pager) throws Exception;
	
	//Select
	public BoardVO boardSelect(long num) throws Exception;
	
	//Insert
	public int boardWrite(BoardVO boardVO) throws Exception;
	
	//Update
	public int boardUpdate(BoardVO boardVO) throws Exception;
	
	//Dalete
	public int boardDelete(long num) throws Exception;
}
