<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../sol_header.jsp"%>
<script>
function update_validate(frm){
	  var subject = frm.subject.value;
	  var content = frm.content.value;
	  subject = subject.replace(/^\s*|\s*$/g, '');
	  content = content.replace(/^\s*|\s*$/g, '');
	  if(subject.length == 0){
	    alert("제목을 입력해 주세요.");
	    frm.subject.focus();
	    return;
	  }
	  if(content.length == 0){
	    alert("내용을 입력해 주세요.");
	    frm.content.focus();
	    return;
	  }
	  alert("수정 하시겠습니까? ");
	  
	  frm.submit();
}//end
</script>
<script src="js/my.js"></script>
<!-- page start-->
<h4>
<img src="../sol_img/go_right.png" width="20px"/>
<img src="../sol_img/logos/qna_desc.png" width="120px" height="50px"><span style="font-size: 12px;">| 무엇이든 물어보세요</span>
</h4>
<hr>
<div align="center" >
<form action="update.do" method="post">
<input type="hidden" name="qnano" value="${param.qnano }">
<input type="hidden" name="recNo" value="${param.recNo }">
<table border ="0" width="100%" class="table" style="text-align:center">
	<tr bgcolor="#f5f7f9">
		<th style="text-align:center" valign="bottom">제목</td>
		<td bgcolor="#ffffff"><input type="text" name="subject" size="100" value="${dto.subject }"></td>
	</tr>
	<tr bgcolor="#f5f7f9">
		<th style="text-align:center" valign="bottom">아이디</th>
		<td bgcolor="#ffffff">${s_id }</td>
	</tr>
	<tr bgcolor="#f5f7f9">
		<th style="text-align:center"  valign="bottom">내용</th>
		<td bgcolor="#ffffff"><textarea cols="50" rows="7" name="content">${dto.content }</textarea></td>
	</tr>
	<tr  bgcolor="#f5f7f9">
		<th style="text-align:center"  valign="bottom">게시글 공개여부</th>
		<td bgcolor="#ffffff">
			<select name="qnashow">
				<option value="N" <c:choose><c:when  test="${dto.qnashow eq 'N' }" >selected</c:when></c:choose>>No</option>
				<option value="Y" <c:choose><c:when  test="${dto.qnashow eq 'Y' }" >selected</c:when></c:choose>>Yes</option>
			</select>
		</td>
	</tr>
</table>
 <div align="right">
	<input type="button" class="btn btn-default" value="수정" onclick="update_validate(this.form)">
 	<input type="button" class="btn btn-default" value="취소" onclick="javascript:history.go(-1)">
  </div>
</form>
</div>



<!-- page end-->
<%@ include file="../sol_footer.jsp"%>