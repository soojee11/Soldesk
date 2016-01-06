<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.Timestamp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<!-- start : 지식채널 e 화면 띄우기 -->
<script>
  function chanelE() {//아이디중복확인
    var sx = parseInt(screen.width);//팝업창 나타내는 위치
    var sy = parseInt(screen.height);
    var x = (sx / 2) - 400;
    var y = (sy / 2) - 300;

    var win = window.open("http://home.ebs.co.kr/jisike/index", "", "width=900, height=700");
    win.moveTo(x, y);//화면이동
  }//end
 </script>
 
<!-- end : 지식채널 e 화면 띄우기 -->
<!--  한글 웹 폰트 적용-->
		<link rel='stylesheet' href='http://fonts.googleapis.com/earlyaccess/jejugothic.css'>
		<style type="text/css">
		header, .hero-unit{
		  font-family:'Jeju Gothic', sans-serif;
		  font-size:20pt;
		}
		
		.icons-box-vert-info{
      font-family:'Jeju Gothic', sans-serif;
      font-size:12pt;
    }
    
    .button, input{
        font-family:'Jeju Gothic', sans-serif;
        font-size:11pt;
    }
    
    div, p{
        font-family:'Jeju Gothic', sans-serif;
        font-size:10pt;
    }
		</style>
<!-- 한글 웹 폰트 적용 끝 -->

<!-- start: video script -->
	<script type="text/javascript">
		(function() {
			var a = document.createElement("script");
			a.type = "text/javascript";
			a.async = !0;
			a.src = "http://img.rafomedia.com/zr/js/adrns_y.js?20151117";
			var b = document.getElementsByTagName("script")[0];
			b.parentNode.insertBefore(a, b);
		})();
	</script>
<!-- end: video script -->

<!-- start: Meta -->
<meta charset="utf-8">
<title>SOLPROJECT</title>
<meta name="description" content="GotYa Free Bootstrap Theme" />
<meta name="keywords"
	content="Template, Theme, web, html5, css3, Bootstrap" />
<meta name="author" content="Åukasz Holeczek from creativeLabs" />
<!-- end: Meta -->

<!-- start: Mobile Specific -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- end: Mobile Specific -->

<!-- start: Facebook Open Graph -->
<meta property="og:title" content="" />
<meta property="og:description" content="" />
<meta property="og:type" content="" />
<meta property="og:url" content="" />
<meta property="og:image" content="" />
<!-- end: Facebook Open Graph -->

<!-- start: CSS -->
<link href="sol_css/bootstrap.css" rel="stylesheet">
<link href="sol_css/bootstrap-responsive.css" rel="stylesheet">
<link href="sol_css/style.css" rel="stylesheet">
<link href="sol_css/video.css" rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Droid+Sans:400,700">
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Droid+Serif">
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Boogaloo">
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Economica:700,400italic">
<!-- end: CSS -->

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    

<!-- 하나)로그인추가 -->
<script language="javascript">
	function check1(frm, file) {
		var id = frm.id.value;
		var passwd = frm.passwd.value;
		id = id.replace(/^\s*|\s*$/g, '');
		passwd = passwd.replace(/^\s*|\s*$/g, '');
		if (id.length <= 0) {
			alert('아이디을 입력해주세요.');
			frm.id.focus();
			return;
		}

		if (passwd.length <= 0) {
			alert('비밀번호를 입력해주세요.');
			frm.passwd.focus();
			return;
		}
		frm.action = file;
		frm.submit();
	}//end

	function check2(frm) {
		var mess = "로그아웃을 하시겠습니까?";
		if (confirm(mess)) {
			frm.submit();
			return;
		}
	}//end

	function check3(frm) {
		var mess = "정보수정을 하시겠습니까?";
		if (confirm(mess)) {
			frm.submit();
			return;
		}
	}//end
	
	function joinagree(frm,file){
	    frm.action=file;
	}
	
	function find(frm, file){
		  frm.action=file;
	}
</script>

