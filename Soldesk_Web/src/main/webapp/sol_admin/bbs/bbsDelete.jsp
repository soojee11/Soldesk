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
			<li>자유게시판 관리자페이지</li>
		</ol>
	</div>
</div>

<form method="post" action="bbsDel.do">
<table class="table">
	<tr>
		<td colspan="7" align="left"> 
			<input type="checkbox" name="allck2" id="allck2" onclick="checkboxEnable2()"/>
			<strong><span style="font-size:12px; color:#1717ff;">모두체크</span></strong>
			<button type="button" class="btn btn-danger btn-sm" onclick="bbsCheck(this.form)">선택 삭제</button>
		</td>
	</tr>
	<tr>
		<th width="60"><div align="center">선택</div></th>
		<th width="100"><div align="center">번호</div></th>
		<th width="300"><div align="center">제목</div></th>
		<th><div align="center">내용</div></th>
		<th width="100"><div align="center">ID</div></th>
		<th width="200"><div align="center">작성일</div></th>
	</tr>
	<c:if test="${total ==0 }">
		<tr>
			<td colspan="7" align="center">관련된 게시글이 존재하지않습니다. </td>
		</tr>
	</c:if>
	<c:set var="recNo" value="${recNo }" />
	<c:forEach var="dto" items="${list }">
	<c:if test="${dto.passwd ne '관리자' }">
		<c:set var="recNo" value="${recNo-1 }" />
		<tr>
			<td><div align="center"><input type="checkbox" name="check2" value="${dto.bbsno }"  /></div></td>	
			<td><div align="center">${recNo}</div></td>
			<td><div align="center">${dto.subject }</div></td>
			<td><div align="center">${dto.content }</div></td>
			<td><div align="center">${dto.passwd }</div></td>
			<td><div align="center"><c:set var="regdt" value="${dto.regdt }"/> ${fn:substring(regdt,0,16) }</div></td>
		</tr>
	</c:if>
	</c:forEach>
</table>
</form>

<div align="center">
	${paging }
</div>

<%@ include file="../footer.jsp"%>