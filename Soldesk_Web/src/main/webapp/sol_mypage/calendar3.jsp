<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../sol_header.jsp"%>
<%@ page import="java.util.*"%>
<%
	Calendar cal = Calendar.getInstance();
	int year = request.getParameter("y") == null ? cal.get(Calendar.YEAR)
			: Integer.parseInt(request.getParameter("y"));
	int month = request.getParameter("m") == null ? cal.get(Calendar.MONTH)
			: (Integer.parseInt(request.getParameter("m")) - 1);

	// 시작요일 확인
	// - Calendar MONTH는 0-11까지임
	cal.set(year, month, 1);
	int bgnWeek = cal.get(Calendar.DAY_OF_WEEK);

	// 다음/이전월 계산
	// - MONTH 계산시 표기월로 계산하기 때문에 +1을 한 상태에서 계산함
	int prevYear = year;
	int prevMonth = (month + 1) - 1;
	int nextYear = year;
	int nextMonth = (month + 1) + 1;

	// 1월인 경우 이전년 12월로 지정
	if (prevMonth < 1) {
		prevYear--;
		prevMonth = 12;
	}

	// 12월인 경우 다음년 1월로 지정
	if (nextMonth > 12) {
		nextYear++;
		nextMonth = 1;
	}
%>

<br />
<br />
<div align="left">
	| '<strong>${name }</strong>(${id })'님의 스터디캘린더 <Br /> | < 나의다짐|&nbsp;<STRONG>"${promise }"</strong>
	>
</div>
<br />
<div align="center"
	style="font-weight: bold; width: 100%; font-size: 20px;">
	<a href="./calendar.do?y=<%=prevYear%>&m=<%=prevMonth%>&s_id=${id }">◁</a>
	<%=year%>년
	<%=month + 1%>월 <a
		href="./calendar.do?y=<%=nextYear%>&m=<%=nextMonth%>&s_id=${id }">▷</a>
	<br /> <a
		href="calendar.do?year=${nowYear }&month=${nowMonth }&s_id=${id }">
		Today : ${nowYear }/${nowMonth }/${nowDay } </a>
</div>
<br />
<div align="right">(메모아이콘)메모 | (강의아이콘)강의 | (도장아이콘)학습도장</div>


<table align="center" width=100% cellpadding="0" cellspacing="1"
	bgcolor="#cccccc" border="1">
	<tr style="font-weight: bold; width: 100%; height: 25px;"
		bgcolor="#89c236" align="center">
		<td><font color="red">일</font></td>
		<td><font color="#000000">월</font></td>
		<td><font color="#000000">화</font></td>
		<td><font color="#000000">수</font></td>
		<td><font color="#000000">목</font></td>
		<td><font color="#000000">금</font></td>
		<td><font color="#000000">토</font></td>
	</tr>
	<tr style='height: 80px; font-weight: bold;'>
		<%
			// 시작요일까지 이동
			for (int i = 1; i < bgnWeek; i++)
				out.println("<td>&nbsp;</td>");

			// 첫날~마지막날까지 처리
			// - 날짜를 하루씩 이동하여 월이 바뀔때까지 그린다
			while (cal.get(Calendar.MONTH) == month) {
				out.println("<td>" + "|"+cal.get(Calendar.DATE) + "</td>");

				// 토요일인 경우 다음줄로 생성
				if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY)
					out.println("</tr><tr style='height: 80px; font-weight: bold;'>");

				// 날짜 증가시키지
				cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE) + 1);
			}

			// 끝날부터 토요일까지 빈칸으로 처리
			for (int i = cal.get(Calendar.DAY_OF_WEEK); i <= 7; i++)
				out.println("<td>&nbsp;</td>");
		%>
	</tr>
</table>

</td>
</tr>
</table>
<%@ include file="../sol_footer.jsp"%>