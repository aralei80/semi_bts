<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<style type="text/css">
	.mp_list {
		border: 1px solid gray;
		height: 50px;
		display: flex;
  		justify-content: center;
	}
	
	.category {
		float: left;
		margin-left: 70px;
		margin-top: 10px;
	}
	
	.userImg {
		margin-left: 200px;
	}
	
	.contents {
		text-align: center;
		position: relative;
		left: 100px; 
		top: -100px;
	}
</style>

<div class="owl-carousel owl-1">
      <div class="ftco-blocks-cover-1">
        <div class="ftco-cover-1" >
            <div class="ftco-cover-1" style="background-image: url('<%=request.getContextPath()%>/images/img_1.JPG');">
        
            <div class="container">
              <div class="row align-items-center justify-content-center">
                <div class="col-lg-6 text-center">
                  <h1>Welcome to <span class="text-primary">Ideal.</span>  </h1>
                  <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                  <p class="mb-0"><a href="#" class="btn btn-primary px-4 py-2 rounded-0">Get A Quote</a></p>
                </div>
                </div>
              </div>
            </div>
        </div>
      </div>
      <div class="ftco-blocks-cover-1">
        <div class="ftco-cover-1" style="background-image: url('<%=request.getContextPath()%>/images/img_2.JPG');">
          <div class="container">
              <div class="row align-items-center justify-content-center">
                <div class="col-lg-6 text-center">
                  <h1>Enhance Human Experience</h1>
                  <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                  <p class="mb-0"><a href="#" class="btn btn-primary px-4 py-2 rounded-0">Get A Quote</a></p>
                </div>
              </div>
            </div>
        </div>
      </div>
      <div class="ftco-blocks-cover-1">
        <div class="ftco-cover-1" style="background-image: url('<%=request.getContextPath()%>/images/img_3.JPG');">
          <div class="container">
            <div class="row align-items-center justify-content-center">
              <div class="col-lg-6 text-center">
                <h1>The Best Interior Design</h1>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                <p class="mb-0"><a href="#" class="btn btn-primary px-4 py-2 rounded-0">Get A Quote</a></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="mp_list">
    	<div class="category"><a href="<%=request.getContextPath()%>/bts/userEdit.jsp">회원정보수정</a></div>
    	<div class="category"><a href="<%=request.getContextPath()%>/bts/userInterest.jsp">찜목록</a></div>
    	<div class="category"><a href="<%=request.getContextPath()%>/bts/userTourInfo.jsp">나의여행정보</a></div>
    	<div class="category"><a href="<%=request.getContextPath()%>/bts/userComment.jsp">내가쓴댓글</a></div>
    	<div class="category"><a href="<%=request.getContextPath()%>/bts/etc.jsp">기타</a></div>
    </div><br><br>
	<div class="userImg">
	  	<img alt="user_icon" src="../images/user.png" style="width: 200px; height: 200px;">
	</div>
	<div class="contents">찜목록 페이지입니다.</div>



<%@ include file="../inc/bottom.jsp" %>