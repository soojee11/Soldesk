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
			<li>Q&A 관리자페이지</li>
		</ol>
	</div>
</div>

<form method="post" action="qnaDel.do">
<table class ="table">
	<tr>
		<td colspan="7" align="left"> 
			<input type="checkbox" name="allck2" id="allck2" onclick="checkboxEnable2()"/>
			<strong><span style="font-size:12px; color:#1717ff;">모두체크</span></strong>
			<button type="button" class="btn btn-danger btn-sm" onclick="qnaCheck(this.form)">선택 삭제</button>
		</td>
	</tr>
	<tr align ="center">
		<th><div align="center">선택</div></th>
		<th><div align="center">번호</div></th>
		<th><div align="center">제목</div></th>
		<th><div align="center">공개여부</div></th>
		<th><div align="center">답변여부</div></th>
		<th><div align="center">ID</div></th>
		<th><div align="center">작성일</div></th>
	</tr>
	<c:if test="${total ==0 }">
		<tr>
			<td colspan="7" align="center">관련된 QNA글이 존재하지않습니다. </td>
		</tr>
	</c:if>
	<c:set var ="recNo" value="${recNo }"/>
	<c:forEach var ="dto" items="${list }">
		<c:set var ="recNo" value="${recNo-1 }"/>
		<tr align ="center">
			<td><div align="center"><input type="checkbox" name="check2" value="${dto.qnano }"  /></div></td>
			<td>${recNo+1 }</td>
			<td>${dto.subject }</td>
			<td>
				<c:if test="${dto.qnashow=='N' }">비공개</c:if>
				<c:if test="${dto.qnashow=='Y' }">공개</c:if>
			</td>
			<td>
				<c:if test="${dto.replyok=='N' }">미답변</c:if>
				<c:if test="${dto.replyok=='Y' }">답변완료</c:if>
			</td>
			<td>${dto.id }</td>
			<td>
				<c:set var="regdt" value="${dto.regdt }"/> ${fn:substring(regdt,0,16) }
			</td>
		</tr>
	</c:forEach>
</table>
</form>

<div align="center">
	${paging }<br/>
	<form action ="qnaDel.do" >
		<select name="col1">
			<option value="" >선택</option>
			<option value="subject" <c:choose><c:when  test="${col1 eq 'subject' }" >selected</c:when></c:choose>>제목</option>
			<option value="id" <c:choose><c:when  test="${col1 eq 'id' }" >selected</c:when></c:choose>>ID</option>
		</select>
		<input type="text" name="col2" size = "30" <c:if test="${col2 !='' }">value="${param.col2 }"</c:if>>
		<input type="button" value="검색"  onclick="checkSearch(this.form)">
	</form>
</div>

<%@ include file="../footer.jsp"%>