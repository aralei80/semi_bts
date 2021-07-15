<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//boardWrite.jsp에서 post방식으로 넘어옴
		//encoding
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		//2
		
		
	%>
</body>
</html>