</head>
<body>

	<!--start: Header -->
	<header>

		<!--start: Container -->
		<div class="container">

			<!--start: Row -->
			<div class="row">

				<!--start: Logo -->
				<div class="logo span3">

					<a class="brand" href="sol_index.do"><img
						src="sol_img/logo.png" alt="Logo"></a>

				</div>
				<!--end: Logo -->

				<!--start: Navigation -->
				<div class="span9">

					<div class="navbar navbar-inverse">
			    		<div class="navbar-inner">
			          		<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
			            		<span class="icon-bar"></span>
			            		<span class="icon-bar"></span>
			            		<span class="icon-bar"></span>
			          		</a>
			          		<div class="nav-collapse collapse">
			            		<ul class="nav">
			              			<li><a href="sol_study/lectureInfo.do">학습하기</a></li>
													<li><a href="sol_test/test/list.do">문제풀기</a></li>
													<li><a href="sol_bbs/bbslist.do">자유게시판</a></li>
													<li><a href="sol_qna/list.do">Q&A</a></li>
													<li><a href="sol_mypage/calendar.do?s_id=${s_id}">캘린더</a></li>
								</ul>
							</div>
						</div>
					</div>

				</div>
				<!--end: Navigation -->

			</div>
			<!--end: Row -->

		</div>
		<!--end: Container-->

	</header>
	<!--end: Header-->


	<!-- 하나)로그인 쿠키저장 -->
	<c:if test="${empty s_id || s_id == 'guest'}">
		<%
			// 사용자  pc에 저장된 쿠키값 가져오기
				Cookie[] cookies = request.getCookies();
				String c_id = "";
				if (cookies != null) {//쿠키가 존재한다면
					for (int i = 0; i < cookies.length; i++) {
						Cookie item = cookies[i];//쿠키 1개 가져오기
						if (item.getName().equals("c_id") == true) { //쿠키변수c_id
							c_id = item.getValue(); //쿠키값 가져오기
						}
					}
				}
				System.out.print("쿠키값= "+c_id);
		%>

	<!-- 하나)로그인 페이지 -->
		<div align="right"
			style="background-color: grey; color: white; margin: 0; padding-top: 1%;">
			<div class="row">

				<table>
					<tr>
						<td>
								<div class="form-group">
								<form class="form-inline" method="post">
								    <input type="hidden" name="whichPage" value="${whichPage }">
										<input type="text" name="id" value="<%=c_id%>" placeholder="ID" style="height: 30px" "/> 
										<input type="password" name="passwd" placeholder="Password" value="" style="height: 30px"/> 
										<input type="checkbox" name="c_id" value="SAVE"
											<%if (!c_id.isEmpty()) {
													out.print("checked");
												}%> />ID저장 ${whichPage }
										<input type="button" name="login" class="btn btn-primary button"
											value="로그인" onclick="check1(this.form, 'sol_member/login.do')" />
										<button type="submit" class="btn btn-primary button" onclick="joinagree(this.form,'sol_member/joinagree.do')">회원가입</button>
										<button type="submit" class="btn btn-primary button" onclick="find(this.form,'sol_member/findform.do')">ID/PW찾기</button>
									</form>
								</div>
						</td>
