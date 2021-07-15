<%@page import="jdk.internal.misc.FileSystemOption"%>
<%@page import="com.bts.board.model.BoardService"%>
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
	<%
	//list.jsp에서 [제목]클릭하면 get방식으로 이동
	//=> http://localhost:9090/mystudy/reBoard/countUpdate.jsp?no=5
	//1
	String cbNo=request.getParameter("cbNo");
	System.out.println(cbNo);
	if(cbNo==null || cbNo.isEmpty()){ %>
		<script type="text/javascript">
			alert('잘못된경로입니다');
			location.href="boardList.jsp";
		</script>
		
	<%	return;
	}
	
	//2
	BoardService boardService = new BoardService();
	
	try{
		int cnt=boardService.updateReadCount(Integer.parseInt(cbNo));	
		//3
		if(cnt>0){
			response.sendRedirect("boardDetail.jsp?cbNo="+cbNo);
		}else{ %>
			<script type="text/javascript">
				alert('조회수 증가 실패');
				history.back();
			</script>	
	<%	}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
	
</body>
</html>