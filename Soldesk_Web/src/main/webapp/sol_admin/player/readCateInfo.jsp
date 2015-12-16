<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>
<script>


</script>
<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-file-text-o"></i> Lecture
		</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="adminindex.do">Home</a></li>
			<li>동영상 교육 관리자페이지</li>
		</ol>
	</div>
</div>

<table border="0" cellspacing="0" cellpadding="0" align="center" class="table">
	<tr align ="center">
		<th><div align="center">학년</div></th>
		<th><div align="center">과목</div></th>
		<th size="300"><div align="center" >강좌설명</div></th>
		<th><div align="center">수정</div></th>
		<th><div align="center">삭제</div></th>
		<th><div align="center">강의등록하기</div></th>
		<th><div align="center">강의상세보기</div></th>
	</tr>
	<c:if test="${total ==0 }">
		<tr>
			<td colspan="7" align="center">관련된 강좌 정보가 없습니다. <br> 검색을 진행해주세요. </td>
		</tr>
	</c:if>
	<c:set var ="recNo" value="${recNo }"/>
	<c:forEach var ="dto" items="${list }">
		<c:set var ="recNo" value="${recNo-1 }"/>
			<tr align ="center">
				<td>${dto.grade }학년</td>
				<td>${dto.gwamok }</td>
				<td>${dto.categoryInfo }</td>
				<td><a href="cateUpdate.do?categoryno=${dto.categoryno }"><button class="btn btn-info btn-sm" >수정</button></a></td>
				<td><a href="cateDel.do?categoryno=${dto.categoryno }"><button class="btn btn-danger btn-sm">삭제</button></a></td>
				<td><a href="lecinsert.do?categoryno=${dto.categoryno }"><button class="btn btn-success btn-sm">강의등록하기</button></a></td>
				<td><a href="leclist.do?col1=${dto.grade }&col2=${dto.gwamok}"><button class="btn btn-success btn-sm">강의보러가기</button></a></td>
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