<!-- 						<td>
							
						</td>
						<td>
							
						</td> -->
					</tr>
				</table>

			</div>
		</div>

	</c:if>

	<c:if test="${s_id != null && s_id != 'guest'}">

		<div align="right"
			style="background-color: grey; color: white; margin: 0; padding-top: 1%;">
			<div class="row">

				<table>
					<tr>
						<td>
							<form class="form-inline" method="post" action="sol_member/logout.do">
								${s_id }님 환영합니다. <input type="button" name="logout"
									class="btn btn-primary button" value="로그아웃"
									onclick="check2(this.form)" />
							</form>
						</td>
						<td>
							<form class="form-inline" method="post" action="sol_member/update.do">
								<input type="hidden" name="id" value="${s_id }" /> <input
									type="button" name="update" class="btn btn-primary button"
									value="정보수정" onclick="check3(this.form)" />
							</form>
						</td>
					</tr>
				</table>
			</div>
		</div>

	</c:if>
  <!-- start : Video Player -->
		  <!--start: Wrapper-->
		  <div id="wrapper" >
				 <div class="videoContainer" >
				    <video id="myVideo" controls preload="auto" autoplay="autoplay" width="100%" 
				           style="max-height: 400px; min-width:40%;" align="center">
				      <source src="sol_video/${link }" type="video/mp4" />
				      <p>video tag를 지원하지 않는 브라우저입니다..</p>
				    </video>
				    <div class="caption">${title }</div>
				    <div class="control">
				      <div class="btmControl">
				        <div class="btnPlay btn" title="Play/Pause video"><span class="icon-play"></span></div>
				        <div class="progress-bar">
				          <div class="progress">
				            <span class="bufferBar"></span>
				            <span class="timeBar"></span>
				          </div>
				        </div>
				        <!--<div class="volume" title="Set volume">
				          <span class="volumeBar"></span>
				        </div>-->
				        <div class="sound sound2 btn" title="Mute/Unmute sound"><span class="icon-sound"></span></div>
				        <div class="btnFS btn" title="Switch to full screen"><span class="icon-fullscreen"></span></div>
				      </div>
				      
				    </div>
				  </div>
				</div>
		  <!--end: Wrapper-->
		   
  <!-- end : Video Player -->
  
	<!--start: Wrapper-->
	<div id="wrapper">

		<!--start: Container -->
		<div class="container">

			<!-- start: Hero Unit - Main hero unit for a primary marketing message or call to action -->
			<div class="hero-unit">
			  <p> 하루 한 번! 지식채널 </p>
				<p> 더 많은 지식채널을 보고싶다면 이곳을 방문해보세요~</p>
				<p>
					<a class="btn btn-success btn-large" href="javascript:chanelE()">방문하기 &raquo;</a>
				</p>
			</div>
			<!-- end: Hero Unit -->

			<hr>

			<!-- start: Row -->
			<div class="row">

				<!-- start: Icon Boxes -->
				<div class="icons-box-vert-container">

					<!-- start: Icon Box Start -->
					<div class="span4">
						<div class="icons-box-vert">
							<i class="ico-ok ico-color circle-color big"></i>
							<div class="icons-box-vert-info">
								<p style="font-size: 15pt">1학년</p><br/>
								<p><a href="sol_study/lectureInfo.do?grade=1&gwamok=국어">국어</a> 
								   <a href="sol_study/lectureInfo.do?grade=1&gwamok=수학">수학</a>  
								   <a href="sol_study/lectureInfo.do?grade=1&gwamok=사회">사회</a> 
								   <a href="sol_study/lectureInfo.do?grade=1&gwamok=과학">과학</a></p>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<!-- end: Icon Box-->

					<!-- start: Icon Box Start -->
					<div class="span4">
						<div class="icons-box-vert">
							<i class="ico-cup  ico-white circle-color-full big-color"></i>
							<div class="icons-box-vert-info">
								<p style="font-size: 15pt">2학년</p><br/>
                <p><a href="sol_study/lectureInfo.do?grade=2&gwamok=국어">국어</a> 
                   <a href="sol_study/lectureInfo.do?grade=2&gwamok=수학">수학</a>  
                   <a href="sol_study/lectureInfo.do?grade=2&gwamok=사회">사회</a> 
                   <a href="sol_study/lectureInfo.do?grade=2&gwamok=과학">과학</a></p>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<!-- end: Icon Box -->

					<!-- start: Icon Box Start -->
					<div class="span4">
						<div class="icons-box-vert">
							<i class="ico-ipad ico-color circle-color big"></i>
							<div class="icons-box-vert-info">
								<p style="font-size: 15pt">3학년</p><br/>
                <p><a href="sol_study/lectureInfo.do?grade=3&gwamok=국어">국어</a> 
                   <a href="sol_study/lectureInfo.do?grade=3&gwamok=수학">수학</a>  
                   <a href="sol_study/lectureInfo.do?grade=3&gwamok=사회">사회</a> 
                   <a href="sol_study/lectureInfo.do?grade=3&gwamok=과학">과학</a></p>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<!-- end: Icon Box -->

					<!-- start: Icon Box Start -->
					<div class="span4">
						<div class="icons-box-vert">
							<i class="ico-thumbs-up  ico-white circle-color-full big-color"></i>
							<div class="icons-box-vert-info">
								<p style="font-size: 15pt">4학년</p><br/>
                <p><a href="sol_study/lectureInfo.do?grade=4&gwamok=국어">국어</a> 
                   <a href="sol_study/lectureInfo.do?grade=4&gwamok=수학">수학</a>  
                   <a href="sol_study/lectureInfo.do?grade=4&gwamok=사회">사회</a> 
                   <a href="sol_study/lectureInfo.do?grade=4&gwamok=과학">과학</a></p>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<!-- end: Icon Box -->
					
					<!-- start: Icon Box Start -->
          <div class="span4">
            <div class="icons-box-vert">
              <i class="ico-ipad ico-color circle-color big"></i>
              <div class="icons-box-vert-info">
                <p style="font-size: 15pt">5학년</p><br/>
                <p><a href="sol_study/lectureInfo.do?grade=5&gwamok=국어">국어</a> 
                   <a href="sol_study/lectureInfo.do?grade=5&gwamok=수학">수학</a>  
                   <a href="sol_study/lectureInfo.do?grade=5&gwamok=사회">사회</a> 
                   <a href="sol_study/lectureInfo.do?grade=5&gwamok=과학">과학</a></p>
              </div>
              <div class="clear"></div>
            </div>
          </div>
          <!-- end: Icon Box -->

          <!-- start: Icon Box Start -->
          <div class="span4">
            <div class="icons-box-vert">
              <i class="ico-thumbs-up  ico-white circle-color-full big-color"></i>
              <div class="icons-box-vert-info">
                <p style="font-size: 15pt">6학년</p><br/>
                <p><a href="sol_study/lectureInfo.do?grade=6&gwamok=국어">국어</a> 
                   <a href="sol_study/lectureInfo.do?grade=6&gwamok=수학">수학</a>  
                   <a href="sol_study/lectureInfo.do?grade=6&gwamok=사회">사회</a> 
                   <a href="sol_study/lectureInfo.do?grade=6&gwamok=과학">과학</a></p>
              </div>
              <div class="clear"></div>
            </div>
          </div>
          <!-- end: Icon Box -->

				</div>
				<!-- end: Icon Boxes -->
				<div class="clear"></div>
			</div>
			<!-- end: Row -->

			<hr>
			
			<!-- start Clients List -->
			   <div class="hero-unit">
          <p> 인기 강좌 선생님!! 인기 만점 선생님들과 함께 공부해 보세요 </p>
        </div>
			<div class="clients-carousel">
				<ul class="slides clients" align="center">
				   <c:forEach var="list" items="${list }">
				     <c:if test="${list.avg > 3.5 }">
					     <li><a href='sol_study/lectureInfo.do?grade=${list.grade }&gwamok=${list.gwamok }'><img src="sol_admin/player/cateStorage/${list.teacherPhoto }"/></a>
					         <br/><br/>${list.teacherName }</li>
					   </c:if>
					 </c:forEach>
				</ul>

			</div>
			<!-- end Clients List -->

		</div>
		<!--end: Container-->

	</div>
	<!-- end: Wrapper  -->

	<!-- start: Footer Menu -->
	<div id="footer-menu" class="hidden-tablet hidden-phone">

		<!-- start: Container -->
		<div class="container">

			<!-- start: Row -->
			<div class="row">

				<!-- start: Footer Menu Logo -->
				<div class="span2">
					<div id="footer-menu-logo">
						<a href="#"><img src="sol_img/logo-footer-menu.png" alt="logo" /></a>
					</div>
				</div>
				<!-- end: Footer Menu Logo -->

				<!-- start: Footer Menu Links-->
				<div class="span9">

					<div id="footer-menu-links">

						<ul id="footer-nav">

							<li><a href="sol_study/lectureList.do">학습하기</a></li>

							<li><a href="sol_test/test/list.do">문제풀기</a></li>

							<li><a href="sol_bbs/bbslist.do">자유게시판</a></li>

							<li><a href="sol_qna/list.do">Q & A</a></li>

							<li><a href="sol_mypage/calendar.do?s_id=${s_id}">캘린더</a></li>

						</ul>

					</div>

				</div>
				<!-- end: Footer Menu Links-->

				<!-- start: Footer Menu Back To Top -->
				<div class="span1">

					<div id="footer-menu-back-to-top">
						<a href="#"></a>
					</div>

				</div>
				<!-- end: Footer Menu Back To Top -->

			</div>
			<!-- end: Row -->

		</div>
		<!-- end: Container  -->

	</div>
	<!-- end: Footer Menu -->

	<!-- start: Footer -->
	<div id="footer">

		<!-- start: Container -->
		<div class="container">

			<!-- start: Row -->
			<div class="row">

				<!-- start: About -->
				<div class="span3">

					<h3>About Us</h3>
					<p>이 사이트는 2015년 솔데스크로부터 시작되어...</p>

				</div>
				<!-- end: About -->

				<!-- start: Photo Stream -->
				<div class="span3">
					<h3>We are here!</h3>
						<div id="map-canvas" style="width: 210px; height: 210px"></div>
				</div>
				<!-- end: Photo Stream -->

				<div class="span6">

					<!-- start: Follow Us -->
					<h3>Follow Us!</h3>
					<ul class="social-grid">
						<li>
              <div class="social-item">
                <div class="social-info-wrap">
                  <div class="social-info">
                    <div class="social-info-front social-dribbble-hover" style="color: white">
                      하나
                    </div>
                    <div class="social-info-back social-dribbble">
                      하나
                    </div>
                  </div>
                </div>
              </div>
            </li>
						<li>
							<div class="social-item">
								<div class="social-info-wrap">
									<div class="social-info">
										<div class="social-info-front social-html5-hover" style="color: white">
											 민경
										</div>
										<div class="social-info-back social-html5">
											민경
										</div>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="social-item">
								<div class="social-info-wrap">
									<div class="social-info">
										<div class="social-info-front social-vimeo-hover" style="color: white">
											미래
										</div>
										<div class="social-info-back social-vimeo">
											미래
										</div>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="social-item">
								<div class="social-info-wrap">
									<div class="social-info">
										<div class="social-info-front social-myspace-hover" style="color: white">
											수지
										</div>
										<div class="social-info-back social-myspace">
											수지
										</div>
									</div>
								</div>
							</div>
						</li>
						<li>
              <div class="social-item">
                <div class="social-info-wrap">
                  <div class="social-info">
                    <div class="social-info-front social-rss-hover" style="color: white">
                      혜림
                    </div>
                    <div class="social-info-back social-rss">
                      혜림
                    </div>
                  </div>
                </div>
              </div>
            </li>
					</ul>
					<!-- end: Follow Us -->

				</div>

			</div>
			<!-- end: Row -->

		</div>
		<!-- end: Container  -->

	</div>
	<!-- end: Footer -->

	<!-- start: Copyright -->
	<div id="copyright">

		<!-- start: Container -->
		<div class="container">

			<p>
				&copy; 2015, soldesk created by no.5&nbsp;&nbsp;&nbsp;<a href="javascript:showAdmin();"><strong>관리자 페이지</strong></a>
			</p>
			<script>
			function showAdmin() {//아이디중복확인
				var sx = parseInt(screen.width);//팝업창 나타내는 위치
			    var sy = parseInt(screen.height);
			    var x = (sx / 2) - 600;
			    var y = (sy / 2) - 350;
			    
			    var win = window.open("http://localhost:9090/solproject/sol_admin/login.do", "", "width=1200, height=700");
			    win.moveTo(x, y);//화면이동
			 }//end
			</script>

		</div>
		<!-- end: Container  -->

	</div>
	<!-- end: Copyright -->

	<!-- start: Java Script -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
	<script src="sol_js/jquery-1.8.2.js"></script>
	<script src="sol_js/bootstrap.js"></script>
	<script src="sol_js/flexslider.js"></script>
	<script src="sol_js/carousel.js"></script>
	<script src="sol_js/jquery.cslider.js"></script>
	<script src="sol_js/slider.js"></script>
	<script src="sol_js/video.js"></script>
	<script defer="defer" src="sol_js/custom.js"></script>
	<!-- end: Java Script -->
	
	<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
  <script type="text/javascript">
      function initialize() {
        var mapLocation = new google.maps.LatLng('37.5693255','126.9860066'); // 지도에서 가운데로 위치할 위도와 경도
        var markLocation = new google.maps.LatLng('37.5693255','126.9860066'); // 마커가 위치할 위도와 경도
         
        var mapOptions = {
          center: mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
          zoom: 18, // 지도 zoom단계
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map-canvas"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
            mapOptions);
         
        var size_x = 60; // 마커로 사용할 이미지의 가로 크기
        var size_y = 60; // 마커로 사용할 이미지의 세로 크기
         
        // 마커로 사용할 이미지 주소
        var image = new google.maps.MarkerImage( 'http://www.larva.re.kr/home/img/boximage3.png',
                            new google.maps.Size(size_x, size_y),
                            '',
                            '',
                            new google.maps.Size(size_x, size_y));
         
        var marker;
        marker = new google.maps.Marker({
               position: markLocation, // 마커가 위치할 위도와 경도(변수)
               map: map,
               icon: image, // 마커로 사용할 이미지(변수)
//             info: '말풍선 안에 들어갈 내용',
               title: '솔데스크' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
        });
         
        var content = "우리 여기있다~~"; // 말풍선 안에 들어갈 내용
         
        // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
        var infowindow = new google.maps.InfoWindow({ content: content});
 
        google.maps.event.addListener(marker, "click", function() {
            infowindow.open(map,marker);
        });
         
 
         
      }
      google.maps.event.addDomListener(window, 'load', initialize);
</script>

</body>
</html>