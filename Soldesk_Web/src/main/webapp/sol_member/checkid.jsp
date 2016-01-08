<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
//정렬금지!!!!!!!!!!!!!!!!!!!!!!!!!!!!

	function frmSubmit(frm) {
		//var frm = document.idcheck;
		var id = frm.id.value; 
		id=id.replace(/(^\s*)|(\s*$)/gi, ""); 
		if(id.length<5 || id.length>=11){
			alert("아이디는 5~10글자의 \n공백없이, 소문자와 숫자만 입력가능합니다.");
			frm.id.focus();
			return;
		}
		
		//아이디 유효성 검사 (영문소문자, 숫자만 허용)
		for (i=0;i<id.length ;i++ )
		{
		 var ch=id.charAt(i);
		  if (!(ch>='0' && ch<='9') && !(ch>='a' && ch<='z'))
		  {
		  alert ("아이디는 5~10글자의 \n공백없이 소문자와 숫자만 입력가능합니다.");
		  frm.id.focus();
		  //frm.id.select();
		  return;
		  }
		  
	/* 	  if ((ch>='0' && ch<='9') && !(ch>='a' && ch<='z')) 
		  {
		  alert ("소문자와 숫자의 조합으로 만들어주세요.");
		  frm.id.focus();
		  //frm.id.select();
		  return;
		  } */
		}//for
		
		frm.submit();	
	}//end
	
	
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
		<form name="idcheck" method="post" action="checkid.do">
		<br/>
			<font color="#000" class="modalfont">아이디를 입력하세요</font>&nbsp;&nbsp;<input type="text" name="id" size="20"> <br/>
			<input  type="button" name="search" class="btn btn-primary" value="검색" onclick="frmSubmit(this.form)">
		 <a href="javascript:window.close()"> 
		 <input type='button' value='닫기' class="btn btn-primary"></a>
		</form>
		
	</div>
</body>
</html>


