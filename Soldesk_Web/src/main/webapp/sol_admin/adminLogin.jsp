<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Login Page 2 | Creative - Bootstrap 3 Responsive Admin Template</title>

    <!-- Bootstrap CSS -->    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="css/elegant-icons-style.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
<meta charset="UTF-8">
<title>adminLogin.jsp</title>
<script>
	function logincheck(frm) { // 로그인 유효성 검사

		id = frm.adminid.value;
		passwd = frm.adminpw.value;

		id = id.replace(/^\s*|\s*$/g, '');
		passwd = passwd.replace(/^\s*|\s*$/g, '');

		if (id.length < 4) {
			alert("아이디를 입력해주세요.");
			frm.id.focus();
			return;
		}
		if (passwd.length < 4) {
			alert("비밀번호는 4글자 이상 입력해주세요.");
			frm.passwd.focus();
			return;
		}

		frm.submit(); // 	JavaScript가 서버로 데이터 전송

	}//end
	
</script>
</head>
<c:if test="${flag==false }">
	<script>
		alert("등업 후 로그인이 가능합니다. ");
	</script>
</c:if>
<body>

	<div class="container">
		<form class="login-form" action="adminIndex.do" method="post">
			<div class="login-wrap">
				<p class="login-img">
					<i class="icon_lock_alt"></i>
				</p>
				<div class="input-group">
					<span class="input-group-addon"><i class="icon_profile"></i></span>
					<input type="text" class="form-control" placeholder="Username" name="adminid" autofocus>
				</div>
				<div class="input-group">
					<span class="input-group-addon"><i class="icon_key_alt"></i></span>
					<input type="password" class="form-control" placeholder="Password" name="adminpw">
				</div>
				<label class="checkbox"> <input type="checkbox"
					value="remember-me"> Remember me
				</label>
				<button class="btn btn-primary btn-lg btn-block" type="button" onclick="logincheck(this.form)">Login</button>
				<!-- <button class="btn btn-info btn-lg btn-block" type="submit">Signup</button> -->
			</div>
		</form>

	</div>


</body>
</html>