<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<%
	Cookie[] ckArr=request.getCookies();
	String ck_value="";
	if(ckArr!=null){
		for(int i=0;i<ckArr.length;i++){
			String name=ckArr[i].getName();
			if(name.equals("ck_userid")){
				ck_value=ckArr[i].getValue();
				break;
			}
		}//for
	}
%>
<style type="text/css">
	.simpleForm {
		display: flex;
		justify-content: center;
		align-items: center;
		height: 50vh;
	}

	.error {
		color: red;
		font-size: small;
		margin-left : 45px;
		display: none;
	}
	
	form[name="frmLogin"] {
  		border: 1px solid gray;
  		padding: 15px;
  		border-radius: 5px;
	}
	
	.userid, .pwd, .align_center {
		text-align: center;
	}
	
	legend {
		text-align: center;
	}
	
</style>
<Script type="text/javascript">
	$(function(){
		$('#lg_submit').click(function(){
			$('.infobox').each(function(idx, item){
				if($(this).val().length<1){
					$(this).parent().children("span").show();
					event.preventDefault();
					$(item).focus();
				}else{
					$(this).parent().children("span").hide();					
				}
			});
		});
		
	});
	
</Script>

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

	<%-- <article class="simpleForm">
		<form name="frmLogin" method="post"	action="login_ok.jsp">
			<fieldset>
				<legend>로그인</legend>
				<div>
					<label for="userid" class="label">ID &nbsp;&nbsp;</label>
					<input type="text" name="userid" id="userid" class="infobox"
						value="<%=ck_value%>"><br>
					<span class="error">아이디를 입력하세요</span>
				</div>
				<div>
					<label for="pwd" class="label">PW &nbsp;</label>
					<input type="password" name="pwd" id="pwd" class="infobox"><br>
					<span class="error">비밀번호를 입력하세요</span>
				</div>
				<div class="align_center">
					<input type="checkbox" name="chkSave" id="chkSave"
						<%if(ck_value!=null && !ck_value.isEmpty()){ %>
							checked="checked"
						<%} %>
					>
					<label for="chkSave">아이디 저장하기</label><br>
					<input type="submit" id="lg_submit" value="로그인">
					<a href="../register.jsp">
						<input type="button" id="join" value="회원가입" >
					</a>
					<br>
				</div>
			</fieldset>
		</form>
	</article> --%>
	<div class="col-lg-8 mb-5" style="margin-left: 500px;">
            <form action="#" method="post">
              <div class="form-group row" >
                <div class="col-md-6 mr-auto">
                  <input type="text" class="form-control" placeholder="ID">
                </div>
              </div>
              <div class="form-group row" >
                <div class="col-md-6 mr-auto">
                  <input type="password" class="form-control" placeholder="PASSWORD">
                </div>
              </div>

              <div class="form-group row">
                <div class="col-md-6 mr-auto">
                  <input type="submit" class="btn btn-block btn-primary text-white py-3 px-5" value="Send Message">
                </div>
              </div>
            </form>
          </div>	

<%@ include file="../../inc/bottom.jsp" %>
