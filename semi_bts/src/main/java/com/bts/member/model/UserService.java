package com.bts.member.model;

import java.sql.SQLException;

public class UserService {

	private UserDAO userDao;
	
	//아이디 중복확인에 사용하는 상수
	public static final int USABLE_ID=1; //사용가능한 아이디
	public static final int UNUSABLE_ID=2; //이미 존재하는 아이디-사용불가

	//로그인 처리에 사용하는 상수
	public static final int LOGIN_OK=1;  //로그인 성공
	public static final int PWD_DISAGREE=2; //비밀번호 불일치
	public static final int ID_NONE=3; //아이디 존재하지 않음
	
	
	public UserService() {
		userDao = new UserDAO();
	}


	public int insertUser(UserVO vo) throws SQLException {
		return userDao.insertUser(vo);
	}
	
	
	public int loginProc(String userid, String pwd) throws SQLException {
		return userDao.loginProc(userid, pwd);
	}
	
	
	public int checkDuplicate(String userid) throws SQLException {
		return userDao.checkDuplicate(userid);
	}
	
	
	public UserVO selectByUserid(String userid) throws SQLException {
		return userDao.selectByUserid(userid);
	}
}
