package com.iu.mk.qna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iu.mk.board.BoardDAO;
import com.iu.mk.board.BoardVO;
import com.iu.mk.util.Pager;

@Repository
public class QnaDAO implements BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String Namespace ="com.iu.mk.qna.QnaDAO.";

	@Override
	public long boardCount(Pager pager) throws Exception {
		return sqlSession.selectOne(Namespace+"boardCount",pager);
	}

	@Override
	public List<BoardVO> boardList(Pager pager) throws Exception {
		return sqlSession.selectList(Namespace+"boarList",pager);
	}

	@Override
	public BoardVO boardSelect(long num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int boradWrite(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardDelete(long num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardUpdate(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int hitUpdate(long num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
}
