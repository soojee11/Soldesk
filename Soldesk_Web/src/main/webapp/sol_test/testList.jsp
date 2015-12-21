<%@page import="net.utility.Utility"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../sol_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="js/test.js"></script>

<!-- page start-->
<br />
<h3><img src="img/go_right.png" width="20px"/>
EBS 추천 문제지&nbsp;&nbsp;<span style="font-size: 12px;">함께 풀고 학습해 봅시다</span></h3>
<hr>
<div>
<img src="img/test_info.jpg" />
</div>
<br />
<div align="right">
<form class="form-inline" method="post" action="list.do">
	<select name="col1">
		<option value="" <c:choose><c:when  test="${col1 eq '' }" >selected</c:when></c:choose>>학년전체</option>
		<option value="1" <c:choose><c:when  test="${col1 eq '1' }" >selected</c:when></c:choose>>1학년</option>
		<option value="2" <c:choose><c:when  test="${col1 eq '2' }" >selected</c:when></c:choose>>2학년</option>
		<option value="3" <c:choose><c:when  test="${col1 eq '3' }" >selected</c:when></c:choose>>3학년</option>
		<option value="4" <c:choose><c:when  test="${col1 eq '4' }" >selected</c:when></c:choose>>4학년</option>
		<option value="5" <c:choose><c:when  test="${col1 eq '5' }" >selected</c:when></c:choose>>5학년</option>
		<option value="6" <c:choose><c:when  test="${col1 eq '6' }" >selected</c:when></c:choose>>6학년</option>
	</select>
	<select name="col2">
		<option value="" <c:choose><c:when  test="${col2 eq '' }" >selected</c:when></c:choose>>과목전체</option>
		<option value="kor" <c:choose><c:when  test="${col2 eq 'kor' }" >selected</c:when></c:choose>>국어</option>
		<option value="eng" <c:choose><c:when  test="${col2 eq 'eng' }" >selected</c:when></c:choose>>영어</option>
		<option value="mat" <c:choose><c:when  test="${col2 eq 'mat' }" >selected</c:when></c:choose>>수학</option>
	</select>
	<button class="btn btn-primary">검색</button>
</form>
</div>
	
<table class="table">
	<tr>
		<th width="60">순번</th>
		<th width="60">학년</th>
		<th width="60">과목</th>
		<th>문제지 제목</th>
		<th width="100">응시</th>
	</tr>
	
<c:set var="recNo" value="${recNo+1 }" />
<c:forEach var="dto" items="${list }" >
<c:if test="${dto.testshow eq 'Y' }">
<c:set var="recNo" value="${recNo-1 }" />
	<tr>
		<td>${recNo }</td>
		<td>${dto.grade }</td>
		<td>
			<c:set var="subject" value="${dto.subject }" />
			<c:choose>
				<c:when test="${subject eq 'kor'}">
					국어
				</c:when>
				<c:when test="${subject eq 'eng'}">
					영어
				</c:when>
				<c:when test="${subject eq 'mat'}">
					수학
				</c:when>
			</c:choose>
		</td>
		<td>${dto.testtitle }</td>
		<td><img src="img/test_ok.PNG" onclick="questionList('${s_id }','${dto.testno }','${dto.testtitle }')"/>
		<%-- <input type="button" value="응시하기" onclick="questionList('${dto.testno }','${dto.testtitle }')"/> --%></td>
	</tr>
</c:if>
</c:forEach>

	<tr>
		<td colspan="6"><div align="center">${paging }</div></td>
	</tr>
</table>

<!-- page end -->
<%@ include file="../sol_footer.jsp" %>