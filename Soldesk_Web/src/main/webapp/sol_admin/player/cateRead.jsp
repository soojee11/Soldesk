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
<h4>[
	<strong>
		<c:choose><c:when  test="${dto.grade eq '1' }" >1학년 </c:when></c:choose>
		<c:choose><c:when  test="${dto.grade eq '2' }" >2학년 </c:when></c:choose>
		<c:choose><c:when  test="${dto.grade eq '3' }" >3학년 </c:when></c:choose>
		<c:choose><c:when  test="${dto.grade eq '4' }" >4학년 </c:when></c:choose>
		<c:choose><c:when  test="${dto.grade eq '5' }" >5학년 </c:when></c:choose>
		<c:choose><c:when  test="${dto.grade eq '6' }" >6학년 </c:when></c:choose>
		
		<c:choose><c:when  test="${dto.gwamok eq '국어' }" >국어 </c:when></c:choose>
		<c:choose><c:when  test="${dto.gwamok eq '수학' }" >수학 </c:when></c:choose>
		<c:choose><c:when  test="${dto.gwamok eq '사회' }" >사회 </c:when></c:choose>
		<c:choose><c:when  test="${dto.gwamok eq '과학' }" >과학 </c:when></c:choose>
	</strong>]
	강좌 정보
</h4>
</div>
<div align="center">
<div style="width:850px;">
<table class="table table-bordered">
	<tr align="center" >
		<td rowspan="2" width="230px"><img src="cateStorage/${dto.teacherPhoto }" width="200px" height="200px" ></td>
		<td height="30px" width="100px">선생님 </td>
		<td>${dto.teacherName }</td>
	</tr>
	<tr align="center" width="80%">
		<td >선생님 이력</td>
		<td>${dto.teacherCareer }</td>
	</tr>
	<tr align="center">
		<td>강좌설명</td>
		<td colspan="2">${dto.categoryinfo }</td>
	</tr>
	<tr align="center">
		<td>책 정보</td>
		<td colspan="2">${dto.bookInfo }</td>
	</tr>
</table>
</div>
</div>
<br />
<div align="center">
		<button type="button" class="btn btn-info btn-sm"  onclick="location.href='./cateUpdate.do?categoryno=${param.categoryno}'">수정</button>
		<button type="button" class="btn btn-info btn-sm"  onclick="location.href='./cateDel.do?categoryno=${param.categoryno}'">삭제</button>
		<button type="button" class="btn btn-info btn-sm" onclick="history.go(-1); return false;">목록</button>
</div>

<%@ include file="../footer.jsp"%>