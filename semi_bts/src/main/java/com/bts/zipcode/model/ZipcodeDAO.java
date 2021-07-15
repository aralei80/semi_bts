package com.bts.zipcode.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bts.db.ConnectionPoolMgr2;

public class ZipcodeDAO {
	private ConnectionPoolMgr2 pool;

	public ZipcodeDAO() {
		pool=new ConnectionPoolMgr2();
	}

	public List<ZipcodeVO> selectZipcode(String dong) throws SQLException{
		Connection conn=null;
		PreparedStatement psmt=null;
		ResultSet rs =null;

		List<ZipcodeVO> list = new ArrayList<ZipcodeVO>();
		try{
			conn = pool.getConnection();
			
			String sql="select * from zipcode"
					+ " where dong like '%' || ? || '%'";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dong);
			
			rs = psmt.executeQuery();
			while(rs.next()){
				String sido = rs.getString("sido");
				String gugun = rs.getString("gugun");
				String dong2 = rs.getString("dong");
				String sbunji = rs.getString("startbunji");
				String ebunji = rs.getString("endbunji");
				int seq =rs.getInt("seq");
				String zipcode = rs.getString("zipcode");
				
				ZipcodeVO vo = new ZipcodeVO();
				vo.setStartbunji(sbunji);
				vo.setEndbunji(ebunji);
				vo.setDong(dong2);
				vo.setGugun(gugun);
				vo.setSeq(seq);
				vo.setSido(sido);
				vo.setZipcode(zipcode);
				
				list.add(vo);
			}
			System.out.println("우편번호 조회, list.size="+list.size()
				+ ", 매개변수 dong="+dong);
			
			return list;
		}finally{
			pool.dbClose(rs, psmt, conn);
		}
	}
	
	
}