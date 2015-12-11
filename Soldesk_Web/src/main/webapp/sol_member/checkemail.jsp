<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emailcheckForm.jsp</title>
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
</head>
<body>
	<div style="text-align: center">
		<form name="emailcheck" method="post"
			action="checkemail.do" onsubmit="return frmSubmit()">
			EMAIL <input type="text" name="email" size="20">
			<br/><Br/> <input
				class="button white" type="submit" value="검색">
		<a href="javascript:window.close()"> <input
			class="button white" type='button' value='닫기'></a>
		</form>
		<br /> 
	</div>
</body>
</html>



