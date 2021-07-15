<%@page import="com.bts.member.model.UserVO"%>
<%@page import="com.bts.member.model.UserService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login_ok.jsp</title>
</head>
<body>
<jsp:useBean id="userService" class="com.bts.member.model.UserService" 
	scope="session"></jsp:useBean>
<%
//1
	request.setCharacterEncoding("utf-8");
	String userid=request.getParameter("userid");
	String pwd=request.getParameter("pwd");
	String chkSave=request.getParameter("chkSave");
	
	//2
	String msg="로그인 처리 실패", url="/bts/login/login.jsp";
	try{
		int result=userService.loginProc(userid, pwd);
		if(result==UserService.LOGIN_OK){
			//회원정보 조회
			UserVO userVo=userService.selectByUserid(userid);
			
			//[1] 세션에 아이디 저장
			session.setAttribute("userid", userid);
			session.setAttribute("userName", userVo.getUserName());
			
			//[2] 아이디 저장하기 체크한 경우 쿠키에 저장		
			Cookie ck = new Cookie("ck_userid", userid);
			ck.setPath("/");
			if(chkSave != null){  //체크한 경우
				ck.setMaxAge(1000*24*60*60); //1000일
				response.addCookie(ck);
			}else{ //체크하지 않은 경우
				ck.setMaxAge(0); //쿠키 삭제
				response.addCookie(ck);				
			}
			
			msg = userVo.getUserName() + "님, 로그인되었습니다.";
			url="/bts/main.jsp";
		}else if(result==UserService.PWD_DISAGREE){
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result==UserService.ID_NONE){
			msg="해당 아이디는 존재하지 않습니다.";
		}
	} catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="../../common/message.jsp"></jsp:forward>
</body>
</html>






