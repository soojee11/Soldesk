<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script language="javascript">
	function apply(email) {
		var email=email.replace(/(^\s*)|(\s*$)/gi, "");
		opener.document.joinForm.email.value = email;
		window.close();
	}
</script>
</head>
<body>
	<div style="text-align: center">

		<strong>${email }</strong>는 사용가능한 이메일 입니다. <br /> <a
			href="javascript:apply('${email }')"><br /> <br /> <input
			type='button' value='사용하기'></a> <a
			href="javascript:window.close()"> <input type='button' value='닫기'></a>

	</div>
</body>
</html>
