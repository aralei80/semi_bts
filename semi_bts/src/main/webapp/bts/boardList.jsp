<%@page import="semi_bts.common.PagingVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.bts.board.model.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bts.board.model.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/planTop.jsp"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
	table{
		margin-top: 120px; 
		text-align: center;
	}
	table th{
		text-align: center;
	}
	.site-section .container{
		margin-top: 100px;
	}
</style>
<%
	//[1] boardWrite_ok.jsp에서 get으로
	//[2] 검색시 boardList.jsp에서 post로
	//[3] 페이지로 넘어갈 경우 boardList.jsp에서 get
	request.setCharacterEncoding("utf-8");
	//검색조건
	String condition = request.getParameter("searchCondition");
	String keyword = request.getParameter("searchKeyword");
	
	BoardService boardService = new BoardService();
	List<BoardVO> list = null;
	
	try{
		list = boardService.selectAll(condition, keyword);
	}catch(SQLException e){
		e.printStackTrace();
	}
		
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	
	
	//현재페이지
	int currentPage=1; 
	
	if(request.getParameter("currentPage") !=null ){
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	//현재 페이지와 무관한 것
	int totalRecord = 0;
	if(list !=null && !list.isEmpty()){
		totalRecord=list.size();
	}
	//한페이지에 10개
	int pageSize=10;
	//페이이지목록 수 5개
	int blockSize=5;
	
	PagingVO pageVo = new PagingVO(currentPage, totalRecord, pageSize, blockSize);
%>

<div class="site-section" style="clear: both;">
	<div class="container">
	<h1>커뮤니티</h1>
	  <table class="table table-hover">
	     <colgroup>
	      <col style="width:10%;" />
	      <col style="width:50%;" />
	      <col style="width:15%;" />
	      <col style="width:15%;" />
	      <col style="width:10%;" />      
	   </colgroup>
	    <thead>
	      <tr>
	        <th scope="col">번호</th>
	        <th scope="col">제목</th>
	        <th scope="col">작성자</th>
	        <th scope="col">작성일</th>
	        <th scope="col">조회수</th>
	      </tr>
	    </thead>
	    <tbody>
	    <%if(list==null || list.isEmpty()){%>
	    	<tr>
				<td style="text-align: center;" colspan="5">글을 등록해주세요.</td>	    	
	    	</tr>
	    <% }else{%>
	    <!-- 반복시작 -->
	    	<%
		  	int num = pageVo.getNum();
		  	int curPos = pageVo.getCurPos();
		  	
	    	for(int i=0; i<pageVo.getPageSize(); i++){
	    		if(num<1) break;
	    		BoardVO vo = list.get(curPos++);
	    		num--;
	    	%>
	      		<tr>
	        		<td><a href="countUp.jsp?cbNo=<%=vo.getCbNo()%>"><%=vo.getCbNo() %></a></td>
	        		<td style="text-align: left;"><a href="countUp.jsp?cbNo=<%=vo.getCbNo()%>"><%=vo.getTitle()%></a></td>
	        		<td><a href="countUp.jsp?cbNo=<%=vo.getCbNo()%>"><%=vo.getUserid() %></a></td>
	        		<td><a href="countUp.jsp?cbNo=<%=vo.getCbNo()%>"><%=sdf.format(vo.getRegdate()) %></a></td>
	        		<td><a href="countUp.jsp?cbNo=<%=vo.getCbNo()%>"><%=vo.getCount() %></a></td>
	      		</tr>
	      <%}//for %>
	     <%}//if %>
	      <!-- 반복종료 -->
	    </tbody>
	  </table>
	 <p style="text-align: right;font-size: 15px"><a href="boardWrite.jsp">글쓰기</a></p>
	</div>
</div>	
<div class="site-section"  style="text-align: center;">
<div class="pageDiv">
	<%if(pageVo.getFirstPage()>1){ %>
		<a href="boardList.jsp?currentPage=<%=pageVo.getFirstPage()-1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
			<img src="../images/pagedown.png" alt="이전 블럭으로">
		</a>
	<%}//if %>
<!--[1][2][3]  -->
	<%
		for(int i=pageVo.getFirstPage();i<=pageVo.getLastPage();i++){
			if(i>pageVo.getTotalPage()) break;
			
			if(i==pageVo.getCurrentPage()){%>
				<span style="color:green;font-weight: bold;font-size: 1em;">[<%=i %>]</span>
			<%}else{ %>
				<a href ="boardList.jsp?currentPage=<%=i%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">[<%=i %>]</a>
			<%}//if %>	
	<%}//for %>
	
	<%if(pageVo.getLastPage()<pageVo.getTotalPage()){ %>
		<a href="boardList.jsp?currentPage=<%=pageVo.getFirstPage()+1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
			<img src="../images/pageup.png" alt="다음블럭">
		</a>
	<%} %>
</div>
</div>


<div class="site-section"  style="text-align: center;">
 <div class="divSearch"> 
      <form name="frmSearch" method="post" action='boardList.jsp'>
         <select name="searchCondition">
            <option value="title" 
            <% if("title".equals(condition)){%>
            	selected="selected"<%} %>
            >제목</option>
            <option value="content"
            	<% if("content".equals(condition)){%>
            		selected="selected"
            	<%} %>
            >내용</option>
        </select>
        <input type="text" name="searchKeyword" title="검색어" value="<%=keyword%>"> 
        <input class="btn btn-primary" type="submit" value="검색">
      </form>
   </div>
 </div>  
 
<%@include file="../../inc/bottom.jsp"%>