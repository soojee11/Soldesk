<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idcheckForm.jsp</title>
<script>


	function frmSubmit() {
		var frm = document.idcheck;
		var id = frm.id.value; 
		id=id.replace(/(^\s*)|(\s*$)/gi, ""); 
		if(id.length<5 || id.length>=11){
			alert("공백없이, 5~10글자 이내로 입력하세요.");
			frm.id.focus();
			return false;
		}
		return true; 
	
	}
	
	
</script>
</head>
<body>
	<div style="text-align: center">
		<form name="idcheck" method="post" action="checkid.do"
			onsubmit="return frmSubmit()">
			ID<input type="text" name="id" size="20"> <br/><br/>
			<input  type="submit" value="검색">
		 <a href="javascript:window.close()"> <input
			 type='button' value='닫기'></a>
		</form>
		
	</div>
</body>
</html>


