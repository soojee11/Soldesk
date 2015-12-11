<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBS 초중학</title>
</head>
<script>
var Timmer=new Date();                                        
var Login=Timmer.getTime();
var timer, timer2;

function showtime() {
	var stop=new Date();
	var SumTime=((stop.getTime()-Login)/1000); // 접속시간 총계
	var LoadH=Math.floor(SumTime/3600);      // 시간
	var LoadM=Math.floor((SumTime%3600)/60); // 분
	var LoadS=Math.floor(SumTime%60);        // 초
	
	var ctime = LoadH+" 시간 "+LoadM+" 분 "+LoadS+ "초"
	document.getElementById("clock").innerHTML = ctime;
	
	
	// 1초후 showtime()호출
	timer2 = window.setTimeout("showtime()", 1000);
}

function killtime() {
	
	alert(' 선택하지 않은 문제는 0점으로 처리됩니다 ');
	
	window.clearTimeout(timer);
	window.clearTimeout(timer2);
	
	location.href="list.do";
	
}
</script>
<body onload="showtime()" onunload="killtime()">

<table style="margin:0; padding:0; width:100%; height:60px; background-color:LightGray; valign:center;">
<tr>
	<td align="left" width="100px" rowspan="2"><img src="../sol_img/test/ebslogo.PNG" align="left"/></td>
	<td align="center" style="font-size:25px;" rowspan="2">${testtitle }</td>
	<td align="right" width="200px">
	<img src="../sol_img/test/alarm.png" /> 경과시간
	</td>
</tr>
<tr>
	<td align="right" width="150px">
	<p id="clock" style="font: 20px bold;"></p>
	</td>
</tr>
</table>

<input type="button" onclick="killtime()" value="채점"/>


<table class="table" style="text-align: center;">
	<tr>
		<th width="50">선택</th>
		<th width="90">문제지번호</th>
		<th width="90">문제번호</th>
		<th width="90">문제종류</th>
		<th>문제제목</th>
		<th>답</th>
		<th>보기</th>
		<th>해설</th>
		<th width="100">첨부파일</th>
	</tr>
	
	<c:forEach var ="dto" items="${list }">
	<c:if test="${dto.qynshow eq 'Y'}">
	</c:if>
		<tr>
		<td><input type="checkbox" name="check" value="${dto.questno }" /></td>
		<td>${dto.testno }</td>
		<td>${dto.questno }</td>
		<td>${dto.qtype }</td>
		<td style="text-align: left;">${dto.qtitle }</td>
		<td style="text-align: left;">${dto.answer }</td>
		<td style="text-align: left;">${dto.example }</td>
		<td style="text-align: left;">${dto.comment }</td>
		<td>
		<c:if test="${dto.poster != '' }">${dto.poster }
		<%-- <img src="../sol_admin/test/storage/${dto.poster }" > --%>
		</c:if>
		</td>
	</tr>
	<c:if test="${dto.qynshow eq 'N'}">
	</c:if>
	</c:forEach>
</table>

</body>
</html>