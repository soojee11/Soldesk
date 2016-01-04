<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../sol_header.jsp"%>
<%@page import="net.utility.Utility"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- page start-->
<script src="js/my.js"></script>
<link href="./css/style.css" rel="stylesheet" type="text/css">
<link rel='stylesheet' type='text/css' href='css/star.css'>
<h4>
	<!-- <img src="img/cont.JPG"> -->
	<img src="../sol_img/go_right.png" width="20px"/>
	<img src="img/study.png" width="150px" height="50px"><span style="font-size: 12px;">| 학습해 보세요 </span> 
</h4>

<div class="column">
	 <div class="menu1">
			<!-- 학년별 카테고리 -->
			<ul>				
				<li style="background-color: #99cc66">학년</li>
				<li><a href="./lectureInfo.do?grade=1&gwamok=${gwamok}">1학년</a></li>
				<li><a href="./lectureInfo.do?grade=2&gwamok=${gwamok}">2학년</a></li>
				<li><a href="./lectureInfo.do?grade=3&gwamok=${gwamok}">3학년</a></li>
				<li><a href="./lectureInfo.do?grade=4&gwamok=${gwamok}">4학년</a></li>
				<li><a href="./lectureInfo.do?grade=5&gwamok=${gwamok}">5학년</a></li>
				<li><a href="./lectureInfo.do?grade=6&gwamok=${gwamok}">6학년</a></li>
			</ul>		
	</div>
	
	<div class="menu2">
			<!-- 과목 카테고리 -->
			<ul>				
				<li style="background-color: #99cc66">과목</li>
				<li><a href="lectureInfo.do?grade=${grade }&gwamok=국어">국어</a></li>
				<li><a href="lectureInfo.do?grade=${grade }&gwamok=수학">수학</a></li>
				<li><a href="lectureInfo.do?grade=${grade }&gwamok=사회">사회</a></li>
				<li><a href="lectureInfo.do?grade=${grade }&gwamok=과학">과학</a></li>
			</ul>		
	</div>
	
	<hr>
	<div class="view">
	감언이설, 개과천선, 오비이락... <br />
	유식한 어른들만 쓰는 말이라고?? <br />
	이제 스쿨랜드 다나도 사자성어 공부한다!  <br />
	이제 EBS 초등 사이트에서도 웹툰을 즐겨라!  <br />
	짧은 동영상으로 볼까? 아니면 웹툰으로 볼까?  <br />
	골라보는 재미까지!  <br />
	즐겁게 웹툰을 보다보니 사자성어가 머리에 쏙쏙! <br />
	<a href="lectureList.do?gwamok=${gwamok }&grade=${grade }&tabNum=1"><span style="color:red;">강의보러가기</span></a>
	</div>
	
</div>
<!-- page end-->
<%@ include file="../sol_footer.jsp"%>