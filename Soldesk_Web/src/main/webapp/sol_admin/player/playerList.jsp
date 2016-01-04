<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-file-text-o"></i> Lecture
		</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="../../sol_admin/adminIndex.do">Home</a></li>
			<li>동영상 교육 관리자페이지</li>
		</ol>
	</div>
</div>

<div align="left">
<c:if test="${flag==1 }">
	<a href="cateInfo.do"><button class="btn btn-danger btn-sm">강좌 목록</button></a>
	<a href="lecinsert.do?categoryno=${param.categoryno }"><button class="btn btn-danger btn-sm">강의 등록</button></a>
</c:if>
<c:if test="${flag==2 }">
	<a href="updelete.do"><button class="btn btn-danger btn-sm">강좌 목록</button></a>
</c:if>
</div>	


<table border="0" cellspacing="0" cellpadding="0" align="center" class="table">
	<tr align ="center">
		<th><div align="center">교육번호</div></th>
		<th><div align="center">제목</div></th>
		<th><div align="center">강의파일</div></th>
		<th><div align="center">파일크기</div></th>
		<th><div align="center">캡쳐화면</div></th>
		<th><div align="center">강의시간(분)</div></th>
	</tr>
	<c:if test="${total ==0 }">
		<tr>
			<td colspan="7" align="center">관련된 동영상 교육이 없습니다. <br> 검색을 진행해주세요. </td>
		</tr>
	</c:if>
	<c:set var ="recNo" value="${recNo }"/>
	<c:forEach var ="dto" items="${list }">
		<c:set var ="recNo" value="${recNo-1 }"/>
			<c:if test="${flag==1 }">
			<tr align ="center">
				<td>${dto.lectureno }</td>
				<td>${dto.subject }</td>
				<td><a href="lecread.do?lectureno=${dto.lectureno }">${dto.filename }</a></td>
				<td>${dto.filesize/(1024)-((dto.filesize/(1024))%1) }KB</td>
				<td><a href="lecread.do?lectureno=${dto.lectureno }"><img src="storage/${dto.poster }" width="60px"></a></td>
				<td>${dto.teacher }</td>
				<td>${dto.lecturetime }</td>
			</tr>
			</c:if>
			<c:if test="${flag==2 }">
			<tr align ="center">
				<td>${dto.lectureno }</td>
				<td>${dto.subject }</td>
				<td><a href="lecread2.do?lectureno=${dto.lectureno }">${dto.filename }</a></td>
				<td>${dto.filesize/(1024)-((dto.filesize/(1024))%1) }KB</td>
				<td><a href="lecread2.do?lectureno=${dto.lectureno }"><img src="storage/${dto.poster }" width="60px"></a></td>
				<td>${dto.lecturetime }</td>
			</tr>
			</c:if>
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