<%@ page contentType="text/html; charset=UTF-8"%>
<link href="../sol_css/bootstrap.css" rel="stylesheet">
<link href="../sol_css/bootstrap-responsive.css" rel="stylesheet">
<link href="../sol_css/style.css" rel="stylesheet">
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
<br/><Br/>
	<div style="text-align: center">

		<font color="#000" style="font-size: 12pt"><strong>${email }</strong>는 사용가능합니다. </font><br /> <a
			href="javascript:apply('${email }')"><br />  <input
			type='button' value='사용하기'  class="btn btn-primary button"></a> <a
			href="javascript:window.close()"> <input type='button' value='닫기'  class="btn btn-primary button"></a>

	</div>
</body>
</html>
