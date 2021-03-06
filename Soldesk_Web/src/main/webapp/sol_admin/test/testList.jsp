<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>
<!-- page start-->

<c:if test="${res == 1 }">
	<script>
		alert("해당 문제지를 등록하였습니다.");
		location.href="testList.do";
	</script>
</c:if>

<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-file-text-o"></i> Test
		</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="../../sol_admin/adminIndex.do">Home</a></li>
			<li>문제풀기 게시판 관리 페이지</li>
		</ol>
	</div>
</div>

<div class="row">
	<div class="col-lg-24" align="center">
		<form class="form-inline" method="post" action="testList.do">
			<div class="form-group">
				<select class="form-control input-sm m-bot15" name="col1">
					<option value=""
						<c:choose><c:when  test="${col1 eq '' }" >selected</c:when></c:choose>>학년전체</option>
					<option value="1"
						<c:choose><c:when  test="${col1 eq '1' }" >selected</c:when></c:choose>>1학년</option>
					<option value="2"
						<c:choose><c:when  test="${col1 eq '2' }" >selected</c:when></c:choose>>2학년</option>
					<option value="3"
						<c:choose><c:when  test="${col1 eq '3' }" >selected</c:when></c:choose>>3학년</option>
					<option value="4"
						<c:choose><c:when  test="${col1 eq '4' }" >selected</c:when></c:choose>>4학년</option>
					<option value="5"
						<c:choose><c:when  test="${col1 eq '5' }" >selected</c:when></c:choose>>5학년</option>
					<option value="6"
						<c:choose><c:when  test="${col1 eq '6' }" >selected</c:when></c:choose>>6학년</option>
				</select>
			</div>

			<div class="form-group">
				<select class="form-control input-sm m-bot15" name="col2">
					<option value=""
						<c:choose><c:when  test="${col2 eq '' }" >selected</c:when></c:choose>>과목전체</option>
					<option value="kor"
						<c:choose><c:when  test="${col2 eq 'kor' }" >selected</c:when></c:choose>>국어</option>
					<option value="mat"
						<c:choose><c:when  test="${col2 eq 'mat' }" >selected</c:when></c:choose>>수학</option>
					<option value="soc"
						<c:choose><c:when  test="${col2 eq 'soc' }" >selected</c:when></c:choose>>사회</option>
					<option value="sci"
						<c:choose><c:when  test="${col2 eq 'sci' }" >selected</c:when></c:choose>>과학</option>
				</select>
			</div>
				<button class="btn btn-warning button">검색</button>
		</form>
	</div>
</div>

<div align="left">
<a href="testForm.do"><button class="btn btn-danger btn-sm">문제지 등록</button></a>
</div>

<table class="table">
	<tr>
		<th width="80">보여주기</th>
		<th width="60">순번</th>
		<th width="60">학년</th>
		<th width="60">과목</th>
		<th>문제지 제목</th>
		<th width="100">문제 보기</th>
	</tr>

	<c:set var="recNo" value="${recNo+1 }" />
	<c:forEach var="dto" items="${list }">
		<c:set var="recNo" value="${recNo-1 }" />
		<tr>
			<td>
			<form action="testShowUpdate.do" method="post">
			<input type="hidden" name="testno" value="${dto.testno }" />
			<select name="testshow" class="form-control input-sm m-bot15" onchange="testShow(this.form)">
				<option value="Y" <c:if test="${dto.testshow eq 'Y'}">selected</c:if>>Y</option>
				<option value="N" <c:if test="${dto.testshow eq 'N'}">selected</c:if>>N</option>
			</select>
			</form>
			<script>
			function testShow(frm) {
				frm.submit();
			}
			</script>
			
			</td>
			<td>${recNo }</td>
			<td>${dto.grade }</td>
			<td><c:set var="subject" value="${dto.subject }" /> <c:choose>
					<c:when test="${subject eq 'kor'}">
					국어
					</c:when>
					<c:when test="${subject eq 'mat'}">
					수학
					</c:when>
					<c:when test="${subject eq 'soc'}">
					사회
					</c:when>
					<c:when test="${subject eq 'sic'}">
					과학
					</c:when>
				</c:choose></td>
			<td>${dto.testtitle }</td>
			<td><a href="questionList.do?testno=${dto.testno }&testtitle=${dto.testtitle }"><button
						class="btn btn-info btn-sm">문제 보기</button></a></td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="6" align="right" ><strong>total:</strong>${total }</td>
	</tr>
	<tr>
		<td colspan="6"><div align="center">${paging }</div></td>
	</tr>
</table>

<!-- page end -->
<%@ include file="../footer.jsp"%>