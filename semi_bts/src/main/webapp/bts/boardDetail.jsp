<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.bts.board.model.BoardVO"%>
<%@page import="com.bts.board.model.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/planTop.jsp"%>
<style>
 #boardContainer{
	margin-top: 150px;
}
</style>
<%
	String cbNo=request.getParameter("cbNo");
	System.out.println("디테일="+cbNo);
	if(cbNo==null || cbNo.isEmpty()){ %>
	<script type="text/javascript">
		alert("잘못된 url입니다.");
		location.href="list.jsp";
	</script>
	
<%	return;
	}
	
	BoardService boardService = new BoardService();
	BoardVO vo=null;
	
	try{
		vo = boardService.selectByNo(Integer.parseInt(cbNo));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<div class="site-section">
<div class="container" id="boardContainer">
	<h2>상세페이지</h2><br>
		<div class="info">
			<label for="title">Title:</label>
			<input type="text" class="info" placeholder="title" id="title" name="title" 
				disabled="disabled" value = "<%=vo.getTitle() %>>">
			<label for="writer">writer: </label>
			<input type="text" class="info" placeholder="writer" id="writer" name="writer" 
				disabled="disabled" value="<%=vo.getUserid()%>">
			<label for="writer">regdate: </label>
			<input type="text" class="info" placeholder="regdate" id="regdate" name="regdate" 
				disabled="disabled" value="<%=sdf.format(vo.getRegdate())%>">
		</div>
	
		<div class="form-group">
			<label for="content">Content:</label>
			<textarea class="form-control" rows="30" name="content" readonly><%=vo.getContent() %></textarea>
		</div>
	
		<a href="boardEdit.jsp"><button type="button" class="btn btn-primary">수정</button></a>
		<a href="boardDelete.jsp"><button type="button" class="btn btn-primary">삭제</button></a>
		<a href="boardList.jsp"><button type="button" class="btn btn-primary">목록으로</button></a>
</div>
</div>

<%@include file="../../inc/bottom.jsp"%>