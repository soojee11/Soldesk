<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../sol_header.jsp"%>

<br /><br />
<table align="center" cellpadding="2" cellspacing="1" 
         style="font-weight: bold; width:100%; font-size: 20px;">
	<tr>
		<td align="center"><a
			href="calendar.do?year=${preYear }&month=${preMonth } "
			target="_self">◀</a> <b>&nbsp;${year }년&nbsp;&nbsp;${month }월 </b> <a
			href="calendar.do?year=${nextYear }&month=${nextMonth}"
			target="_self">▶</a></td>
	</tr>
</table>
<br />

<!-- *************************************************************** -->

<div align="left">
	<a href="calendar.do?year=${nowYear }&month=${nowMonth }">  Today : ${nowYear }년${nowMonth }월${nowDay }일
	</a>
</div>

<div align="left">
<c:if test="${id != '' }">
'<strong>${name }</strong>(${id })'님의 다짐 : <strong> "${promise }"</strong>
</c:if>
</div>

<!-- *************************************************************** -->

<!-- 달력표시 -->
<div id=Cal>
	<table align="center" width=100% cellpadding="0" cellspacing="1"
		bgcolor="#cccccc" border="1">
		<tr style="font-weight: bold; width:100%; height:25px; " bgcolor="#e2e2e2" align="center">
			<td><font color="red">일</font></td>
			<td>월</td>
			<td>화</td>
			<td>수</td>
			<td>목</td>
			<td>금</td>
			<td><font color="blue">토</font></td>
		</tr>

<!-- *************************************************************** -->

		<c:set var="newLine" value="0" />
		<tr height='15px'>
			<c:forEach begin="1" end="${week-1 }" var="i">
				<td bgcolor='#ffffff'>&nbsp;</td>
				<c:set var="newLine">${ newLine+1}</c:set>
			</c:forEach>
			<c:set var="cnt" value="0" />
			<c:set var="b" value="${startDay }" />
			<c:forEach begin="${startDay}" end="${endDay}" var="i">
				<c:choose>
					<c:when test="${newLine==0 }"> <!-- 일 -->
						<c:set var="fontColor" value="red" />
					</c:when>
					<c:when test="${newLine==6 }"> <!-- 토 -->
						<c:set var="fontColor" value="blue" />
					</c:when>
					<c:otherwise>
						<c:set var="fontColor" value="black" /> <!-- 평일 -->
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when
						test="${nowYear }==${year }&&${nowMonth}==${month }&&${nowDay }==${i }">
						<c:set var="bgColor" value="#e6e6e6" />
					</c:when>
					<c:otherwise>
						<c:set var="bgColor" value="#ffffff" />
					</c:otherwise>
				</c:choose>
				<td align='center' bgcolor='${bgColor }'><font
					color='${fontColor}'><c:out value="${i }" /></font> <c:set
						var="newLine">${ newLine+1}</c:set> <c:if test="${i eq endDay }">
						<c:choose>
							<c:when test="${newLine gt 0 && newLine lt 7}">
								<c:forEach begin='${newLine }' end="6">
									<td bgcolor='#ffffff'>&nbsp;</td>
									<c:set var="newLine">${ newLine+1}</c:set>
								</c:forEach>
							</c:when>
						</c:choose>

					</c:if> <c:if test="${newLine==7}">
		</tr>
		
<!-- *************************************************************** -->
	<!-- 빈공간  -->	
		
		<tr height='40px'>
			<c:set var="newLine" value="0" />
			<c:if test="${i < 7}">
				<c:forEach begin="1" end="${week-1}" var="z">
					<td bgcolor='#ffffff'>&nbsp;</td>
					<c:set var="newLine">${ newLine+1}</c:set>
				</c:forEach>
			</c:if>
			<c:set var="doneLoop" value="false" />

			<c:forEach begin="${b }" end="${endDay }" var="a" varStatus="z">
				<c:if test="${not doneLoop}">
					<c:set var="cnt">${cnt+1}</c:set>
					<c:set var="c_day">
						<c:choose>
							<c:when test="${a<10 }">
											0${a }
										</c:when>
							<c:otherwise>
											${a }
										</c:otherwise>
						</c:choose>
					</c:set>
					<c:set var="c_month">
						<c:choose>
							<c:when test="${month<10 }">
											0${month }
										</c:when>
							<c:otherwise>
											${month }
										</c:otherwise>
						</c:choose>
					</c:set>
					<c:set var="r_d">
								${year}${c_month }${c_day }
								</c:set>

					<%--이후 년도 표시 --%>
					<c:if test="${year gt nowYear}">
						<td align='center' bgcolor=${bgColor }><font color="#8C8C8C"> ##
						</font></td>
						<c:set var="newLine">${ newLine+1}</c:set>
					</c:if>

					<%--현재 년도 --%>
					<c:if test="${year eq nowYear }">
						<c:if test="${month gt nowMonth }">
							<td align='center' bgcolor=${bgColor }><font color="#8C8C8C"> 
							</font></td>
							<c:set var="newLine">${ newLine+1}</c:set>
						</c:if>
						<c:if test="${month eq nowMonth }">
							<c:if test="${a ge nowDay }">
								<td align='center' bgcolor=${bgColor }><font
									color="#8C8C8C"> 
								</font></td>
								<c:set var="newLine">${ newLine+1}</c:set>
							</c:if>
						</c:if>


<!-- 이전달까지 표시 -->
						<c:if test="${month lt nowMonth }">
							<td align='center' bgcolor=${bgColor }><font color="#5D5D5D">@@
							</font></td>
							<c:set var="newLine">${ newLine+1}</c:set>
						</c:if>
					</c:if>


					<%--이전 년도 --%>
					<c:if test="${year lt nowYear }">
						<td align='center' bgcolor=${bgColor }><font color="#5D5D5D">
						</font></td>
						<c:set var="newLine">${ newLine+1}</c:set>
					</c:if>

					<c:set var="r_status" value="" />
					<c:if test="${newLine==7 }">
		</tr>
		
<!-- *************************************************************** -->
		
		
		<tr height='15px'>
			<c:set var="b">${i+1 }</c:set>
			<c:set var="doneLoop" value="true" />
			</c:if>
			</c:if>
			</c:forEach>

			<c:choose>
				<c:when test="${newLine gt 0 && newLine lt 7}">
					<c:forEach begin='${newLine }' end="6">
						<td bgcolor='#ffffff'>&nbsp;</td>
						<c:set var="newLine">${ newLine+1}</c:set>
					</c:forEach>
				</c:when>
			</c:choose>

			<c:set var="newLine" value="0" />
			</c:if>
			</c:forEach>
			
	</table>
</div>

<Br />
<Br />
<Br />
<!-- page end-->
<%@ include file="../sol_footer.jsp"%>