<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../sol_header.jsp"%>
<%@page import="net.utility.Utility"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- page start-->

<link href="./css/style.css" rel="stylesheet" type="text/css">
<h5>
	<img src="img/cont.JPG"><img src="img/study.png" width="150px" height="50px"> 
</h5>

<div class="column">
	 <div class="menu">
			<!-- 학년별 카테고리 -->
			<ul>				
				<li><a href="sol_study/intro.jsp">1학년</a></li>
				<li><a href="sol_study/intro.jsp">2학년</a></li>
				<li><a href="sol_study/intro.jsp">3학년</a></li>
				<li><a href="sol_study/intro.jsp">4학년</a></li>
				<li><a href="sol_study/intro.jsp">5학년</a></li>
				<li><a href="sol_study/intro.jsp">6학년</a></li>
			</ul>		
	</div>
	
	<div class="menu">
			<!-- 과목 카테고리 -->
			<ul>				
				<li><a href="sol_study/intro.jsp">국어</a></li>
				<li><a href="sol_study/intro.jsp">영어</a></li>
				<li><a href="sol_study/intro.jsp">수학</a></li>
			</ul>		
	</div>
	
	<hr>
	<div class="view">
		<table border="0">
			<tr>
			<td><img src="img/lecture_desc.png"></td>
			</tr>
		</table>
	</div>
	<hr>
	<div class="menu">
			<!-- 강의 카테고리 -->
			<ul>				
				<li><a href="sol_study/intro.jsp">강의목록</a></li>
				<li><a href="sol_study/intro.jsp">학습Q&A</a></li>
				<li><a href="sol_study/intro.jsp">수강후기</a></li>
			</ul>		
	</div>
	<hr>
총 <strong><style font-color="red">886</style></strong>개의 강좌가 있습니다.
<br/><br/>
<table class="table">
	<tr>
		<th>회차</th>
		<th rowspan="2">강의명</th>
		<th>강의시간</th>
		<th>선생님</th>
		<th>학습하기</th>
	</tr>

<c:set var="lectuerNo" value="${lectuerNo+1 }" />	
<c:forEach var="dto" items="${list }" >
<c:set var="lectuerNo" value="${lectuerNo-1 }" />

	<tr>
		<td>${lectuerNo }</td>
		<td>${dto.subject }</td>
		<td>${dto.poster }</td>
		<td>${dto.lecturetime }</td>
		<td>${dto.teacher }</td>
		<td><input type="button" src="img/btn_study_play.png"></td>
	</tr>
</c:forEach>

	<tr>
		<td colspan="5"><div align="center">${paging }</div></td>
	</tr>

</table>
	
</div>

<!-- page end-->
<%@ include file="../sol_footer.jsp"%>