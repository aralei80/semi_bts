<%@page import="com.bts.board.model.BoardService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.bts.board.model.BoardVO"%>
<%@page import="com.bts.board.model.BoardDAO"%>
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
		//[1] bookWrite.jsp post로 넘어옴
		request.setCharacterEncoding("utf-8");
		//1
		String title = request.getParameter("title");
		String userid = request.getParameter("writer");
		String content = request.getParameter("content");
		
		//2
		BoardService boardService = new BoardService();
		BoardVO vo = new BoardVO();
		
		vo.setContent(content);
		vo.setTitle(title);
		vo.setUserid(userid);
		
		try{
			int cnt = boardService.insertBoard(vo);
		  
			if(cnt>0){ %>
		  	<script type="text/javascript">
		           alert('작성되었습니다.');
		           location.href="boardList.jsp";
		           </script>

		  	<%}else{%>
		  		<script type="text/javascript">
		  			alert('작성실패');
		  			history.back();
		  		</script>
		  	<%}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>