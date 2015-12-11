<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.Timestamp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<script>
   function applyzip(zip,addr){//우편번호,주소
	   opener.document.joinForm.zipcode.value=zip;//우편번호
	   opener.document.joinForm.address1.value=addr;//주소1
	   opener.document.joinForm.address2.focus();//주소2 커서이동(나머지주소)
	   window.close();//창닫기
   }
   function zipsearch(frm){
	   var dong = frm.dong.value;
	   dong=dong.replace(/^\s*|\s*$/g,'');
	   if(dong.length==0){
	   alert("검색할 동 이름을 입력하세요.");
	   return;
	  }
	   else{
	   frm.submit();
	  }
   }   
</script>

</head>
<body>
	<table border='1' bordercolor="#ffffff" width=100% align="center" style="font-size:14px">
		<tr>
			<td colspan=3 height=30 align="center">
				<form name='zipcodefrm' method='post' action="checkzip.do">
					찾을 읍/면/동 입력하세요 <br /> <input type='text' name='dong' size=15>
					<input type='button' value='검색'
						onclick='zipsearch(this.form)'>
				</form>
			</td>
		</tr>

		<tr>
			<td colspan=3 height=2 bgcolor=#b9b9b9></td>
		</tr>

		<tr>
			<td width=60 height=25 align='center'>우편번호</td>
			<td align='center'>주소</td>
			<td align='center' width=50>선택</td>
		</tr>

		<tr>
			<td colspan=3 height=2 bgcolor=#b9b9b9></td>
		</tr>


 <c:forEach var="dto" items="${list }">
		 
		    <table border='0' bordercolor="#ffffff" width=100% bgcolor="#ffffff">
		     
		        <tr
		        bgcolor="#ffffff"  onmouseover="this.style.backgroundColor='#fafafa'"
		             onmouseout="this.style.backgroundColor='#ffffff'">
		       
		        <td align='center'>${dto.zipcode }</td>
		         <td>${dto.sido } ${dto.gugun } ${dto.dong } ${dto.li } ${dto.bunji } ${dto.etc }&nbsp;</td> 
		                      
		         <td align = "right">
		         <input type='button'  class="button white"  value='선택' 
		         onclick="applyzip('${dto.zipcode }','${dto.sido } ${dto.gugun } ${dto.dong } ${dto.li } ${dto.bunji } ${dto.etc }')" />
		        </td> 
		        
		       </tr>
		    </table>
		 
		 </c:forEach>
	</table>
</body>
</html>