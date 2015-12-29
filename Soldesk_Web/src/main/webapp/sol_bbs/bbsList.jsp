<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../sol_header.jsp"%>
<link rel="stylesheet" href="css/style.css" />
<!-- page start-->
<script type="text/javascript">
	function denywrite() {
		alert("로그인 후 이용해주세요.");
	}
</script>
<h4>
<img src="../sol_img/go_right.png" width="20px"/>
<img src="../sol_img/logos/bbs_desc.png" width="190px" height="50px"><span style="font-size: 12px;">| 자유롭게 말해보세요 </span>
</h4>
<div>
총 <strong>${total }</strong> 개의 등록된 글이 있습니다. | 현재 페이지 : <strong>${nowPage }/${totalPage }</strong>
</div>
<br />
<table class="table">
	<tr>
		<td width="60">번호</td>
		<td>제목</td>
		<td width="100">ID</td>
		<td width="100">작성일</td>
		<td width="60">조회수</td>
	</tr>
	
	<!-- 공지사항 -->
	<c:forEach var="ndto" items="${nlist }">
		<c:if test="${ndto.noticeshow=='Y' }">
			<tr bgcolor="#f8f8f8">
				<td width="60"><div align="center"><img src="bbs_img/notice.png" width="20"></div></td>
				<td><a href="bbsread.do?bbsno=${ndto.bbsno }&nowPage=${nowPage }">${ndto.subject }</a>
				</td>
				<td width="100">${ndto.passwd }</td>
				<td width="100"><c:set var="nregdt" value="${ndto.regdt }"/> ${fn:substring(nregdt,0,10) }</td>
				<td width="60">${ndto.readcnt }</td>
			</tr>
		</c:if>
	</c:forEach>
	
	<!-- 게시판 -->
	<c:set var="recNo" value="${recNo }" />
	<c:forEach var="dto" items="${list }">
	<c:if test="${dto.passwd ne '관리자' }">
		<c:set var="recNo" value="${recNo-1 }" />
		<tr>
			<td width="60">${recNo }</td>
			<td><a href="bbsread.do?bbsno=${dto.bbsno }&nowPage=${nowPage }">${dto.subject }</a>
			</td>
			<td width="100">${dto.passwd }</td>
			<td width="100"><c:set var="regdt" value="${dto.regdt }"/> ${fn:substring(regdt,0,10) }</td>
			<td width="60">${dto.readcnt }</td>
		</tr>
	</c:if>
	</c:forEach>
</table>

<div align="right">
	<input type="button" value="글쓰기" class="btn btn-warning button"
		<c:if test="${s_id == null }">onclick="denywrite()"</c:if>
		<c:if test="${s_id != null }">onclick="location.href='./create.do'"</c:if>>
</div>

<div align="center">
	${paging }
</div>
<!-- page end-->
<%@ include file="../sol_footer.jsp"%>