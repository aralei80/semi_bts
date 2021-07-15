<%@page import="com.bts.member.model.UserService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="userVo" class="com.bts.member.model.UserVO" scope="page"></jsp:useBean>
<jsp:useBean id="userService" 
	class="com.bts.member.model.UserService" scope="session"></jsp:useBean>
<%
	//1
	request.setCharacterEncoding("utf-8");
	String userName=request.getParameter("username");
	String userId=request.getParameter("userid");
	String userPwd=request.getParameter("userpwd");
	String zipcode=request.getParameter("zipcode");
	String address=request.getParameter("address");
	String addressDetail=request.getParameter("addressDetail");
	String hp1=request.getParameter("hp1");
	String hp2=request.getParameter("hp2");
	String hp3=request.getParameter("hp3");
	String email1=request.getParameter("email1");
	String email2=request.getParameter("email2");
	String email3=request.getParameter("email3");
	
	//2
	String email="", hp="";
	if(hp2!=null && !hp2.isEmpty() && hp3!=null && !hp3.isEmpty()){
		hp=hp1+"-"+hp2+"-"+hp3;
	}
	
	if(email1!=null && !email1.isEmpty()){
		if(email2.equals("etc")){
			if(email3!=null && !email3.isEmpty()){
				email=email1+"@"+email3;
			}
		}else{
			email=email1+"@"+email2;
		}
	}
	
	userVo.setUserid(userId);
	userVo.setUserName(userName);
	userVo.setUserPwd(userPwd);
	userVo.setEmail(email);
	userVo.setHp(hp);
	userVo.setAddress(address);
	userVo.setAddressDetail(addressDetail);
	userVo.setZipcode(zipcode);
	
	String msg="회원등록 실패", url="/bts/register.jsp";
	try{
		int cnt=userService.insertUser(userVo);
		
		if(cnt>0){
			msg="회원가입되었습니다.";
			url="/bts/main.jsp";
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);	
%>
	<jsp:forward page="../common/message.jsp"></jsp:forward>
</body>
</html>