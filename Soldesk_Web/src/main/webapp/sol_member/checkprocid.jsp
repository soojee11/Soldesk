<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script language="javascript">
	function apply(id) {
		var id=id.replace(/(^\s*)|(\s*$)/gi, "");
		opener.document.joinForm.id.value = id;
		window.close();
	}
</script>
</head>
<body>
	<div style="text-align: center">
	
		<strong>${id }</strong>는 사용가능한 아이디 입니다. <br /> <a
			href="javascript:apply('${id }')"><br /> <br /> <input
			type='button' value='사용하기'></a> <a
			href="javascript:window.close()"> <input type='button' value='닫기'></a>

	</div>
</body>
</html>
