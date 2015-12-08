<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../sol_header.jsp"%>
<!-- page start-->
<link rel="stylesheet" href="css/style.css" />
<h5>
	<img src="img/cont.JPG"><img src="img/pna.JPG">| 무엇이든 물어보세요
</h5>
<hr>
총 <strong><style font-color="red">886</style></strong>개의 등록된 글이 있습니다. | 현재 페이지 : <strong>1/89</strong>
<br/><br/>
<table border="0" width="100%">
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회수</td>
	</tr>
	<c:set var ="recNo" value="${recNo }"/>
	<c:forEach var ="dto" items="${list }">
		<c:set var ="recNo" value="${recNo-1 }"/>
			<tr>
				<td>${recNo }</td>
				<td>
					<c:if test="${dto.indent>0 }">
						<c:forEach var ="re" begin ="1" end="${dto.indent }" step="1">
							<img src="../images/reply.gif">
						</c:forEach>
					</c:if>
					<a href="javascript:read('${dto.bbsno }')">${dto.subject }</a>
				</td>
				<td>${dto.wname }</td>
				<td>${dto.regdt }</td>
				<td>${dto.readcnt }</td>
			</tr>
	</c:forEach>
	<tr>
		<td colspan="5"><div align="center">${paging }</div></td>
	</tr>
	<tr align="right">
		<td colspan="5"><a href="./create.do">글쓰기</a></td>
	</tr>

</table>


<!-- page end-->
<%@ include file="../sol_footer.jsp"%>