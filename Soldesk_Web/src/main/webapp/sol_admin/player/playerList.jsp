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
		<th><div align="center">캡쳐화면</div></th>
		<th><div align="center">파일크기</div></th>
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
			<tr align ="center">
				<td>${dto.lectureno }</td>
				<td>${dto.subject }</td>
				<td>
					<a href="lecread.do?lectureno=${dto.lectureno }">
						<c:choose>
							<c:when test="${fn:length(dto.filename) > 25}">
								<c:out value="${fn:substring(dto.filename,0,24)}"/>...${fn:substring(dto.filename,fn:length(dto.filename)-4,fn:length(dto.filename)) }
							</c:when>
						</c:choose>
					</a>
				</td>
				<td>
				<c:choose>
					<c:when test="${fn:length(dto.poster)==0}">-</c:when>
					<c:when test="${dto.poster!=null}">
						<a href="lecread.do?lectureno=${dto.lectureno }"><img src="storage/${dto.poster }" width="60px"></a>
					</c:when>
				</c:choose>	
				</td>
				<td>${dto.filesize/(1024)-((dto.filesize/(1024))%1) }KB</td>
				<td>${dto.lecturetime }</td>
			</tr>
	</c:forEach>
</table>
<div align="right">
	<strong>total:</strong>${total }
</div>
<div align="center">
	${paging }
</div>

<%@ include file="../footer.jsp"%>