<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../sol_header.jsp"%>
<%@page import="net.utility.Utility"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- page start-->
<script language="javascript">
function lectureGo(lectureno){
	  str = "/solproject/sol_player/player.do?lectureno="+lectureno;
	  r = window.open(str, "학습하기", 'scrollbars=yes, resizeable=no, width=1500, height=700');
	}

function lectureNotGo(){
	alert("로그인 후 이용해 주세요.");
}
</script>

<link href="./css/style.css" rel="stylesheet" type="text/css">
<h5>
	<!-- <img src="img/cont.JPG"> -->
	<img src="../sol_img/go_right.png" width="20px"/><img src="img/study.png" width="150px" height="50px"> 
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
				<li class="active"><a data-toggle="tab" href="#menu1">목록</a></li>
				<li><a data-toggle="tab" href="#menu2">학습Q&A</a></li>
				<li><a data-toggle="tab" href="#menu3">수강후기</a></li>
			</ul>		
	</div>
	<hr>
<div class="tab-content" style="width: 90%; color: black; height: 400px;">
<div  id="menu1" class="tab-pane fade in active">
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

<c:set var="lectureNo" value="${lectureNo+1 }" />	
<c:forEach var="dto" items="${list }" >
<c:set var="lectureNo" value="${lectureNo-1 }" />

	<tr align="center">
		<td>${lectureNo }</td>
		<td>${dto.subject }</td>
		<td>${dto.poster }</td>
		<td>${dto.lecturetime }분</td>
		<td>${dto.teacher }</td>
		<td align="center">
		<c:choose>
		  <c:when test="${s_id != null }">
		     <a href="javascript:lectureGo(${dto.lectureno })">
		  </c:when>
		  <c:otherwise>
		    <a href="javascript:lectureNotGo()">
		  </c:otherwise>
     </c:choose>
		<img src='img/btn_study_play.png' width="30" height="20"></a></td>
	</tr>
</c:forEach>

	<tr>
		<td colspan="5"><div align="center">${paging }</div></td>
	</tr>

</table>
</div>

<!-- 학습QnA 탭 -->
<div id="menu2" class="tab-pane fade">
총 <span style="color: red;"><strong>${qnaTotal}</strong></span>개의 Q&A가 있습니다.
<br/>
<div align="right"><a href="bbsform.do"><img src='./img/bt_write.gif' width="40" height="20"></a></div>
<br/>

<table class="table">
	<tr align="center" >
		<th>순번</th>
		<th >작성자</th>
		<th>제목</th>
		<th>등록일</th>
		<th>조회수</th>
	</tr>

<c:set var="QnAno" value="${QnAno+1 }" />	
<c:forEach var="qnaDto" items="${qnaList }" >
<c:set var="QnAno" value="${QnAno-1 }" />

	<tr align="center">
		<td>${QnAno }</td>
		<td>${qnaDto.id }</td>
		<td>${qnaDto.subject }</td>
		<td>${qnaDto.regdate }</td>
		<td>${qnaDto.readcnt }</td>
	</tr>
</c:forEach>

	<tr>
		<td colspan="5"><div align="center">${qnaPaging }</div></td>
	</tr>

</table>
</div>

<!-- 후기 탭 -->
<div id="menu3" class="tab-pane fade">
총 <span style="color: red;"><strong>${postTotal}</strong></span>개의 후기가 있습니다.
<br/>
<div> </div>
<br/>

<table class="table">
	<tr align="center" >
		<th>순번</th>
		<th >작성자</th>
		<th>내용</th>
		<th>등록일</th>
		<th>평점</th>
	</tr>

<c:set var="postNo" value="${postNo+1 }" />	
<c:forEach var="postDto" items="${postList }" >
<c:set var="postNo" value="${postNo-1 }" />

	<tr align="center">
		<td>${postNo }</td>
		<td>${postDto.id }</td>
		<td>${postDto.content }</td>
		<td>${postDto.regdate }</td>
		<td>${postDto.postgrade }</td>
	</tr>
</c:forEach>

	<tr>
		<td colspan="5"><div align="center">${postPaging }</div></td>
	</tr>

</table>
</div>

</div>
</div>
<!-- page end-->
<%@ include file="../sol_footer.jsp"%>