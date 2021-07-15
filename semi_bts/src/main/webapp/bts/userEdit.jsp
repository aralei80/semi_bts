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
	<div class="userImg" style="float: left;">
	  	<img alt="user_icon" src="../images/user.png" style="width: 200px; height: 200px;">
	</div>
	

<div class="divForm" style="float: left; margin-left: 300px;">
<form name="frm1" method="post" action="memberEdit_ok.jsp">
<fieldset>
	<legend>회원 정보 수정</legend>
    <div>        
        <label for="name">성명</label>
        <span>성명</span>
    </div>
    <div>
        <label for="userid">회원ID</label>
        <span>아이디</span>
    </div>
    <div>
        <label for="pwd">비밀번호</label>
        <input type="Password" name="pwd" id="pwd">
    </div>
    <div>
        <label for="pwd2">비밀번호 확인</label>
        <input type="Password" name="pwd2" id="pwd2">
    </div>
    <div>
        <label for="zipcode">주소</label>
        <input type="text" name="zipcode" id="zipcode" ReadOnly  
        	title="우편번호" class="width_80" value="">
        <input type="Button" value="우편번호 찾기" id="btnZipcode" title="새창열림"><br />
        <span class="sp1">&nbsp;</span>
        <input type="text" name="address" ReadOnly title="주소"  
        	class="width_350" value=""><br />
        <span class="sp1">&nbsp;</span>
        <input type="text" name="addressDetail" title="상세주소"  
        	class="width_350" value="">
    </div>
    <div>
        <label for="hp1">핸드폰</label>&nbsp;<select name="hp1" id="hp1" title="휴대폰 앞자리">
            <option value="010"
            	
            >010</option>
            <option value="011"
            	
            >011</option>
            <option value="016"
            
            >016</option>
            <option value="017"
            	
            >017</option>
            <option value="018"
            	
            >018</option>
            <option value="019"
            	
            >019</option>
       	</select>
        -
        <input type="text" name="hp2" id="hp2" maxlength="4" title="휴대폰 가운데자리"
        	class="width_80" value="">-
        <input type="text" name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리"
        	class="width_80" value="">
    </div>
    <div>
        <label for="email1">이메일 주소</label>
        <input type="text" name="email1"  id="email1" 
        	title="이메일주소 앞자리" value="">@
        <select name="email2" id="email2"  title="이메일주소 뒷자리">
            <option value="naver.com"
            	
            >naver.com</option>
            <option value="hanmail.net"
            	
            >hanmail.net</option>
            <option value="nate.com"
            	
            >nate.com</option>
            <option value="gmail.com"
            	
            >gmail.com</option>
            <option value="etc"
            	
            >직접입력</option>
        </select>
        <input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리"
        	style="width: 140px;"
        	>
        	
    </div>
    <div class="center">
         <input type="submit" id="wr_submit" value="수정">
    </div>
</fieldset>
        
</form>
</div>




<%@ include file="../inc/bottom.jsp" %>