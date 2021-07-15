<%@page import="semi_bts.tourplace.model.TourplaceService"%>
<%@page import="semi_bts.common.PagingVO"%>
<%@page import="semi_bts.tourplace.model.TourplaceDTO"%>
<%@page import="java.util.List"%>
<%@page import="semi_bts.tourplace.model.TourplaceDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	request.setCharacterEncoding("utf-8");
	String no = request.getParameter("no");
	if(no==null || no.isEmpty()){%>
	<script type="text/javascript">
		alert("잘못된 url입니다.");
		location.href="kimbloom.jsp";
	</script>
	<%	return;
	}
		
	TourplaceService tpService = new TourplaceService();
	
	TourplaceDTO dto =null;
	
	try{
		dto = tpService.selectByNo(Integer.parseInt(no));
		
	}catch(SQLException e){
		e.printStackTrace();
	}

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
                <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
                  <li><a href="index.html" class="nav-link">Home</a></li>
                  <li><a href="project.html" class="nav-link">여행지</a></li>
                  <li><a href="services.html" class="nav-link">여행일정</a></li>
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
              <nav class="site-navigation text-left mr-auto " role="navigation">
                <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
                  <li class="active"><a href="blog.html" class="nav-link">커뮤니티</a></li>
                  <li><a href="contact.html" class="nav-link">마이페이지</a></li>
                </ul>
              </nav>
            </div>
            

          </div>
        </div>

      </header>
<!-- 헤더 끝 -->
    
    
     <div class="site-section ">
      
      
      <!-- 메인 사진 -->
      <div class="container site-section">
        <div class="row align-items-stretch feature-2">
          <div class="col-lg-9 feature-2-img">
            <img src="<%=dto.getImageURL() %>" alt="Image" class="img-fluid">
          </div>
          <div class="col-lg-3 feature-2-contents pl-lg-5">
            <div class="fixed-content">
              <span class="caption">메인 사진 01.</span>
              <h2 class="heading-39291"><%=dto.getPlaceName()%></h2>
              <p><%=dto.getPlacetitle()%></p>
               
            </div>
          </div>
        </div>
      </div>




		<!-- 해당 장소 -->
      <div class="container site-section">
        <div class="row align-items-stretch feature-2">
          <div class="col-lg-9 feature-2-img order-lg-2">
            <div id="map" style="width:100%;height:350px;"></div>
          </div>
          <div class="col-lg-3 feature-2-contents pr-lg-5">
            <div class="fixed-content">
              <span class="caption">해당 위치 02.</span>
              <h2 class="heading-39291">지도보여주기</h2>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus eaque laborum animi fugiat, suscipit in.</p>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est vitae magni impedit cum laudantium, voluptas.</p>
            </div>
          </div>
        </div>
      </div>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dada66d654e8d6374c1a8474988e6d6"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(<%=dto.getLatitude()%>, <%=dto.getLongitude()%>), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
			
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			var markerPosition  = new kakao.maps.LatLng(<%=dto.getLatitude()%>, <%=dto.getLongitude()%>); 
			
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
			
			marker.setMap(map);
			
		</script>



		<!-- 여행지 상세 정보 -->

      <div class="container site-section">
        <div class="row align-items-stretch feature-2">
          <div class="col-lg-9 feature-2-img">
          	<p> 주소 : <%=dto.getPlaceAddress() %></p> <hr>
          	<p> 전화번호 :  <%=dto.getPlaceTel() %></p> <hr>
          	<p> 홈페이지 : <%=dto.getHomepage() %></p> <hr>
            <p><%=dto.getPlaceInfo() %></p> <hr>
            
          </div>
          <div class="col-lg-3 feature-2-contents pl-lg-5">
            <div class="fixed-content">
              <span class="caption">여행지 상세정보 03.</span>
              <h2 class="heading-39291">Consectetur elit</h2>
              <p> 주소, 전화번호, 홈페이지, 상세 정보 순서</p>
              <p> </p>
            </div>
          </div>
        </div>
      </div>




		<!-- 댓글 -->
      <div class="container site-section">
        <div class="row align-items-stretch feature-2">
          <div class="col-lg-9 feature-2-img order-lg-2">
           	<p>여기다가 댓글 리스트 뿌려주기</p>
          </div>
          <div class="col-lg-3 feature-2-contents pr-lg-5">
            <div class="fixed-content">
              <span class="caption">댓글 04.</span>
              <h2 class="heading-39291">laudantium voluptas</h2>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus eaque laborum animi fugiat, suscipit in.</p>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est vitae magni impedit cum laudantium, voluptas.</p>
            </div>
          </div>
        </div>
      </div>
	
	
	    <div class="container site-section">
        <div class="row align-items-stretch feature-2">
          <div class="col-lg-9 feature-2-img order-lg-2">
          
          <!-- 댓글 작성 칸 -->
          
             <form action="#" method="post">
              <div class="form-group row">
                <div class="col-md-6 mb-4 mb-lg-0">
                  <input type="text" class="form-control" placeholder="이름">
                </div>
                <div class="col-md-6">
                  <input type="password" class="form-control" placeholder="비밀번호">
                </div>
              </div>


              <div class="form-group row">
                <div class="col-md-12">
                  <textarea name="" id="" class="form-control" placeholder="여러분의 생각을 적어주세요" cols="30" rows="10"></textarea>
                </div>
              </div>
              <div class="form-group row">
                <div class="col-md-6 mr-auto">
                  <input type="submit" class="btn btn-block btn-primary text-white py-3 px-5" value="댓글 작성">
                </div>
              </div>
            </form>
          </div>
          <div class="col-lg-3 feature-2-contents pr-lg-5">
            <div class="fixed-content">
              <span class="caption">댓글 작성 칸 05.</span>
              <h2 class="heading-39291">laudantium voluptas</h2>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus eaque laborum animi fugiat, suscipit in.</p>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est vitae magni impedit cum laudantium, voluptas.</p>
            </div>
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

