package com.bts.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bts.db.ConnectionPoolMgr2;


public class UserDAO {

	private ConnectionPoolMgr2 pool;

	public UserDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	public int insertUser(UserVO vo) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;
		
		try {
			conn=pool.getConnection();
			
			String sql="insert into userinfo(userId, userName, userPwd, email, hp, zipcode,"
					+ " address, addressDetail)"
					+ " values(?,?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getUserid());
			ps.setString(2, vo.getUserName());
			ps.setString(3, vo.getUserPwd());
			ps.setString(4, vo.getEmail());
			ps.setString(5, vo.getHp());
			ps.setString(6, vo.getZipcode());
			ps.setString(7, vo.getAddress());
			ps.setString(8, vo.getAddressDetail());
			
			int cnt=ps.executeUpdate();
			System.out.println("회원가입 결과, cnt="+cnt+", 매개변수 vo="+vo);
			
			return cnt;
		}finally {
			pool.dbClose(ps, conn);
		}
	}
	
	
	public int loginProc(String userid, String pwd) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			conn=pool.getConnection();
			
			String sql="select userPwd from userinfo"
					+ " where userid=?";	// outdate = 탈퇴일자
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, userid);
			
			rs=ps.executeQuery();
			
			int result=0;
			if(rs.next()) {
				String dbPwd=rs.getString(1);
				if(dbPwd.equals(pwd)) {
					result=UserService.LOGIN_OK;
				}else {
					result=UserService.PWD_DISAGREE;					
				}
			}else {
				result=UserService.ID_NONE;
			}
			System.out.println("로그인 처리 결과, result="+result
					+", 매개변수 userid="+userid+", pwd="+pwd);
			
			return result;
		}finally {
			pool.dbClose(rs, ps, conn);
		}
	}
	
	
	public UserVO selectByUserid(String userid) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		UserVO vo = new UserVO();
		try {
			conn=pool.getConnection();
			
			String sql="select * from userinfo where userid=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				vo.setUserid(rs.getString("userid"));
				vo.setUserName(rs.getString("username"));
				vo.setUserPwd(rs.getString("userpwd"));
				vo.setEmail(rs.getString("email"));
				vo.setHp(rs.getString("hp"));
				vo.setAddress(rs.getString("address"));
				vo.setAddressDetail(rs.getString("addressDetail"));
				vo.setZipcode(rs.getString("zipcode"));				
				vo.setRegdate(rs.getTimestamp("regdate"));
			}
			System.out.println("회원조회 결과, vo="+vo+", 매개변수 userid="+userid);			
			return vo;
			
		}finally {
			pool.dbClose(rs, ps, conn);
		}
	}
	
	public int checkDuplicate(String userid) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			conn=pool.getConnection();
			
			String sql="select count(*) from userinfo"
					+ " where userid=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, userid);
			
			int result=0;
			rs=ps.executeQuery();
			if(rs.next()) {
				int count=rs.getInt(1);
				if(count>0) {  //이미 존재하는 아이디
					result=UserService.UNUSABLE_ID;
				}else { //사용가능한 아이디
					result=UserService.USABLE_ID;					
				}
			}
			System.out.println("아이디 중복확인 결과, result="+result
				+", 매개변수 userid="+userid);
			
			return result;
		}finally {
			pool.dbClose(rs, ps, conn);
		}
	}
}
