<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

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
<link href="../sol_css/bootstrap.css" rel="stylesheet">
<link href="../sol_css/bootstrap-responsive.css" rel="stylesheet">
<link href="../sol_css/style.css" rel="stylesheet">
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

					<a class="brand" href="../sol_index.do"><img
						src="../sol_img/logo.png" alt="Logo"></a>

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
			            <li><a href="../sol_study/lectureList.do">학습하기</a></li>
									<li><a href="../sol_test/test/list.do">문제풀기</a></li>
									<li><a href="../sol_bbs/bbslist.do">자유게시판</a></li>
									<li><a href="../sol_qna/list.do">Q&A</a></li>
									<li><a href="../sol_mypage/calendar.do?s_id=${s_id}">내정보</a></li>
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
	
	
	<!-- 하나)로그인 추가 -->

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

		<div align="right"
			style="background-color: grey; color: white; margin: 0; padding-top: 1%;">
			<div class="row">

				<table>
					<tr>
						<td>
							<form class="form-inline" method="post" action="../sol_member/login.do">

								<div class="form-group">
									<input type="text" name="id" size="10" value="<%=c_id%>" /> <input
										type="password" name="passwd" size="10" value="" /> <input
										type="checkbox" name="c_id" value="SAVE"
										<%if (!c_id.isEmpty()) {
					out.print("checked");
				}%> />ID저장 <input
										type="button" name="login" class="btn btn-primary" value="로그인"
										onclick="check1(this.form)" />
								</div>

							</form>
						</td>
						<td>
							<form class="form-inline" action="../sol_member/joinagree.do">
								<button type="submit" class="btn btn-primary">회원가입</button>
							</form>
						</td>
						<td>
							<form class="form-inline" method="post" action="../sol_member/findform.do">
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
							<form class="form-inline" method="post" action="../sol_member/logout.do">
								${s_id }님 환영합니다. <input type="button" name="logout"
									class="btn btn-primary" value="로그아웃"
									onclick="check2(this.form)" />
							</form>
						</td>
						<td>
							<form class="form-inline" method="post" action="../sol_member/update.do">
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

	<!--start: Wrapper-->
	<div id="wrapper">

		<!--start: Container -->
		<div class="container">