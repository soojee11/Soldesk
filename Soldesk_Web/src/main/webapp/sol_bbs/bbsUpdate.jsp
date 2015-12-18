<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../sol_header.jsp"%>
<!-- page start-->
<link rel="stylesheet" href="css/style.css" />
<script>
function createBbs(frm){
	 if(frm.subject.value == ""){
	      alert("제목을 입력하세요");
	      frm.subject.focus();
	      return;
	    }
	  
	  if(frm.content.value == ""){
	      alert("내용을 입력하세요");
	      frm.content.focus();
	      return;
	    }
	  
	  frm.submit();
}
</script>
<br/>
<c:if test="${msg != null}">
	<script type="text/javascript">
	 alert("게시물 수정 성공");
	 location.href="bbsread.do?bbsno=${dto.bbsno}&nowPage=${nowPage }";
	</script>
</c:if>
<h5>
	<img src="img/cont.JPG"><img src="img/pna.JPG">| 무엇이든 물어보세요
</h5>
<hr>
<div align="center"><h3>Q & A 수정</h3></div>

<form method="post" action="./bbsupdate.do">
  <input type="hidden"  name="nowPage" value="${nowPage }">
  <input type="hidden" name="bbsno" value="${dto.bbsno }">
	<table border="0" align="center">
	<tr>
		<td width="50px">제목</td>
		<td><input type="text" name="subject" value="${dto.subject }"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea name="content" cols='20' rows='10'>${dto.content }</textarea></td>
	</tr>
	<tr>
	   <td colspan="2" align="center">
	      <input type="button" name="list" value="목록" onclick="location.href='bbslist.do?nowPage=${nowPage }'">
	      <input type="button" name="insert" value="수정" onclick="createBbs(this.form)">
	      <input type="reset" name="reset" value="취소">
	   </td>
	</tr>
	</table>
</form>
<!-- page end-->
<%@ include file="../sol_footer.jsp"%>