<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../sol_header.jsp"%>

<script type="text/javascript">
function selectCheck(form){
	form.submit();
}
function monthDown(form){
 if(form.month.value>1){
	 form.month.value--;
 }else {
	 form.month.value=12;
	 form.year.value--;
 }
 form.submit();
}
function monthUp(form){
 if(form.month.value<12){
	 form.month.value++;
 }else {
	 form.month.value=1;
	 form.year.value++;
 }
 form.submit();
}
</script>
<script language="javascript">
function memoGo(lectureno,memodate){
      str = "/solproject/sol_mypage/memoGo.do?lectureno="+lectureno+"&memodate="+memodate;
      r = window.open(str, "메모목록", 'scrollbars=yes, resizeable=no, width=700, height=700');
    }
function videoGo(lectureno){
    str = "/solproject/sol_mypage/videoGo.do?lectureno="+lectureno;
    r = window.open(str, "강의목록", 'scrollbars=yes, resizeable=no, width=700, height=700');
  }
</script>

<%
//현재 날짜 정보 
Calendar cr = Calendar.getInstance();
int year = cr.get(Calendar.YEAR);
int month = cr.get(Calendar.MONTH);
int date = cr.get(Calendar.DATE);
 
//오늘 날짜
String today = year + ":" +(month+1)+ ":"+date; 
 
//선택한 연도 / 월
String input_year = request.getParameter("year");
String input_month = request.getParameter("month");
 
if(input_month != null){
 month = Integer.parseInt(input_month)-1;
}
if(input_year != null){
 year = Integer.parseInt(input_year);
}
// 1일부터 시작하는 달력을 만들기 위해 오늘의 연도,월을 셋팅하고 일부분은 1을 셋팅한다.
cr.set(year, month, 1);
 
// 셋팅한 날짜로 부터 아래 내용을 구함
 
// 해당 월의 첫날를 구함
int startDate = cr.getMinimum(Calendar.DATE);
 
// 해당 월의 마지막 날을 구함
int endDate = cr.getActualMaximum(Calendar.DATE);
 
// 1일의 요일을 구함
int startDay = cr.get(Calendar.DAY_OF_WEEK);
 
int count = 0;
%>

<form method="post" action="calendar.do?s_id=${id }" name="change">
<br/>
<div align="left">
	 '<strong>${name }</strong>(${id })'님의 한줄다짐  |  &nbsp;<STRONG>"${promise }"</strong>
	
</div>
<br/><br/>

<table width="400" cellpadding="2" cellspacing="0" border="0" align="center">
 <tr>
   <td align="center"><input type="button" value="◁" onClick="monthDown(this.form)"></td>
   
      <td  align="center">
      <select name="year" onchange="selectCheck(this.form)">
      <%
      for(int i=year-5;i<year+6;i++){
       String selected = (i == year)?"selected":"";
       String color = (i == year)?"#CCCCCC":"#FFFFFF";
         out.print("<option value="+i+" "+selected+" style=background:"+color+">"+i+"</option>");       
      }
      %>
      </select>
      
      <select name="month" onchange="selectCheck(this.form)">
      <%
      for(int i=1;i<=12;i++){
       String selected = (i == month+1)?"selected":"";
       String color = (i == month+1)?"#CCCCCC":"#FFFFFF";
         out.print("<option value="+i+" "+selected+" style=background:"+color+">"+i+"</option>");       
      }
      %>
      </select></td>
      
      <td><input type="button" value="▷" onClick="monthUp(this.form)"></td>
      
    </tr>
    <tr>
      <td align="center" colspan="3" style="font-weight: bold; width: 100%; font-size: 20px;"><a href="calendar.do?s_id=${id }">TODAY ${nowregdate} <%--  <%=today %> --%></font></a></td>
    </tr>
