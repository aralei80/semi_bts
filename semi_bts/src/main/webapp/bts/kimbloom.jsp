<%@page import="semi_bts.common.PagingVO"%>
<%@page import="semi_bts.tourplace.model.TourplaceDTO"%>
<%@page import="java.util.List"%>
<%@page import="semi_bts.tourplace.model.TourplaceDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	request.setCharacterEncoding("utf-8");
	String condition=request.getParameter("searchCondition");
	String keyword=request.getParameter("searchKeyword");
	
	TourplaceDAO dao = new TourplaceDAO();

	List<TourplaceDTO> list=null;
	
	try{
		list = dao.selectAll(condition,keyword);
		
	}catch(SQLException e){
		e.printStackTrace();
	}


	//페이징 처리
	int currentPage=1;  //현재 페이지
	
	if(request.getParameter("currentPage") !=null ){
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	//(1) 현재 페이지와 무관한 변수
	int totalRecord = 0;  //전체 레코드 개수, 예) 17
	if(list !=null && !list.isEmpty()){
		totalRecord=list.size();
	}
	int pageSize=8;  //한 페이지에 보여줄 레코드 수, 5
	int blockSize=5;  //한 블럭에 보여줄 페이지 수, 10
	
	PagingVO pageVo = new PagingVO(currentPage, totalRecord, pageSize, blockSize);

%>
<!doctype html>
<html lang="en">

  <head>
    <title>Ideal &mdash; Website Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="<%=request.getContextPath()%>/https://fonts.googleapis.com/css?family=DM+Sans:300,400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/icomoon/style.css">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/animate.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/aos.css">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">

  </head>

  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
  
	<%if(keyword!=null && !keyword.isEmpty()){%>
	
	<%} else{
		keyword="";	
	}%>
			
			
			
    <div class="site-wrap" id="home-section">

      <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
          <div class="site-mobile-menu-close mt-3">
            <span class="icon-close2 js-menu-toggle"></span>
          </div>
        </div>
        <div class="site-mobile-menu-body"></div>
      </div>


<!-- 헤더 시작 -->
       <header class="site-navbar site-navbar-target" role="banner">

        <div class="container">
          <div class="row align-items-center position-relative">

            <div class="col-lg-4">
              <nav class="site-navigation text-right ml-auto " role="navigation">
                <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block" id="nav">
               
                  <li><a href="project.html" class="nav-link">여행지   </a>
                  <ul class="submenu">
                  <li><a href="">여행지</a></li>
                  <li><a href="">맛집</a></li>
                  </ul></li>
                  <li><a href="services.html" class="nav-link">여행일정</a>
                  <ul class="submenu">
                    <li><a href="">여행일정 계획</a></li>
                  </ul>
                  </li>
                </ul>
              </nav>
            </div>
            <div class="col-lg-4 text-center">
              <div class="site-logo">
                <a href="index.html">Ideal</a>
              </div>


              <div class="ml-auto toggle-button d-inline-block d-lg-none"><a href="#" class="site-menu-toggle py-5 js-menu-toggle text-white"><span class="icon-menu h3 text-white"></span></a></div>
            </div>
            <div class="col-lg-4">
              <nav class="site-navigation text-left mr-auto " role="navigation" >
                <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block" id="nav">
                  <li><a href="about.html" class="nav-link">커뮤니티</a>
                  <ul class="submenu">
                  <li><a href="">게시글</a></li>
                  </ul>
                  </li>
                  <li><a href="blog.html" class="nav-link">마이페이지</a>
                  <ul class="submenu">
                  <li><a href="#">회원정보</a></li>
                  <li><a href="#">나의 회원정보</a></li>
                  </ul>
                  </li>
                       </ul>
              </nav>
            </div>
            </div>

          </div>
        </div>
      </header>
<!-- 헤더 끝 -->
    
    
    <div class="ftco-blocks-cover-1">
        <div class="ftco-cover-1" style="background-image: url('');">
            <div class="container">
              <div class="row align-items-center justify-content-center">
                <div class="col-lg-6 text-center">
                  <h1>B.T.S</h1>
                  <p>부산에 미치다</p>
                  
                </div>
              </div>
            </div>
        </div>
      </div>
    

      <div class="site-section">
      <div class="container">
      
        <div class="row align-items-stretch">
        
          
          
          
          <!-- 여기서부터 사진 시작 -->
          	<%
          	
          	int num = pageVo.getNum();
		  	int curPos = pageVo.getCurPos();
		  	
          	for(int i=0; i<pageVo.getPageSize();i++){ 
          		if(num<1) break;
          		TourplaceDTO dto=list.get(curPos++); //0, 5, 10, 15
		  		num--;
			%>
			
			
			<!-- 여기서 받아와야 하는거 장소번호, 장소이름, 장소메인이미지 -->
				<div class="col-lg-3 col-md-6 mb-5">
		            <div class="post-entry-1 h-100">
		              <!-- <a href="single.html"> -->
		                <a href="tourplace_detail.jsp?no=<%=dto.getPlaceNo()%>" name ="title"> <img src="<%=dto.getImagemain() %>" alt="Image"
		                 class="img-fluid" ></a>
		              <!-- </a> -->
		              <div class="post-entry-1-contents">
		                <span class="meta1" style="color: blue"><%=dto.getPlacetitle() %></span>
		                <a href="tourplace_detail.jsp?no=<%=dto.getPlaceNo()%>" name ="title"><h2><%=dto.getPlaceName() %></h2></a>
		                <p class="my-3"><a href="tourplace_detail.jsp?no=<%=dto.getPlaceNo()%>" class="more-39291">자세히 보기</a></p>
		              </div>
		            </div>
		        </div>
		        
			<%} %>




			<div class="col-12">
				<form name="frmSearch" method="post" action='kimbloom.jsp'>
					<select name="searchCondition">
						<option value="placeName" <%if ("placeName".equals(condition)) {%>
							selected="selected" <%}%>>명소</option>
						<option value="placeName" <%if ("placeName".equals(condition)) {%>
							selected="selected" <%}%>>맛집</option>
					</select> <input type="text" name="searchKeyword" title="검색어 입력"
						value="<%=keyword%>"> <input type="submit" value="검색">
				</form>
			</div>




			


					<!-- 페이징 처리 -->
          
          <div class="col-12">
          
					<!-- 페이지 번호 추가 -->		
			<!-- 이전 블럭으로 이동 -->
				<%
				if (pageVo.getFirstPage() > 1) {
				%>
					<a href="kimbloom.jsp?currentPage=<%=pageVo.getFirstPage() - 1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
						<img src="../images/first.JPG" alt="이전 블럭으로">
					</a>
				<%}//if %>
									
									
				<!-- [1][2][3][4][5][6][7][8][9][10] -->
				<%for(int i=pageVo.getFirstPage();i<=pageVo.getLastPage();i++){
						if(i>pageVo.getTotalPage()) break;
						
						if(i == currentPage){%>
							<span style="color:#eee;font-weight: bold"><%=i %></span>
						<%}else{ %>
							<a href	="kimbloom.jsp?currentPage=<%=i%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>"><%=i %></a>
						<%}//if %>	
				<%}//for %>
				
				<!-- 다음 블럭으로 이동 -->
				<%if(pageVo.getLastPage() < pageVo.getTotalPage()){ %>
					<a href="kimbloom.jsp?currentPage=<%=pageVo.getLastPage()+1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
						<img src="../images/last.JPG" alt="다음 블럭으로">
					</a>
				<%}//if %>
				<!--  페이지 번호 끝 -->
          </div>
        </div>
      </div>
    </div>
    

    

    
<!-- 여기 푸터 -->
    
    <footer class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <div class="row">
              <div class="col-md-7">
                <h2 class="footer-heading mb-4">About Us</h2>
                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>

              </div>
              <div class="col-md-4 ml-auto">
                <h2 class="footer-heading mb-4">Features</h2>
                <ul class="list-unstyled">
                  <li><a href="#">About Us</a></li>
                  <li><a href="#">Testimonials</a></li>
                  <li><a href="#">Terms of Service</a></li>
                  <li><a href="#">Privacy</a></li>
                  <li><a href="#">Contact Us</a></li>
                </ul>
              </div>

            </div>
          </div>
          <div class="col-md-4 ml-auto">

            <div class="mb-5">
              <h2 class="footer-heading mb-4">Subscribe to Newsletter</h2>
              <form action="#" method="post" class="footer-suscribe-form">
                <div class="input-group mb-3">
                  <input type="text" class="form-control border-secondary text-white bg-transparent" placeholder="Enter Email" aria-label="Enter Email" aria-describedby="button-addon2">
                  <div class="input-group-append">
                    <button class="btn btn-primary text-white" type="button" id="button-addon2">Subscribe</button>
                  </div>
                </div>
            </div>


            <h2 class="footer-heading mb-4">Follow Us</h2>
            <a href="#about-section" class="smoothscroll pl-0 pr-3"><span class="icon-facebook"></span></a>
            <a href="#" class="pl-3 pr-3"><span class="icon-twitter"></span></a>
            <a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
            <a href="#" class="pl-3 pr-3"><span class="icon-linkedin"></span></a>
            </form>
          </div>
        </div>
        <div class="row pt-5 mt-5 text-center">
          <div class="col-md-12">
            <div class="border-top pt-5">
              <p>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart text-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </p>
            </div>
          </div>

        </div>
      </div>
    </footer>

    </div>

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="js/jquery.animateNumber.min.js"></script>
    <script src="js/jquery.fancybox.min.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <script src="js/aos.js"></script>

    <script src="js/main.js"></script>

  </body>

</html>

