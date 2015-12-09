<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>

<c:if test="${flag == true }">
	<script>
		flag = false;
		alert("test지 등록에 성공하였습니다. ");
	</script>
</c:if>

<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-file-text-o"></i> Test
		</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="adminindex.do">Home</a></li>
			<li><i class="icon_document_alt"></i>Test</li>
			<li><i class="fa fa-file-text-o"></i>Test_List</li>
		</ol>
	</div>
</div>



<table width="650" border="1" cellspacing="0" cellpadding="0" align="center">
	<tr align ="center">
		<th><div align="center">순번</div></th>
		<th><div align="center">학년</div></th>
		<th><div align="center">과목</div></th>
		<th><div align="center">문제지제목</div></th>
	</tr>
	<c:if test="${total ==0 }">
		<tr>
			<td colspan="4" align="center">관련된 Test가 없습니다. </td>
		</tr>
	</c:if>
	<c:set var ="recNo" value="${recNo }"/>
	<c:forEach var ="dto" items="${list }">
		<c:set var ="recNo" value="${recNo-1 }"/>
			<tr align ="center">
				<td>${dto.testno }</td>
				<td>${dto.grade }</td>
				<td>
					<a href="question.do?testno=${dto.testno }">${dto.subject }</a>
				</td>
				<td>${dto.testtitle }</td>
			</tr>
	</c:forEach>
	<tr>
		<td colspan="4" align="right" ><strong>total:</strong>${total }</td>
	</tr>
	<tr>
		<td colspan="4"><div align="center">${paging }</div></td>
	</tr>
</table>
<br/>
<form name="form1" method="post" action="./list.do">
	<div align="center">
		<select name="col">
			<option value="grade">학년</option>
			<option value="subject">과목</option>
			<option value="testtitle">제목</option>
		</select>
		<input type="text" name="word" size="25">
		<input type="button" name="Button" value="검색" onClick="searchCheck(this.form)">
	</div>
</form>

<%@ include file="../footer.jsp"%>