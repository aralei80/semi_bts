<%@page import="com.bts.member.model.UserService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userService" class="com.bts.member.model.UserService" 
	scope="session"></jsp:useBean>
<%
	//[1] register.jsp에서 새창 열기로 이동 - get
	//[2] checkUserid.jsp에서 [아이디확인]  버튼 클릭하면 post방식으로 서브밋
	//=> http://localhost:9090/mystudy/member/checkUserid.jsp?userid=kk
	//1
	request.setCharacterEncoding("utf-8");
	String userid=request.getParameter("userid");
	
	//2
	int result=0;
	if(userid!=null && !userid.isEmpty()){
		try{
			result=userService.checkDuplicate(userid);			
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	//3
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkUserid.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mainstyle.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#btUse').click(function(){
			//opener.document.frm1.userid.value= document.frmDup.userid.value;
			$(opener.document).find('#userid').val('<%=userid%>');
			$(opener.document).find('#chkId').val('Y');
			
			self.close();
		});
	});
</script>
</head>
<body>

<h1>아이디 중복검사</h1>
<form name="frmDup" method="post" action="checkUserid.jsp">
	<label for="userid">아이디</label>
	<input type="text" name="userid" id="userid" value="<%=userid%>">
	<input type="submit" value="아이디 확인">
	
	<%if(result==UserService.UNUSABLE_ID){ %>
		<p>이미 등록된 아이디입니다. 다른 아이디를 입력하세요</p>
	<%}else if(result==UserService.USABLE_ID){ %>
		<input type="button" value="사용하기" id="btUse">
		<p>사용가능한 아이디입니다. [사용하기] 버튼을 클릭하세요</p>
	<%}//if %>
</form>

</body>
</html>




