<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-file-text-o"></i> Board
		</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="../../sol_admin/adminIndex.do">Home</a></li>
			<li>공지사항 관리자페이지</li>
		</ol>
	</div>
</div>

<div align="center">
<table class="table" style="text-align: left; width:750px;">
	<tr>
		<td width="60px">제목</td>
		<td colspan="5"><strong>${dto.subject }</strong></td>
	</tr>
	<tr>
		<td width="60px">ID</td>
		<td>${dto.passwd }</td>
		<td width="60px">작성일</td>
		<td><c:set var="regdt" value="${dto.regdt }" />
			${fn:substring(regdt,0,16) }</td>
		<td width="60px">조회수</td>
		<td>${dto.readcnt }</td>
	</tr>

	<tr>
		<td colspan="6">${dto.content }</td>
	</tr>
</table>
</div>
<br />
<div align="center">
	<button type="button" class="btn btn-info btn-sm"  onclick="location.href='./noticeUpdate.do?bbsno=${param.bbsno}'">수정</button>
	<button type="button" class="btn btn-info btn-sm" onclick="history.go(-1); return false;">목록</button>
</div>

<%@ include file="../footer.jsp"%>