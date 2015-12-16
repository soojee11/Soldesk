<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>

<c:if test="${flag == true }">
	동영상등록성공공공
	<script>
		flag = false;
		alert("동영상 업로드 완료. ");
	</script>
</c:if>

<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-file-text-o"></i> Lecture
		</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="adminIndex.do">Home</a></li>
			<li>동영상 교육 관리자페이지</li>
		</ol>
	</div>
</div>

<div class="row">
	<div class="col-lg-24" align="center">
		<form class="form-inline" action="leclist.do">
			<div class="form-group">
				<select class="form-control input-sm m-bot15" name="col1">
		<option value="" <c:choose><c:when  test="${col1 eq '' }" >selected</c:when></c:choose>>학년전체</option>
		<option value="1" <c:choose><c:when  test="${col1 eq '1' }" >selected</c:when></c:choose>>1학년</option>
		<option value="2" <c:choose><c:when  test="${col1 eq '2' }" >selected</c:when></c:choose>>2학년</option>
		<option value="3" <c:choose><c:when  test="${col1 eq '3' }" >selected</c:when></c:choose>>3학년</option>
		<option value="4" <c:choose><c:when  test="${col1 eq '4' }" >selected</c:when></c:choose>>4학년</option>
		<option value="5" <c:choose><c:when  test="${col1 eq '5' }" >selected</c:when></c:choose>>5학년</option>
		<option value="6" <c:choose><c:when  test="${col1 eq '6' }" >selected</c:when></c:choose>>6학년</option>
					</select>
			</div>

			<div class="form-group">
				<select class="form-control input-sm m-bot15" name="col2">
		<option value="" <c:choose><c:when  test="${col2 eq '' }" >selected</c:when></c:choose>>과목전체</option>
		<option value="kor" <c:choose><c:when  test="${col2 eq 'kor' }" >selected</c:when></c:choose>>국어</option>
		<option value="eng" <c:choose><c:when  test="${col2 eq 'eng' }" >selected</c:when></c:choose>>영어</option>
		<option value="mat" <c:choose><c:when  test="${col2 eq 'mat' }" >selected</c:when></c:choose>>수학</option>
				</select>
			</div>
				<button class="btn btn-success btn-sm">검색</button>
		</form>
	</div>
</div>

<div align="left">
<a href="readCateInfo.do"><button class="btn btn-danger btn-sm">강좌 목록</button></a>
</div>


<table border="0" cellspacing="0" cellpadding="0" align="center" class="table">
	<tr align ="center">
		<th><div align="center">교육번호</div></th>
		<th><div align="center">제목</div></th>
		<th><div align="center">강의파일</div></th>
		<th><div align="center">파일크기</div></th>
		<th><div align="center">캡쳐화면</div></th>
		<th><div align="center">선생님이름</div></th>
		<th><div align="center">강의시간(초)</div></th>
	</tr>
	<c:if test="${total ==0 }">
		<tr>
			<td colspan="7" align="center">관련된 동영상 교육이 없습니다. <br> 검색을 진행해주세요. </td>
		</tr>
	</c:if>
	<c:set var ="recNo" value="${recNo }"/>
	<c:forEach var ="dto" items="${list }">
		<c:set var ="recNo" value="${recNo-1 }"/>
			<tr align ="center">
				<td>${dto.lectureno }</td>
				<td>${dto.subject }</td>
				<td><a href="lecread.do?lectureno=${dto.lectureno }">${dto.filename }</a></td>
				<td>${dto.filesize/(1024)-((dto.filesize/(1024))%1) }KB</td>
				<td><img src="./player/storage/${dto.poster }" width="60px"></td>
				<td>${dto.teacher }</td>
				<td>${dto.lecturetime }</td>
			</tr>
	</c:forEach>
	<!-- &col1=${param.col1}&col2=${param.col2} -->
	<tr>
		<td colspan="7" align="right" ><strong>total:</strong>${total }</td>
	</tr>
	<tr>
		<td colspan="7"><div align="center">${paging }</div></td>
	</tr>
</table>

<%@ include file="../footer.jsp"%>