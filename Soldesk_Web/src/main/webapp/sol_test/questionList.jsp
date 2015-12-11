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

<table align="center">
<c:set var="recNo" value="${recNo-5 }" />
<c:forEach var="dto" items="${list }" >
<c:set var="recNo" value="${recNo+1 }" />
<tr>
	<td><c:if test="${recNo > 1 }"><br /><br /><br /><br /></c:if>
		<c:if test="${dto.poster != '' }">
		<img src="../sol_admin/test/storage/${dto.poster }" style="border='1px';" /></c:if></td>
		<tr>
	<td><br /><strong><font font-size="12px;">${recNo }. </font></strong>${dto.qtitle }</td>
</tr>
	<c:if test="${dto.qtype eq 'G' }">
	<tr>
		<td>
			<c:set var="example" value="${dto.example }" />
		 	<%
		 	String example = (String)pageContext.getAttribute("example");
		 	String[] number=new String[5];
			String[] str=example.split("/");
			for (int idx = 0; idx < str.length; idx++) {
				number[idx]=str[idx];
				//System.out.print(number[idx]);
			}
			
			for (int idx = 0; idx < str.length; idx++) {
				pageContext.setAttribute("number"+idx, number[idx]) ;
			}
			%>
			<ul>
				<li style="list-style:none;"><input type="radio" name="answer" value="${number0 }" />${number0}</li>
				<li style="list-style:none;"><input type="radio" name="answer" value="${number1 }" />${number1}</li>
				<li style="list-style:none;"><input type="radio" name="answer" value="${number2 }" />${number2}</li>
				<li style="list-style:none;"><input type="radio" name="answer" value="${number3 }" />${number3}</li>
				<li style="list-style:none;"><input type="radio" name="answer" value="${number4 }" />${number4}</li>
			</ul>
		</td>
		</tr> 
	</c:if>
</c:forEach>
</table>
</body>
</html>