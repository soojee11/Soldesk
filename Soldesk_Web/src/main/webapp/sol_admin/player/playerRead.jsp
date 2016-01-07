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

<div align="center">
<h4>
	<strong>
		${dto.subject } - 
		<c:choose><c:when  test="${dto2.gwamok eq '국어' }" >국어 </c:when></c:choose>
		<c:choose><c:when  test="${dto2.gwamok eq '수학' }" >수학 </c:when></c:choose>
		<c:choose><c:when  test="${dto2.gwamok eq '영어' }" >영어 </c:when></c:choose>
		
		<c:choose><c:when  test="${dto2.grade eq '1' }" >1학년 </c:when></c:choose>
		<c:choose><c:when  test="${dto2.grade eq '2' }" >2학년 </c:when></c:choose>
		<c:choose><c:when  test="${dto2.grade eq '3' }" >3학년 </c:when></c:choose>
		<c:choose><c:when  test="${dto2.grade eq '4' }" >4학년 </c:when></c:choose>
		<c:choose><c:when  test="${dto2.grade eq '5' }" >5학년 </c:when></c:choose>
		<c:choose><c:when  test="${dto2.grade eq '6' }" >6학년 </c:when></c:choose>
		
	</strong>
</h4>
</div>
<div align="center">
<div style="width:850px;">
<table class="table table-bordered">
	<tr align="center" >
		<td rowspan="3">
			<c:if test="${file_end eq 'MP3' }">
				<audio controls autoplay id="audio1" src="storage/${dto.filename }"></audio>	
			</c:if>
			<c:if test="${file_end eq 'MP4' }">
				<video controls src="storage/${dto.filename }"  width="600px"></video>
			</c:if>
		</td>
	</tr>
	<tr align="center" >
		<th style="vertical-align:middle"><div align="center">파일크기</div></th>
		<td style="vertical-align:middle"><div align="center">${dto.filesize }</div></td>
	</tr>
	<tr align="center">
		<th style="vertical-align:middle"><div align="center">강의시간(분)</div></th>
		<td style="vertical-align:middle"><div align="center">${dto.lecturetime }</div></td>
	</tr>
</table>
</div>
</div>
<br />
<div align="center">
	<button type="button" class="btn btn-info btn-sm"  onclick="location.href='./lecUpdate.do?lectureno=${param.lectureno}&categoryno=${dto.categoryno }'">수정</button>
	<button type="button" class="btn btn-info btn-sm"  onclick="location.href='./lecDel.do?lectureno=${param.lectureno}&categoryno=${dto.categoryno }'">삭제</button>
	<button type="button" class="btn btn-info btn-sm" onclick="history.go(-1); return false;">목록</button>
</div>

<%@ include file="../footer.jsp"%>