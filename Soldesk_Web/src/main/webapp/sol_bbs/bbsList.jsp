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
	function checkSearch(frm){
		var col1 = frm.col1.value;
		var col2 = frm.col2.value;
		col1 = col1.replace(/^\s*|\s*$/g, '');
		col2 = col2.replace(/^\s*|\s*$/g, '');
		if(col1.length==0){
			alert("검색조건을 선택하세요.");
			frm.col1.focus();
			return;
		}
		if(col2.length==0){
			alert("검색어를 입력하세요.");
			frm.col2.focus();
			return;
		}
		frm.submit();
	}//end
</script>

<h4>
<img src="../sol_img/go_right.png" width="20px"/>
<img src="../sol_img/logos/bbs_desc.png" width="190px" height="50px"><span style="font-size: 12px;">| 자유롭게 말해보세요 </span>
</h4>
<div>
총 <span style="color: red;"><strong>${total }</strong></span> 개의 등록된 글이 있습니다. | 현재 페이지 : <strong>${nowPage }/${totalPage }</strong>
</div>
<br />
<table class="table" id="a">
	<tr>
		<th width="60">번호</th>
		<th>제목</th>
		<th width="100">ID</th>
		<th width="100">작성일</th>
		<th width="60">조회수</th>
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
	${paging }<br>
	<form class="form-inline" action="bbslist.do">
		<select name="col1">
			<option value="" >선택</option>
			<option value="subject" <c:choose><c:when  test="${param.col1 eq 'subject' }" >selected</c:when></c:choose>>제목</option>
			<option value="passwd" <c:choose><c:when  test="${param.col1 eq 'passwd' }" >selected</c:when></c:choose>>ID</option>
		</select>
		<input type="text" name="col2" size = "30" <c:if test="${param.col2 !='' }">value="${param.col2 }"</c:if>>
		<input type="button" class="btn btn-warning button" value="검색"  onclick="checkSearch(this.form)">
		<c:if test="${param.col1 != null }">
			<input type="button" class="btn btn-warning button" value="전체목록"  onclick="location.href='bbslist.do'">
		</c:if>
	</form>
</div>

<!-- page end-->
<%@ include file="../sol_footer.jsp"%>