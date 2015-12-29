<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>
<script>
function noticeDel(bbsno){
	var mess = "선택한 공지사항을 삭제하시겠습니까? \n 공지사항에 있는 댓글 모두 삭제됩니다. ";
	if(confirm(mess)){ 
		location.href="noticeDel.do?bbsno="+bbsno;
	}
}
</script>
<c:if test="${msg==2 }">
	<script>
		alert("삭제 성공!");
		location.href="noticeList.do";
	</script>
</c:if>
<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-file-text-o"></i> Notice
		</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="../../sol_admin/adminIndex.do">Home</a></li>
			<li>공지사항 관리자페이지</li>
		</ol>
	</div>
</div>
<div align="left">
<a href="noticeIns.do"><button class="btn btn-danger btn-sm">공지사항 등록</button></a>
</div>
  
<table class="table">
	<tr>
		<th><div align="center">번호</div></th>
		<th><div align="center">제목</div></th>
		<th><div align="center">작성자</div></th>
		<th><div align="center">작성일</div></th>
		<th><div align="center">조회수</div></th>
		<th><div align="center">삭제</div></th>
	</tr>
	<c:if test="${total ==0 }">
		<tr>
			<td colspan="5" align="center">관련된 공지사항이 존재하지않습니다. </td>
		</tr>
	</c:if>
	<c:set var="recNo" value="${recNo }" />
	<c:forEach var="dto" items="${list }">
		<c:set var="recNo" value="${recNo-1 }" />
		<tr>
			<td><div align="center">${recNo}</div></td>
			<td><a href="noticeRead.do?bbsno=${dto.bbsno }"><div align="center">${dto.subject }</div></a></td>
			<td><div align="center">${dto.passwd }</div></td>
			<td><div align="center"><c:set var="regdt" value="${dto.regdt }"/> ${fn:substring(regdt,0,16) }</div></td>
			<td><div align="center">${dto.readcnt }</div></td>
			<td><div align="center"><button class="btn btn-danger btn-sm" onclick="noticeDel(${dto.bbsno})">삭제</button></div></td>
		</tr>
	</c:forEach>
</table>

<div align="center">
	${paging }
</div>

<%@ include file="../footer.jsp"%>