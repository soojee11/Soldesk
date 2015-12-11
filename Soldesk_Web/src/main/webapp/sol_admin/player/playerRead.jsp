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
			<li><i class="fa fa-home"></i><a href="adminindex.do">Home</a></li>
			<li><i class="icon_document_alt"></i>Lecture</li>
			<li><i class="fa fa-file-text-o"></i>Lecture_Read</li>
		</ol>
	</div>
</div>

<div align="center">
<h4>
	<strong>
		${dto.subject } - 
		<c:choose><c:when  test="${dto2.gwamok eq 'kor' }" >국어 </c:when></c:choose>
		<c:choose><c:when  test="${dto2.gwamok eq 'mat' }" >수학 </c:when></c:choose>
		<c:choose><c:when  test="${dto2.gwamok eq 'eng' }" >영어 </c:when></c:choose>
		
		<c:choose><c:when  test="${dto2.grade eq '1' }" >1학년 </c:when></c:choose>
		<c:choose><c:when  test="${dto2.grade eq '2' }" >2학년 </c:when></c:choose>
		<c:choose><c:when  test="${dto2.grade eq '3' }" >3학년 </c:when></c:choose>
		<c:choose><c:when  test="${dto2.grade eq '4' }" >4학년 </c:when></c:choose>
		<c:choose><c:when  test="${dto2.grade eq '5' }" >5학년 </c:when></c:choose>
		<c:choose><c:when  test="${dto2.grade eq '6' }" >6학년 </c:when></c:choose>
		
	</strong>
</h4>
</div>

<table class="table table-bordered">
	<tr align="center" >
		<td rowspan="3">
			<c:if test="${file_end eq 'MP3' }">
				<audio controls autoplay id="audio1" src="./player/storage/${dto.filename }"></audio>	
			</c:if>
			<c:if test="${file_end eq 'MP4' }">
				<video controls src="./player/storage/${dto.filename }"  width="300px"></video>
			</c:if>
		
		</td>
		<td  valign="bottom">선생님</td>
		<td  valign="middle">${dto.teacher }</td>
	</tr>
	<tr align="center" >
		<td  valign="bottom">파일크기</td>
		<td  valign="middle">${dto.filesize }</td>
	</tr>
	<tr align="center">
		<td  valign="middle">강의시간(초)</td>
		<td  valign="middle">${dto.lecturetime }</td>
	</tr>
</table>
<br />
<div align="center">
	<button type="button" class="btn btn-info btn-sm"  onclick="location.href='./leclist.do?col1=${dto2.grade}&col2=${dto2.gwamok}'">목록</button>
	<button type="button" class="btn btn-info btn-sm"  onclick="location.href='./lecUpdate.do'">수정</button>
	<button type="button" class="btn btn-info btn-sm"  onclick="location.href='./lecDel.do?lectureno=${param.lectureno}&categoryno=${dto.categoryno }'">삭제</button>
</div>

<%@ include file="../footer.jsp"%>