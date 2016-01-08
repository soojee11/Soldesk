<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emailcheckForm.jsp</title>

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

<script>
	function frmSubmit() {
		var frm = document.emailcheck;
		var email = frm.email.value;
		email = email.replace(/^\s*|\s*$/g, '');
		var regemail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		if (regemail.test(email) === false) {
			alert("공백없이, 올바른 이메일 형식으로 입력하세요.");
			frm.email.focus();
			return false;
		}
		return true;
	}
</script>
<style type="text/css">
        .modalfont{
     font-family:'Jeju Gothic', sans-serif;
      font-size:11pt;
    }
    
      
</style>
</head>
<body>
	<div style="text-align: center">
		<form name="emailcheck" method="post"
			action="checkemail.do" onsubmit="return frmSubmit()">
			<Br/>
			<font color="#000" class="modalfont">이메일을 입력하세요</font>&nbsp;&nbsp;<input type="text" name="email" size="20"><br/> 
			<input class="btn btn-primary" type="submit" value="검색" >
		  <a href="javascript:window.close()"> <input type='button' value='닫기' class="btn btn-primary"></a>
		</form>
		<br /> 
	</div>
</body>
</html>



