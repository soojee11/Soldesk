<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<script>
function checkForm(frm){
	
	var testtitle = frm.testtitle.value;

	testtitle = testtitle.replace(/^\s*|\s*$/g, '');
	
	if (testtitle.length < 2) {
		alert("문제지 제목을 2글자 이상 입력해주세요. ");
		frm.id.focus();
		return;
	}
	
	frm.submit();
	
}

</script>


<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-file-text-o"></i> Test
		</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="adminindex.do">Home</a></li>
			<li><i class="icon_document_alt"></i>Test</li>
			<li><i class="fa fa-file-text-o"></i>Test_insert</li>
		</ol>
	</div>
</div>

<form method="post" action="testIns.do">
	<table border="1" align ="center">
		<tr>
			<td>학년</td>
			<td>
				<select name="grade">
					<option value="1" >1학년</option>
					<option value="2" >2학년</option>
					<option value="3" >3학년</option>
					<option value="4" >4학년</option>
					<option value="5" >5학년</option>
					<option value="6" >6학년</option>
				</select> 
			</td>
		</tr>
		<tr>
			<td>과목</td>
			<td>
				<select name="subject">
					<option value="kor" >국어</option>
					<option value="eng" >영어</option>
					<option value="mat" >수학</option>
				</select> 
			</td>
		</tr>
		<tr>
			<td>문제지 제목</td>
			<td><input type="text" name="testtitle" size="100"></td>
		</tr>
		<tr align="center">
			<td colspan="2">
				<input type="button" value="등록" onclick="checkForm(this.form)">
				<input type="reset" value="취소">
			</td>
		</tr>

	</table>

</form>

<%@ include file="../footer.jsp"%>