</table> 
</form>
 <!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
 
      <%--    강의들은날짜<br/>
        <c:forEach var="dto" items="${regdatelist }">
                <c:set var="regdate" value="${dto.regdate }" />
             <fmt:parseNumber var="parsedate" type="number"  value="${fn:substring(dto.regdate, 8 ,10) }" />
             <fmt:parseNumber var="parseyear" type="number" integerOnly="true"  value="${fn:substring(dto.regdate, 0 ,4) }" />
             <fmt:parseNumber var="parsemonth" type="number" integerOnly="true"  value="${fn:substring(dto.regdate, 5 ,7) }" />
         ${regdate }<br/>
        </c:forEach> 

        <br/> --%>
        
    들은강의목록<br/>
        <c:forEach var="lto" items="${lecturelist }">
        <c:set var="lregdate" value="${lto.regdate }" />
         <c:set var="lectureno" value="${lto.lectureno }" />
         <c:set var="subject" value="${lto.subject }" />
         <c:set var="poster" value="${lto.poster }" />
         <c:set var="teacher" value="${lto.teacher }" />
         
         ${lectureno } : ${subject } : ${poster } : ${teacher }: ${lregdate }<br/>
        </c:forEach> 
        
        <br/>     
        메모리스트<br/>
        <c:forEach var="list" items="${memolist }">
                <c:set var="memodate" value="${list.memodate }" />
                <c:set var="memo" value="${list.memo }" />
                <c:set var="lectureno" value="${list.lectureno }" />
             <fmt:parseNumber var="parsemdate" type="number"  value="${fn:substring(list.memodate, 8 ,10) }" />
             <fmt:parseNumber var="parsemyear" type="number" integerOnly="true"  value="${fn:substring(list.memodate, 0 ,4) }" />
             <fmt:parseNumber var="parsemmonth" type="number" integerOnly="true"  value="${fn:substring(list.memodate, 5 ,7) }" />
            
             
             ${memodate } : ${memo } : ${lectureno }<br/>
        </c:forEach>


 <!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
 
<div align="right"><img src="image/memo.png" width=20px height=28px/> 메모 | <img src="image/video.png" width=20px height=20px/>강의 |  <img src="image/thumb.png" width=18px height=18px/>학습도장</div>
        
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
  <td><font color="blue">토</font></td>
 </tr>
 
 
 <tr style='height: 50px; font-weight: bold;'>
 
 <!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
 
		

		
 
<%
for (int i=1;i<startDay;i++){ /* 날짜시작전 빈공간 */
 count++;
%>
        <td>&nbsp;</td>
<% 
}
%>


	
<%
for (int i=startDate;i<=endDate;i++){
 String bgcolor = (today.equals(year+":"+(month+1)+":"+i))? "#89c236" : "#FFFFFF";/* 오늘날짜음영 */
 String color=null; 
 if(count%7 == 0) color="red";
 else if(count%7 == 6) color="blue";
 else color="black";
 
 count++;
%> 
  <td bgcolor="<%=bgcolor %>">
  <font color=<%=color %>>

      <%=i %>)
  

  
   <!-- 오늘날짜랑 디비에들어있는 날짜가 같으면 출력해주기 --> 
  <c:forEach var="list" items="${memolist }">
  <c:set var="regdate" value="${fn:substring(list.regdate, 0 ,10) }" />
  <c:set var="ii" value="<%=i %>"/>
  <c:set var="iy" value="<%=input_year %>"/>
  <c:set var="im" value="<%=input_month %>"/>
  <c:set var="memodate" value="${list.memodate }" />
  <c:set var="memo" value="${list.memo }" />
  <c:set var="lectureno" value="${list.lectureno }" /> 
  <fmt:parseNumber var="lregdate" type="number"  value="${lto.regdate}" />
  <fmt:parseNumber var="parsedate" type="number"  value="${fn:substring(list.regdate, 8 ,10) }" />
  <fmt:parseNumber var="parseyear" type="number" integerOnly="true"  value="${fn:substring(list.regdate, 0 ,4) }" />
  <fmt:parseNumber var="parsemonth" type="number" integerOnly="true"  value="${fn:substring(list.regdate, 5 ,7) }" />
  
  <fmt:parseNumber var="parsemdate" type="number"  value="${fn:substring(list.memodate, 8 ,10) }" />
  <fmt:parseNumber var="parsemyear" type="number" integerOnly="true"  value="${fn:substring(list.memodate, 0 ,4) }" />
  <fmt:parseNumber var="parsemmonth" type="number" integerOnly="true"  value="${fn:substring(list.memodate, 5 ,7) }" />
                      		
		<c:if test="${ii == parsedate && iy == parseyear && im == parsemonth}">
		
             <a href="javascript:memoGo(${lectureno },${memodate })">
             <img src="image/memo.png" width=20px height=28px/></a>
		
			<a href=""> </a>
			${memo }|${memodate } <br/>
		
		
		     <a href="javascript:videoGo(${lectureno })">
             <img src="image/video.png" width=20px height=28px/></a>
		
            <a href=""></a>
             ${lectureno } , ${subject } , ${poster } , ${teacher }, ${lregdate }<br/>
        </c:if>

  </c:forEach>
  
  
  

  
  </font>
  </td>
  
  
  
<%
  if(count%7 == 0 && i < endDate){
%> 
 </tr>
 
 
 <tr  style='height: 50px; font-weight: bold;'>
<%
  }
}


while(count%7 != 0){ /* 날짜끝나고 빈공간 */
%>
       <td>&nbsp;</td>
<% 
count++;
 }
%>



<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

</tr>  
</table>
<%@ include file="../sol_footer.jsp"%>