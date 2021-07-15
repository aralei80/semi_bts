package com.bts.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.bts.db.ConnectionPoolMgr2;

public class BoardDAO {
	
	private ConnectionPoolMgr2 pool;
	
	public BoardDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	public int insertBoard(BoardVO vo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = pool.getConnection();
			
			String sql = "insert into cboard(cbNo, userid, title, content)"
					+ " values(cboard_seq.nextval,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getUserid());
			ps.setString(2, vo.getTitle());
			ps.setString(3, vo.getContent());
			
			int cnt = ps.executeUpdate();
			System.out.println("게시판업로드 결과 cnt = " + cnt +"매개변수 vo" + vo);
			return cnt;
		} finally {
			pool.dbClose(ps, conn);
		}
	}//
	
	public List<BoardVO> selectAll(String condition, String keyword) throws SQLException{
		Connection conn = null;
		PreparedStatement ps= null;
		ResultSet rs = null;
		
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			//1
			conn = pool.getConnection();
			//2
			String sql = "select * from cboard";
			if(condition!=null && !condition.isEmpty()) {
				   sql+= " where "+ condition +" like '%' || ? ||'%'";
			}
			sql +=" order by cbNo desc";
			
			ps = conn.prepareStatement(sql);
			if(keyword!=null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}
			
			rs= ps.executeQuery();
			while(rs.next()) {
				int cbNo = rs.getInt("cbNo");
				String userid = rs.getString("userid");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				int count = rs.getInt("count");
				
				BoardVO vo = new BoardVO(cbNo, userid, title, content, regdate, count);
				
				list.add(vo);
			}
			System.out.println("커뮤니티게시판 전체목록 list.size() : " + list.size() 
								+ ", 매개변수 condition = "+condition+", keyowrd ="+keyword);
			return list;
		} finally {
			pool.dbClose(rs, ps, conn);	
		}
	}
	
	public BoardVO selectByNo(int cbNo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		BoardVO vo = new BoardVO();
		try {
			conn = pool.getConnection();
			
			String sql = "select * from cboard where cbNo=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cbNo);
			
			rs= ps.executeQuery();
			if(rs.next()) {
				vo.setCbNo(cbNo);
				vo.setContent(rs.getString("content"));
				vo.setCount(rs.getInt("count"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				vo.setTitle(rs.getString("title"));
				vo.setUserid(rs.getString("userid"));
			}
			System.out.println("매개변수 cbNo="+cbNo +", vo="+ vo);
			return vo;
		} finally {
			pool.dbClose(rs, ps, conn);
		}
		
	}
	
	
	public int updateReadCount(int cbNo) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;

		try {
			conn=pool.getConnection();

			String sql="update cboard"
					+ " set count=count+1"
					+ " where cbNo=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cbNo);

			int cnt=ps.executeUpdate();
			System.out.println("조회수 증가 결과 cnt="+cnt+", 매개변수 no="+cbNo);

			return cnt;
		}finally {
			pool.dbClose(ps, conn);
		}
	}//
}
