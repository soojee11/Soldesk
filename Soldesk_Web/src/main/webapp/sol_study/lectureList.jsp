<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../sol_header.jsp"%>
<%@page import="net.utility.Utility"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- page start-->

<link href="./css/style.css" rel="stylesheet" type="text/css">
<h5>
	<!-- <img src="img/cont.JPG"> -->
	<img src="../sol_img/test/go_right.png" width="20px"/><img src="img/study.png" width="150px" height="50px"> 
</h5>

<div class="column">
	 <div class="menu1">
			<!-- 학년별 카테고리 -->
			<ul>				
				<li style="background-color: #99cc66">학년</li>
				<li><a href="./lectureList.do?grade=1&gwamok=${gwamok}">1학년</a></li>
				<li><a href="./lectureList.do?grade=2&gwamok=${gwamok}">2학년</a></li>
				<li><a href="./lectureList.do?grade=3&gwamok=${gwamok}">3학년</a></li>
				<li><a href="./lectureList.do?grade=4&gwamok=${gwamok}">4학년</a></li>
				<li><a href="./lectureList.do?grade=5&gwamok=${gwamok}">5학년</a></li>
				<li><a href="./lectureList.do?grade=6&gwamok=${gwamok}">6학년</a></li>
			</ul>		
	</div>
	
	<div class="menu2">
			<!-- 과목 카테고리 -->
			<ul>				
				<li style="background-color: #99cc66">과목</li>
				<li><a href="lectureList.do?grade=${grade }&gwamok=국어">국어</a></li>
				<li><a href="lectureList.do?grade=${grade }&gwamok=영어">영어</a></li>
				<li><a href="lectureList.do?grade=${grade }&gwamok=수학">수학</a></li>
			</ul>		
	</div>
	
	<hr>
	<div class="view">
		<table class="table">
			<tr>
				<td><img src="img/lecture_desc.png" width="80px" height="80px"></td>
				<td>${categoryInfo }</td>
			</tr>
		</table>
	</div>
	<hr>
	<div class="menu3">
			<!-- 강의 카테고리 -->
			<ul>				
				<li style="background-color: #99cc66">강의</li>
				<li><a href="lectureList.do?grade=${grade }&gwamok=${gwamok}">목록</a></li>
				<li><a href="lectureList.do?grade=${grade }&gwamok=${gwamok}">학습Q&A</a></li>
				<li><a href="lectureList.do?grade=${grade }&gwamok=${gwamok}">수강후기</a></li>
			</ul>		
	</div>
	<hr>
총 <span style="color: red;"><strong>${total}</strong></span>개의 강좌가 있습니다.
<br/><br/>
<table class="table">
	<tr align="center" >
		<th>회차</th>
		<th >강의명</th>
		<th>강의</th>
		<th>강의시간</th>
		<th>선생님</th>
		<th>학습하기</th>
	</tr>

<c:set var="lectuerNo" value="${lectuerNo+1 }" />	
<c:forEach var="dto" items="${list }" >
<c:set var="lectuerNo" value="${lectuerNo-1 }" />

	<tr align="center">
		<td>${lectuerNo }</td>
		<td>${dto.subject }</td>
		<td>${dto.poster }</td>
		<td>${dto.lecturetime }</td>
		<td>${dto.teacher }</td>
		<td align="center"><a href=""><img src='img/btn_study_play.png' width="30" height="20"></a></td>
	</tr>
</c:forEach>

	<tr>
		<td colspan="5"><div align="center">${paging }</div></td>
	</tr>

</table>
	
</div>

<!-- page end-->
<%@ include file="../sol_footer.jsp"%>