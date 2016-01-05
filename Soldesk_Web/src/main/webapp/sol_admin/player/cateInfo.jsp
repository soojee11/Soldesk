<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>

<c:if test="${msg==0 }">
	<script>
		alert("등록된 강좌정보가 존재합니다. 새로운 학년과 과목으로 등록해주세요. ");
		location.href="cateInsert.do";
	</script>
</c:if>
<c:if test="${msg==1 }">
	<script>
		alert("강좌 등록 성공!");
		location.href="cateInfo.do";
	</script>
</c:if>
<c:if test="${msg==2 }">
	<script>
		alert("강좌 삭제 완료!");
		location.href="cateInfo.do";
	</script>
</c:if>

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
<a href="cateInsert.do"><button class="btn btn-danger btn-sm">강좌 등록</button></a>
</div>
<table border="0" cellspacing="0" cellpadding="0" align="center" class="table">
	<tr align ="center">
		<th><div align="center">학년</div></th>
		<th><div align="center">과목</div></th>
		<th><div align="center">선생님</div></th>
		<th size="300"><div align="center" >강좌설명</div></th>
		<th><div align="center">강좌상세보기</div></th>
		<th><div align="center">강의상세보기</div></th>
	</tr>
	<c:if test="${total ==0 }">
		<tr>
			<td colspan="5" align="center">관련된 강좌 정보가 없습니다. <br> 검색을 진행해주세요. </td>
		</tr>
	</c:if>
	<c:set var ="recNo" value="${recNo }"/>
	<c:forEach var ="dto" items="${list }">
		<c:set var ="recNo" value="${recNo-1 }"/>
			<tr align ="center">
				<td>${dto.grade }학년</td>
				<td>${dto.gwamok }</td>
				<td>${dto.teacherName }</td>
				<td>${dto.categoryinfo }</td>
				<td><a href="readCate.do?categoryno=${dto.categoryno}"><button class="btn btn-success btn-sm">강좌상세보기</button></a></td>
				<td><a href="leclist.do?categoryno=${dto.categoryno}"><button class="btn btn-info btn-sm">강의상세보기</button></a></td>
			</tr>
	</c:forEach>
	<!-- &col1=${param.col1}&col2=${param.col2} -->
	<tr>
		<td colspan="6" align="right" ><strong>total:</strong>${total }</td>
	</tr>
	<tr>
		<td colspan="6"><div align="center">${paging }</div></td>
	</tr>
</table>

<%@ include file="../footer.jsp"%>