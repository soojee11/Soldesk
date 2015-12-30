<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../sol_header.jsp"%>
<script src="js/my.js"></script>
<c:if test="${msg==2 }">
	<script>
		alert("비공개 글 입니다.");
		location.href="list.do";
	</script>
</c:if>
<c:if test="${msg==3 }">
	<script>
		alert(" 게시글이 삭제되었습니다. ");
		location.href="list.do";
	</script>
</c:if>
<h4>
<img src="../sol_img/go_right.png" width="20px"/>
<img src="../sol_img/logos/qna_desc.png" width="120px" height="50px"><span style="font-size: 12px;">| 무엇이든 물어보세요</span>
</h4>
<div>
총 <strong>${total }</strong> 개의 등록된 글이 있습니다. | 현재 페이지 : <strong>${nowPage }/${totalPage }</strong>
</div>
<br />
<table class ="table">
	<tr align ="center">
		<td width="60">번호</td>
		<td>제목</td>
		<td width="100">답변여부</td>
		<td width="100">ID</td>
		<td width="100">작성일</td>
		<td width="60">조회수</td>
	</tr>
	<c:if test="${total ==0 }">
		<tr>
			<td colspan="6" align="center">관련된 QNA글이 존재하지않습니다. </td>
		</tr>
	</c:if>
<c:set var ="recNo" value="${recNo }"/>
	<c:forEach var ="dto" items="${list }">
	<c:set var ="recNo" value="${recNo-1 }"/>
		<tr align ="center">
			<td>
				${recNo+1 }
			</td>
				<td>
					<span>
						<c:if test="${dto.qnashow=='N' }"><img src="../sol_img/lock.png" width="15"></c:if>
						<a href="JavaScript:goRead('${dto.qnano }','${recNo+1 }','${s_id }')">${dto.subject }</a>
					</span>
				</td>
			<td>
				<c:if test="${dto.replyok=='N' }">미답변</c:if>
				<c:if test="${dto.replyok=='Y' }">답변완료</c:if>
			</td>
			<td>
				<c:set var="id" value="${dto.id }"/>
			 		${fn:substring(id,0,2) }
			  	<c:forEach var="i" begin="1" end="${fn:length(dto.id)-4}" step="1">
      				<c:out value="*" />
    		  	</c:forEach>
    			 ${fn:substring(id,fn:length(dto.id)-2,fn:length(dto.id)) }
			</td>
			<td>
				<c:set var="regdt" value="${dto.regdt }"/> ${fn:substring(regdt,0,10) }
			</td>
			<td>${dto.readcnt }</td>
		</tr>
	</c:forEach>
</table>
<div align="right">
<form action="insert.do" method="get">
	<input type="button" class="btn btn-warning button" value="글쓰기"  onclick="checkLogin(this.form,'${s_id }')"> 
</form>
</div>

<div align="center">
${paging }<br/>
<form class="form-inline" action="list.do">
	<select name="col1">
		<option value="" >선택</option>
		<option value="subject" <c:choose><c:when  test="${col1 eq 'subject' }" >selected</c:when></c:choose>>제목</option>
		<option value="id" <c:choose><c:when  test="${col1 eq 'id' }" >selected</c:when></c:choose>>ID</option>
	</select>
	<input type="text" name="col2" size = "30" <c:if test="${col2 !='' }">value="${param.col2 }"</c:if>>
	<input type="button" class="btn btn-warning button" value="검색"  onclick="checkSearch(this.form)">
</form>
</div>

<!-- page end-->
<%@ include file="../sol_footer.jsp"%>