<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/planTop.jsp" %>
<style type="text/css">
 #boardContainer{
	margin-top: 150px;
}
</style>

<div class="site-section">
<div class="container" id="boardContainer">
	<h2>게시글 작성</h2>
	<form class="frmWrite"  method="POST" action="boardWrite_ok.jsp">
		<div class="form-group">
			<label for="title">Title:</label>
			<input type="text" class="form-control" placeholder="title" id="title" name="title">
			<label for="writer">writer: </label>
			<input type="text" class="form-control" placeholder="writer" id="writer" name="writer">
		</div>
	
		<div class="form-group">
			<label for="content">Content:</label>
			<textarea class="form-control" rows="5" id="summernote" name="content"></textarea>
		</div>
	
		<button type="submit" class="btn btn-primary">작성</button>
		<button type="button" class="btn btn-primary">취소</button>
	</form>
</div>
</div>
<script>
	$('#summernote').summernote({
		placeholder: '글을 작성하세요',
	    tabsize: 2,
	    height: 400
	    
	    
	});
</script>

<%@include file="../inc/planBottom.jsp" %>