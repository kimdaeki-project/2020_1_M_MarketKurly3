package com.iu.mk.board;

import java.util.List;

import com.iu.mk.board.BoardVO;
import com.iu.mk.util.Pager;

public interface BoardDAO {
	//count
	public long boardCount(Pager pager) throws Exception;
	
	
	
	//List
	public List<BoardVO> boardList(Pager pager) throws Exception; 
	
	
	//select
	public BoardVO boardSelect(long num) throws Exception;
	
	
	//insert
	public int boradWrite(BoardVO boardVO) throws Exception;
	
	//delete
	public int boardDelete(long num)throws Exception;
	
	
	//update
	public int boardUpdate(BoardVO boardVO) throws Exception;
	
	//hit
	public int hitUpdate(long num) throws Exception;
}
