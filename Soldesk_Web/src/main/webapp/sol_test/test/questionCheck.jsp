<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${res>0 }">
	<script>
		alert("답안 제출을 완료하였습니다.");
	</script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBS 초중학</title>
<script src="../js/test.js"></script>
<link href="../css/test.css" rel="stylesheet">
</head>

<body>
	<div id="layer_fixed">
		<table cellspacing="0" cellpadding="0" style="width: 100%; height: 100%;">
			<tr>
	<td style="text-align:left; padding-left: 20px; padding-right: 20px;">
	<span style="color: #065B89;font-size: 25px;"><strong>EBS</strong></span> <span style="color: #73AB2D; font-size: 25px;"><strong>초등</strong></span>
		<!-- <img src="../img/ebslogo.PNG" align="left"/> -->
	</td>
				<td
					style="text-align: center; font-size: 25px; padding-left: 20px; padding-right: 20px;">
					${param.testtitle }</td>
				<td
					style="text-align: right; padding-left: 20px; padding-right: 20px;">
					<img src="../img/alarm.png" />경과시간<br /> <span id="clock"
					style="font: 20px bold;">${usetime }</span>
				</td>
			</tr>
		</table>
	</div>

	<div id="layer_fixed2">
		<table cellspacing="0" cellpadding="0" style="width:100%; height:100%; color:white;">
			<tr>
				<td align="center" valign="middle" style="font-size:24px;">${s_id }님의 점수는: <span style="color:red;"><strong>${myscore}점</strong></span> 입니다.</td>
			</tr>
		</table>

	</div>

	<c:forEach var="i" end="${recNo }" begin="1" step="1">
		<c:set var="recNo2" value="${recNo+1-i}" />

	</c:forEach>

	<div align="center" style="margin-top: 130px;">
		<table align="center" text-align="center" width="600px"  style="font-size:12px;">
			<c:set var="recNo" value="${recNo2-1 }" />
			<c:forEach var="dto" items="${list }">
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
					<c:forEach var="img2" items="${img }" varStatus="status">
					<c:if test="${status.count eq recNo }">
					<c:if test="${img2 eq 'wrong' }"><img src="../img/wrong.png"/>
					</c:if>
					<c:if test="${img2 eq 'ok' }"><img src="../img/ok.png"/></c:if>
					</c:if>
					</c:forEach>
					<span><strong>${recNo }. </strong></span>${dto.qtitle }</td>
				</tr>
				<c:if test="${dto.qtype eq 'G' }">
					<tr>
						<td><c:set var="example" value="${dto.example }" /> <%
 			String example = (String) pageContext.getAttribute("example");
 			String[] number = new String[5];
 			String[] str = example.split("/");
 			for (int idx = 0; idx < str.length; idx++) {
 				number[idx] = str[idx];
 				//System.out.print(number[idx]);
 			}

 			for (int idx = 0; idx < str.length; idx++) {
 				pageContext.setAttribute("number" + idx, number[idx]);
 
 			}
 %>


							<ul>
								<li style="list-style: none;"><input type="checkbox"
									name="answer" value="${dto.questno },${number0 }" 
									<c:choose><c:when  test="${dto.answer eq number0}" >checked</c:when></c:choose> disabled/>${number0}</li>
								<li style="list-style: none;"><input type="checkbox"
									name="answer" value="${dto.questno },${number1 }" 
									<c:choose><c:when  test="${dto.answer eq number1}" >checked</c:when></c:choose> disabled/>${number1}</li>
								<li style="list-style: none;"><input type="checkbox"
									name="answer" value="${dto.questno },${number2 }" 
									<c:choose><c:when  test="${dto.answer eq number2}" >checked</c:when></c:choose> disabled/>${number2}</li>
								<li style="list-style: none;"><input type="checkbox"
									name="answer" value="${dto.questno },${number3 }" 
									<c:choose><c:when  test="${dto.answer eq number3}" >checked</c:when></c:choose> disabled/>${number3}</li>
								<li style="list-style: none;"><input type="checkbox"
									name="answer" value="${dto.questno },${number4 }" 
									<c:choose><c:when  test="${dto.answer eq number4}" >checked</c:when></c:choose> disabled/>${number4}</li>
							</ul></td>
					</tr>
					<tr>
						<td>
							<table class="mytable">
								<tr>
									<td style="background-color: #FAFAD2;">해설</td>
								</tr>
								<tr>
									<td>
									<jsp:scriptlet>
									pageContext.setAttribute("cr", "\r");
									pageContext.setAttribute("lf", "\n");									
									pageContext.setAttribute("crlf", "\r\n");									
									</jsp:scriptlet>
									${fn:replace(dto.comment,crlf,'<br/>' }
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</c:if>

				<c:if test="${dto.qtype eq 'J' }">
					<tr>
						<td>
							<ul>
								<li style="list-style: none;"><input type="text"
									name="answer" value="${dto.answer }" readonly /></li>
							</ul>
						</td>
					</tr>
					<tr>
						<td>
							<table class="mytable">
								<tr>
									<td style="background-color: #FAFAD2;">해설</td>
								</tr>
								<tr>
									<td>${dto.comment }</td>
								</tr>
							</table>
						</td>
					</tr>
				</c:if>

				<c:if test="${dto.qtype eq 'OX' }">
					<tr>
						<td>
							<ul>
								<li style="list-style: none"><input type="checkbox"
									name="answer" value="${dto.questno },O" 
									<c:choose><c:when  test="${dto.answer eq 'O' }" >checked</c:when></c:choose> disabled/>O</li>
								<li style="list-style: none"><input type="checkbox"
									name="answer" value="${dto.questno },X" 
									<c:choose><c:when  test="${dto.answer eq 'X' }" >checked</c:when></c:choose>
									disabled/>X</li>
							</ul>
						</td>
					</tr>
					<tr>
						<td>
							<table class="mytable">
								<tr>
									<td style="background-color: #FAFAD2;">해설</td>
								</tr>
								<tr>
									<td>
											<jsp:scriptlet>
											pageContext.setAttribute("cr", "\r");
											pageContext.setAttribute("lf", "\n");									
											pageContext.setAttribute("crlf", "\r\n");									
											</jsp:scriptlet>
											${fn:replace(dto.comment,crlf,'<br/>') }
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>

</body>
</html>