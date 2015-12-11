<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-file-text-o"></i> Test
		</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="../adminindex.do">Home</a></li>
			<li>문제풀기 게시판 관리 페이지</li>
		</ol>
	</div>
</div>

<div class="row">
	<div class="col-lg-24" align="center">
		<form class="form-inline" method="post" action="questionList.do?testno=${param.testno }">
			<div class="form-group">
				<select class="form-control input-sm m-bot15" name="col">
					<option value=""
						<c:choose><c:when  test="${col eq '' }" >selected</c:when></c:choose>>전체보기</option>
					<option value="G"
						<c:choose><c:when  test="${col eq 'G' }" >selected</c:when></c:choose>>객관식</option>
					<option value="J"
						<c:choose><c:when  test="${col eq 'J' }" >selected</c:when></c:choose>>주관식</option>
					<option value="OX"
						<c:choose><c:when  test="${col eq 'OX' }" >selected</c:when></c:choose>>OX문제</option>
				</select>
			</div>

				<button class="btn btn-success btn-sm">문제종류선택</button>
		</form>
	</div>
</div>

<div align="left">
<a href="testList.do"><button class="btn btn-info btn-sm">문제지 목록</button></a>
<a href="questionForm.do?testno=${param.testno }"><button	class="btn btn-info btn-sm">문제 등록</button></a>
</div>

<table class="table" style="text-align: center;">
	<tr>
		<th width="90">문제지번호</th>
		<th width="90">문제번호</th>
		<th width="90">문제종류</th>
		<th>문제제목</th>
		<th>답</th>
		<th>보기</th>
		<th>해설</th>
		<th width="100">첨부파일</th>
	</tr>
	<c:if test="${total ==0 }">
		<tr>
			<td colspan="7" align="center">관련된 문제가 없습니다. </td>
		</tr>
	</c:if>
	<c:set var ="recNo" value="${recNo }"/>
	<c:forEach var ="dto" items="${list }">
		<c:set var ="recNo" value="${recNo-1 }"/>
			<tr>
				<td>${dto.testno }</td>
				<td>${dto.questno }</td>
				<td>${dto.qtype }</td>
				<td style="text-align: left;">${dto.qtitle }</td>
				<td style="text-align: left;">${dto.answer }</td>
				<td style="text-align: left;">${dto.example }</td>
				<td style="text-align: left;">${dto.comment }</td>
				<td>${dto.poster }
				<c:if test="${dto.poster != '' }">
					<%-- <img src="../sol_admin/test/storage/${dto.poster }" width="50px"> --%>
				</c:if>
				</td>
			</tr>
	</c:forEach>
</table>

<%@ include file="../footer.jsp"%>