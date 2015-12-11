<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.Timestamp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<!-- start: Meta -->
<meta charset="utf-8">
<title>GotYA FREE BOOTSTRAP THEME by BootstrapMaster</title>
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
	function check1(frm) {
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

					<a class="brand" href="sol_index.jsp"><img
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
			              			<li><a href="sol_study/lectureList.do">학습하기</a></li>
									<li><a href="sol_test/list.do">문제풀기</a></li>
									<li><a href="sol_bbs/bbsList.jsp">자유게시판</a></li>
									<li><a href="sol_mypage/intro.jsp">내정보</a></li>
									<li><a href="sol_total/total.jsp">전체보기</a></li>

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
		%>

	<!-- 하나)로그인 페이지 -->
		<div align="right"
			style="background-color: grey; color: white; margin: 0; padding-top: 1%;">
			<div class="row">

				<table>
					<tr>
						<td style="height: 30px;">
							<form class="form-inline" method="post" action="login.do">
								<div class="form-group">
									<input type="text" name="id" size="10" value="<%=c_id%>" /> <input
										type="password" name="passwd" size="10" value="" /> <input
										type="checkbox" name="c_id" value="SAVE"
										<%if (!c_id.isEmpty()) {
					out.print("checked");
				}%> />ID저장
									<input type="button" name="login" class="btn btn-primary"
										value="로그인" onclick="check1(this.form)" />
								</div>
							</form>
						</td>
						<td>
							<form class="form-inline" action="joinagree.do">
								<button type="submit" class="btn btn-primary">회원가입</button>
							</form>
						</td>
						<td>
							<form class="form-inline" method="post" action="findform.do">
								<button type="submit" class="btn btn-primary">ID/PW찾기</button>
							</form>
						</td>
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
							<form class="form-inline" method="post" action="logout.do">
								${s_id }님 환영합니다. <input type="button" name="logout"
									class="btn btn-primary" value="로그아웃"
									onclick="check2(this.form)" />
							</form>
						</td>
						<td>
							<form class="form-inline" method="post" action="update.do">
								<input type="hidden" name="id" value="${s_id }" /> <input
									type="button" name="update" class="btn btn-primary"
									value="정보수정" onclick="check3(this.form)" />
							</form>
						</td>
					</tr>
				</table>

			</div>
		</div>

	</c:if>
	index.do페이지




	<!-- start: Slider -->
	<div class="slider-wrapper">

		<div id="da-slider" class="da-slider">
			<div class="da-slide">
				<h2>Twitter Bootstrap</h2>
				<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed
					diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam
					erat volutpat.</p>
				<a href="#" class="da-link">Read more</a>
				<div class="da-img">
					<img src="sol_img/parallax-slider/twitter.png" alt="image01" />
				</div>
			</div>
			<div class="da-slide">
				<h2>Responsive Design</h2>
				<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed
					diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam
					erat volutpat.</p>
				<a href="#" class="da-link">Read more</a>
				<div class="da-img">
					<img src="sol_img/parallax-slider/responsive.png" alt="image02" />
				</div>
			</div>
			<div class="da-slide">
				<h2>HTML5</h2>
				<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed
					diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam
					erat volutpat.</p>
				<a href="#" class="da-link">Read more</a>
				<div class="da-img">
					<img src="sol_img/parallax-slider/html5.png" alt="image03" />
				</div>
			</div>
			<div class="da-slide">
				<h2>CSS3</h2>
				<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed
					diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam
					erat volutpat.</p>
				<a href="#" class="da-link">Read more</a>
				<div class="da-img">
					<img src="sol_img/parallax-slider/css3.png" alt="image04" />
				</div>
			</div>
			<nav class="da-arrows">
				<span class="da-arrows-prev"></span> <span class="da-arrows-next"></span>
			</nav>
		</div>

	</div>
	<!-- end: Slider -->

	<!--start: Wrapper-->
	<div id="wrapper">

		<!--start: Container -->
		<div class="container">

			<!-- start: Hero Unit - Main hero unit for a primary marketing message or call to action -->
			<div class="hero-unit">
				<p>This is a template for a simple marketing or informational
					website. It includes a large callout called the hero unit and three
					supporting pieces of content. Use it as a starting point to create
					something more unique.</p>
				<p>
					<a class="btn btn-success btn-large">Learn more &raquo;</a>
				</p>
			</div>
			<!-- end: Hero Unit -->

			<!-- start: Row -->
			<div class="row">

				<div class="span4">
					<div class="icons-box">
						<i class="ico-ok circle big"></i>
						<div class="title">
							<h3>Easy to use</h3>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
							sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
							aliquam erat volutpat.</p>
						<div class="clear"></div>
					</div>
				</div>

				<div class="span4">
					<div class="icons-box">
						<i class="ico-ipad circle big"></i>
						<div class="title">
							<h3>Responsive</h3>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
							sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
							aliquam erat volutpat.</p>
						<div class="clear"></div>
					</div>
				</div>

				<div class="span4">
					<div class="icons-box">
						<i class="ico-heart circle big"></i>
						<div class="title">
							<h3>User friendly</h3>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
							sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
							aliquam erat volutpat.</p>
						<div class="clear"></div>
					</div>
				</div>

			</div>
			<!-- end: Row -->

			<hr>

			<!-- start Clients List -->
			<div class="clients-carousel">

				<ul class="slides clients">
					<li><img src="sol_img/logos/1.png" alt="" /></li>
					<li><img src="sol_img/logos/2.png" alt="" /></li>
					<li><img src="sol_img/logos/3.png" alt="" /></li>
					<li><img src="sol_img/logos/4.png" alt="" /></li>
					<li><img src="sol_img/logos/5.png" alt="" /></li>
					<li><img src="sol_img/logos/6.png" alt="" /></li>
					<li><img src="sol_img/logos/7.png" alt="" /></li>
					<li><img src="sol_img/logos/8.png" alt="" /></li>
					<li><img src="sol_img/logos/9.png" alt="" /></li>
					<li><img src="sol_img/logos/10.png" alt="" /></li>
				</ul>

			</div>
			<!-- end Clients List -->

			<hr>

			<!-- start: Row -->
			<div class="row">

				<!-- start: Icon Boxes -->
				<div class="icons-box-vert-container">

					<!-- start: Icon Box Start -->
					<div class="span6">
						<div class="icons-box-vert">
							<i class="ico-ok ico-color circle-color big"></i>
							<div class="icons-box-vert-info">
								<h3>Easy to use</h3>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
									sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
									aliquam erat volutpat.</p>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<!-- end: Icon Box-->

					<!-- start: Icon Box Start -->
					<div class="span6">
						<div class="icons-box-vert">
							<i class="ico-cup  ico-white circle-color-full big-color"></i>
							<div class="icons-box-vert-info">
								<h3>Best choice</h3>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
									sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
									aliquam erat volutpat.</p>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<!-- end: Icon Box -->

					<!-- start: Icon Box Start -->
					<div class="span6">
						<div class="icons-box-vert">
							<i class="ico-ipad ico-color circle-color big"></i>
							<div class="icons-box-vert-info">
								<h3>Fully Responsive</h3>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
									sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
									aliquam erat volutpat.</p>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<!-- end: Icon Box -->

					<!-- start: Icon Box Start -->
					<div class="span6">
						<div class="icons-box-vert">
							<i class="ico-thumbs-up  ico-white circle-color-full big-color"></i>
							<div class="icons-box-vert-info">
								<h3>Social Network</h3>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
									sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
									aliquam erat volutpat.</p>
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

							<li><a href="sol_index.jsp">Start</a></li>

							<li><a href="sol_about.jsp">About</a></li>

							<li><a href="sol_services.jsp">Services</a></li>

							<li><a href="sol_pricing.jsp">Pricing</a></li>

							<li><a href="sol_contact.jsp">Contact</a></li>

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
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
						sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
						aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud
						exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea
						commodo consequat.</p>

				</div>
				<!-- end: About -->

				<!-- start: Photo Stream -->
				<div class="span3">

					<h3>We are here!</h3>
					<div id="small-map-container">
						<a href="contact.jsp"></a>
					</div>
					<iframe id="small-map" width="210" height="210" frameborder="0"
						scrolling="yes" marginheight="0" marginwidth="0"
						src="https://maps.google.pl/maps?f=q&amp;source=s_q&amp;hl=pl&amp;geocode=&amp;q=Los+Angeles,+Kalifornia,+Stany+Zjednoczone&amp;aq=0&amp;oq=Los&amp;sll=50.143066,18.85267&amp;sspn=0.057207,0.168915&amp;t=m&amp;ie=UTF8&amp;hq=&amp;hnear=Los+Angeles,+Hrabstwo+Los+Angeles,+Kalifornia,+Stany+Zjednoczone&amp;ll=34.052234,-118.243685&amp;spn=0.036979,0.084457&amp;z=14&amp;iwloc=near&amp;output=embed"></iframe>

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
										<div class="social-info-front social-twitter">
											<a href="http://twitter.com"></a>
										</div>
										<div class="social-info-back social-twitter-hover">
											<a href="http://twitter.com"></a>
										</div>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="social-item">
								<div class="social-info-wrap">
									<div class="social-info">
										<div class="social-info-front social-facebook">
											<a href="http://facebook.com"></a>
										</div>
										<div class="social-info-back social-facebook-hover">
											<a href="http://facebook.com"></a>
										</div>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="social-item">
								<div class="social-info-wrap">
									<div class="social-info">
										<div class="social-info-front social-dribbble">
											<a href="http://dribbble.com"></a>
										</div>
										<div class="social-info-back social-dribbble-hover">
											<a href="http://dribbble.com"></a>
										</div>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="social-item">
								<div class="social-info-wrap">
									<div class="social-info">
										<div class="social-info-front social-flickr">
											<a href="http://flickr.com"></a>
										</div>
										<div class="social-info-back social-flickr-hover">
											<a href="http://flickr.com"></a>
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul>
					<!-- end: Follow Us -->

					<!-- start: Newsletter -->
					<form id="newsletter">
						<h3>Newsletter</h3>
						<p>Please leave us your email</p>
						<label for="newsletter_input">@:</label> <input type="text"
							id="newsletter_input" /> <input type="submit"
							id="newsletter_submit" value="submit">
					</form>
					<!-- end: Newsletter -->

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
				&copy; 2013, creativeLabs. <a href="http://bootstrapmaster.com"
					alt="Bootstrap Themes">Bootstrap Themes</a> designed by
				BootstrapMaster in Poland <img src="img/poland2.png" alt="Poland"
					style="margin-top: -4px">
			</p>

		</div>
		<!-- end: Container  -->

	</div>
	<!-- end: Copyright -->

	<!-- start: Java Script -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="sol_js/jquery-1.8.2.js"></script>
	<script src="sol_js/bootstrap.js"></script>
	<script src="sol_js/flexslider.js"></script>
	<script src="sol_js/carousel.js"></script>
	<script src="sol_js/jquery.cslider.js"></script>
	<script src="sol_js/slider.js"></script>
	<script defer="defer" src="sol_js/custom.js"></script>
	<!-- end: Java Script -->

</body>
</html>