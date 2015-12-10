<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-file-text-o"></i> Test
		</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="adminindex.do">Home</a></li>
			<li><i class="icon_document_alt"></i>Test</li>
			<li><i class="fa fa-file-text-o"></i>Test_List</li>
			<li><i class="fa fa-file-text-o"></i>Question_Ins</li>
		</ol>
	</div>
</div>

<form method="post" action="questIns.do">
	<table border="1" align="center">
	
		<tr align="center">
			<td>문제종류</td>
			<td>
				<div align="center">
					<select name="qtype">
						<option value="G">객관식</option>
						<option value="J">주관식</option>
						<option value="OX">OX</option>
					</select>
				</div>
			</td>
		</tr>
		
		<tr align="center">
			<td>문제제목</td>
			<td><input type="text" name="qtitle"  size="100"></td>
		</tr>
		<tr align="center">
			<td>보기</td>
			<td><input type="text" name="qtitle"  size="100"></td>
		</tr>
		<tr align="center">
			<td>답</td>
			<td><input type="text" name="example" ></td>
		</tr>
		<tr align="center">
			<td>해설</td>
			<td><textarea rows="15" cols="100" name="comment"></textarea></td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<input type="button" value="등록" onclick="checkForm(this.form)">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>

<%@ include file="../footer.jsp"%>