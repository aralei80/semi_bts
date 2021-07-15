package com.bts.board.model;

import java.sql.SQLException;
import java.util.List;


public class BoardService {
	private BoardDAO boardDao;
	
	public BoardService() {
		boardDao = new BoardDAO();
	}
	
	public int insertBoard(BoardVO vo) throws SQLException {
		return boardDao.insertBoard(vo); 
	}
	
	public List<BoardVO> selectAll(String condition, String keyword) throws SQLException{
		return boardDao.selectAll(condition, keyword);
	}
	public int updateReadCount(int cbNo) throws SQLException {
		return boardDao.updateReadCount(cbNo);
	}
	
	public BoardVO selectByNo(int no) throws SQLException {
		return boardDao.selectByNo(no);
	}
}
