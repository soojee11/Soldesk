<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBS 초중학</title>
<script src="../js/test.js"></script>
<link href="../css/test.css" rel="stylesheet">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>

<body onload="showtime()" onunload="killtime()">

<div id="layer_fixed">
<table cellspacing="0" cellpadding="0" style="width:100%; height:100%;">
<tr>
	<td style="text-align:left; width: 250px;">
	<img src="../img/slogo.png" alt="Logo" height="64px">
	</td>
	<td style="text-align: center; font-size:25px;">
		<strong>${testtitle }</strong>
	</td>
		<td style="text-align:right; width: 250px; padding-right: 20px;">
		<img src="../img/alarm.png" /> 경과시간<br />
		<span id="clock" style="font: 20px bold;"></span>
	</td>
</tr>
</table>
</div>
<form class="form-inline" method="post" action="questionCheck.do?testno=${param.testno}&testtitle=${param.testtitle}">
<input type="hidden" id="clock" name="clock" />
<div id="layer_fixed2">
<table cellspacing="0" cellpadding="0" style="width:100%; height:100%;">
<tr>
	<td><input class="btn btn-warning" type="button" onclick="killtime(this.form,${gtotal })" value="채점하기" /></td>
</tr>
</table>
</div>

<c:forEach var="i" end="${recNo }" begin="1" step="1">
    <c:set var="recNo2" value="${recNo+1-i}"/>
    
</c:forEach>

<div align="center" style="margin-top: 130px; font-size:12px;"> 
<table align="center" text-align="center" width="600px">
<c:set var="recNo" value="${recNo2-1 }" />
<c:forEach var="dto" items="${list }" >
<c:set var="recNo" value="${recNo+1 }" />
	<tr>
		<td><c:if test="${recNo > 1 }"><br /><br /><br /><br /></c:if>
			<c:if test="${dto.poster ne '<p>&nbsp;</p>'}">
			<div style="border:1px dotted; padding: 10px;">${dto.poster }</div>
			</c:if>
		</td>
	</tr>
	<tr>
	<td><br />
	<span><strong>${recNo }. </strong></span>${dto.qtitle }</td>
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
				<li style="list-style:none;"><input onclick="check_only(this,${dto.questno })" type="checkbox" name="answer" value="${dto.questno },${number0 }" />${number0}</li>
				<li style="list-style:none;"><input onclick="check_only(this,${dto.questno })" type="checkbox" name="answer" value="${dto.questno },${number1 }" />${number1}</li>
				<li style="list-style:none;"><input onclick="check_only(this,${dto.questno })" type="checkbox" name="answer" value="${dto.questno },${number2 }" />${number2}</li>
				<li style="list-style:none;"><input onclick="check_only(this,${dto.questno })" type="checkbox" name="answer" value="${dto.questno },${number3 }" />${number3}</li>
				<li style="list-style:none;"><input onclick="check_only(this,${dto.questno })" type="checkbox" name="answer" value="${dto.questno },${number4 }" />${number4}</li>
			</ul>
		</td>
		</tr> 
	</c:if>
	
	<c:if test="${dto.qtype eq 'J' }">
	<tr>
		<td>
			<ul><li style="list-style:none;"><input type="hidden" name="answer" value="${dto.questno }*"/>
			<input type="text" name="answer" />
			</li></ul>
		</td>
		</tr> 
	</c:if>
	
	<c:if test="${dto.qtype eq 'OX' }">
	<tr>
		<td>
			<ul>
			<li style="list-style:none;"><input onclick="check_only(this,${dto.questno })" type="checkbox" name="answer" value="${dto.questno },O" />O</li>
			<li style="list-style:none;"><input onclick="check_only(this,${dto.questno })" type="checkbox" name="answer" value="${dto.questno },X" />X</li>
			</ul>
		</td>
		</tr> 
	</c:if>
</c:forEach>
</table>
</div>
</form>
</body>
</html>