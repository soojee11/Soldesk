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

<script type="text/javascript">
function memoGo(now){
    str = "/solproject/sol_mypage/memoGo.do?now="+now;
    r = window.open(str, "Memo List", 'scrollbars=yes, resizeable=no, width=700, height=500');
  }


function videoGo(now){
    str = "/solproject/sol_mypage/videoGo.do?now="+now;
    r = window.open(str, "Lecture List", 'scrollbars=yes, resizeable=no, width=700, height=500');
  }
  
function mystudyGo(now){
    str = "/solproject/sol_mypage/mystudyGo.do?now="+now;
    r = window.open(str, "MyStudy List", 'scrollbars=yes, resizeable=no, width=700, height=500');
  }
</script>

<%-- <%
//현재 날짜 정보 
Calendar cr = Calendar.getInstance();
int year = cr.get(Calendar.YEAR);
int month = cr.get(Calendar.MONTH);
int date = cr.get(Calendar.DATE);
 
//오늘 날짜
String today = year + ":" +(month+1)+ ":"+date; 
cr.set(year, month, 1);
// 해당 월의 첫날를 구함
int startDate = cr.getMinimum(Calendar.DATE);
// 해당 월의 마지막 날을 구함
int endDate = cr.getActualMaximum(Calendar.DATE);
// 1일의 요일을 구함
int startDay = cr.get(Calendar.DAY_OF_WEEK);
int count = 0;
%> --%>



<h4>
<img src="../sol_img/go_right.png" width="20px"/>
<img src="../sol_img/logos/cal_desc.png" width="140px" height="50px">| <span style="font-size: 12px;">'<strong>${name }</strong>(${id })'님의 한줄다짐   &nbsp;"<STRONG>${promise }</strong>"</span>
</h4>

<form method="post" action="calendar.do?s_id=${id }" name="change">

<table width="100%" cellpadding="2" cellspacing="0" border="0" align="center">
<%-- <tr><td align="center" style="color:#000000">
     '<strong>${name }</strong>(${id })'님의 한줄다짐  |  &nbsp;<STRONG>"${promise }"</strong>
</td>
</tr> --%>
 <tr>
      <td  align="center">
      <input type="button" value="◁" onClick="monthDown(this.form)">
      <select name="year" onchange="selectCheck(this.form)">
<%--       <%
      for(int i=year-5;i<year+6;i++){
       String selected = (i == year)?"selected":"";
       String color = (i == year)?"#CCCCCC":"#FFFFFF";
         out.print("<option value="+i+" "+selected+" style=background:"+color+">"+i+"</option>");       
      }
      %>  --%>
      
      <c:forEach begin="${year -5 }" end="${year +5 }" var="val">
      <option value="${val}" ${val == year ? 'selected="selected"' : '' }> <c:out value="${val}"/></option>
       </c:forEach>
      </select>
      
      <select name="month" onchange="selectCheck(this.form)">
<%--    <%
      for(int j=1;j<=12;j++){
       String selected = (j == month+1)?"selected":"";
       String color = (j == month+1)?"#CCCCCC":"#FFFFFF";
         out.print("<option value="+j+" "+selected+" style=background:"+color+">"+j+"</option>");       
      
      }
      %> --%>
      
       <c:forEach begin="1" end="12" var="mth">
      <option value="${mth}" ${mth == month+1 ? 'selected="selected"' : '' }> <c:out value="${mth}"/></option>
       </c:forEach> 
      
      </select>
      
      <input type="button" value="▷" onClick="monthUp(this.form)"/></td>
    </tr>
    <tr>
      <td align="center" colspan="3" style="font-weight: bold; width: 100%; font-size: 20px;">
      <a href="calendar.do?s_id=${id }"> < TODAY ${nowregdate2}> </a></td>
    </tr>
    
    
</table> 
</form>
 <!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

        <c:forEach var="list" items="${lecturelist }">
        <c:if test="${list.id == id }">
        <c:set var="lregdate" value="${list.regdate }" />
        <c:set var="lectureno" value="${list.lectureno }" />
        <c:set var="subject" value="${list.subject }" />
        <c:set var="poster" value="${list.poster }" />
        <c:set var="teacher" value="${list.teacher }" />
        <c:set var="memodate" value="${list.memodate }" />
        <c:set var="memo" value="${list.memo }" />
        <c:set var="lectureno" value="${list.lectureno }" />
        <fmt:parseNumber var="parsemdate" type="number"  value="${fn:substring(list.memodate, 8 ,10) }" />
        <fmt:parseNumber var="parsemyear" type="number" integerOnly="true"  value="${fn:substring(list.memodate, 0 ,4) }" />
        <fmt:parseNumber var="parsemmonth" type="number" integerOnly="true"  value="${fn:substring(list.memodate, 5 ,7) }" />
            
                
     <%--     ${lectureno } : ${subject } : ${poster } : ${teacher }: ${lregdate } || ${memodate } : ${memo } : ${lectureno }<br/>
       --%> </c:if>
        </c:forEach> 
        
        <br/>     
     <c:set var="stamp" value="0"/>
    
 <!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
 
<div align="right"> <img src="image/btn_study_play.png" width=20px height=20px/> 강의 | <img src="image/pink.png" width=20px height=28px/> 메모   |  <img src="image/test.png" width=21px height=22px/>학습결과</div>
        
<table align="center" width=100% cellpadding="0" cellspacing="1"
	bgcolor="#cccccc" border="1">
		<tr style="font-weight: bold; width: 100%; height: 25px;"
		bgcolor="#99cc66" align="center">
  <td><font color="red">일</font></td>
  <td><font color="#000000">월</font></td>
  <td><font color="#000000">화</font></td>
  <td><font color="#000000">수</font></td>
  <td><font color="#000000">목</font></td>
  <td><font color="#000000">금</font></td>
  <td><font color="blue">토</font></td>
 </tr>
 
 <tr style='height: 70px; font-weight: bold;'> <!-- 첫쨰줄 -->
 
 
 
 <!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
 
<%-- <%
for (int i=1;i<startDay;i++){ /* 날짜시작전 빈공간 */
 count++;
%>
        <td>&nbsp;</td>
<% 
}
%> --%>
 
      <c:set var="newLine" value="0"/>

      <c:forEach begin="1" end="${startDay-1}" var="count"> <!-- 날짜시작전 빈공간 ->밀린다!!! -->
           <td>&nbsp;</td>
           <c:set var="count" value="${count}"/>
            <c:set var="newLine">${ newLine+1}</c:set> 
            
            
       </c:forEach> 
      
       
       
     
   <%--     <c:forEach begin="1" end="${week-1 }" var="i">
                        <td bgcolor='#ffffff'>&nbsp;</td>
                        <c:set var="newLine">${ newLine+1}</c:set> 
                    </c:forEach>
 --%>

   
      <c:forEach begin="${startDate}" end="${endDate}" var="i">
       
   <%--     
                  <c:if test="${year eq val && month eq mth && date eq i }">
                     <c:set var="bgcolor" value="#99cc66"/>
                  </c:if>
                  <c:if test="${year ne val && month ne mth}">
                     <c:set var="bgcolor" value="#FFFFFF"/>
                  </c:if> 
      --%>
     
 
     
                     <c:choose>
                            <c:when test="${year eq val && month eq mth && date eq i }">
                                <c:set var="bgcolor" value="#99cc66"/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="bgcolor" value="#ffffff"/>
                            </c:otherwise>
                        </c:choose>
     
     
      <%--             <c:if test="${count%7 eq 0 }">
                     <c:set var="color" value="red"/>
                  </c:if>
                  <c:if test="${count%7 eq 6}">
                     <c:set var="color" value="blue"/>
                  </c:if>
                   <c:if test="${count%7 ne 6  &&  count%7 ne 0 }">
                     <c:set var="color" value="black"/>
                  </c:if> --%>
                  
                  
                        <c:choose>
                            <c:when test="${(count-(7-(startDay-1)))%7 eq 0 }">
                                <c:set var="color" value="red"/>
                            </c:when>
                            <c:when test="${(count-(7-(startDay-1)))%7 eq 6}">
                                <c:set var="color" value="blue"/>
                            </c:when>
                            <c:when test="${(count-(7-(startDay-1)))%7 eq 7}">
                                <c:set var="color" value="blue"/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="color" value="black"/>
                            </c:otherwise>
                        </c:choose> 
                  
                  
                  <c:set var="newLine">${ newLine+1}</c:set>
                        
                        <c:if test="${i eq endDate }">
                            <c:choose>
                                <c:when test="${newLine gt 0 && newLine lt 7}">
                                    <c:forEach begin='${newLine }' end="6">
                                    <td bgcolor='#ffffff'>&nbsp;</td>
                                    <c:set var="newLine">${ newLine+1}</c:set>
                                    </c:forEach> 
                                </c:when>
                            </c:choose>
                        
                        </c:if>
                        
                        
                        
                    <c:set var="count">${ count+1}</c:set> 
                  <%--   <c:out value="${count}"/>   --%>
                  
    <!-- +++++++++++++++++++++++++++++++++++++++아이콘++++++++++++++++++++++++++++++++++++ --> 
             
    <!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ --> 
             
          <c:set var="count2" value="0"/>             
   <td bgcolor="${bgcolor}" width="14.28571428%" >
    
      
           
    
    <font color="${color}">
    
      ${i })
      
      
     
  <c:forEach var="rdt" items="${maxrdtlist }">
  
  
 <%--    <c:set var="count2">${count2+1}</c:set>
  ${count2 } --%>
  
   <c:set var="rdt_id" value="${rdt.id }" />
   <fmt:parseNumber var="parsedate" type="number"  value="${fn:substring(rdt.regdate, 8 ,10) }" />
   <fmt:parseNumber var="parseyear" type="number" integerOnly="true"  value="${fn:substring(rdt.regdate, 0 ,4) }" />
   <fmt:parseNumber var="parsemonth" type="number" integerOnly="true"  value="${fn:substring(rdt.regdate, 5 ,7) }" />
   <c:set var="regdate" value="${fn:substring(rdt.regdate, 0 ,10) }" />
   
   <c:if test="${parsemonth <10 && parsedate <10 }">
   <c:set var="now" value="${parseyear }00${parsemonth }00${parsedate }"/>
   </c:if>
   <c:if test="${parsemonth >=10 && parsedate >=10 }">
   <c:set var="now" value="${parseyear }0${parsemonth }0${parsedate }"/>
   </c:if>
   <c:if test="${parsemonth <10 && parsedate >=10 }">
   <c:set var="now" value="${parseyear }00${parsemonth }0${parsedate }"/>
   </c:if>
   <c:if test="${parsemonth >=10 && parsedate <10 }">
   <c:set var="now" value="${parseyear }0${parsemonth }00${parsedate }"/>
   </c:if>
   
   <c:set var="ii" value="${i }"/>
   <c:set var="iy" value="${year }"/>
   <c:set var="im" value="${month +1 }"/>
         <c:if test="${rdt_id == id }">
            <c:if test="${lecturelist != null}">
            <c:if test="${ii == parsedate && iy == parseyear && im == parsemonth}">
         <!--       <img src="image/thumb.png" width=18px height=18px/>학습도장
                -->
                
               <a href="javascript:videoGo(${now })">
                 <img src="image/btn_study_play.png" width=20px height=28px/></a> <!-- 강의리스트 -->
             
               <a href="javascript:memoGo(${now })">
                <img src="image/pink.png" width=20px height=28px/></a> <!-- 메모리스트 -->
               
                <c:if test="${maxregdatelist != null }">
                <c:forEach var="msl" items="${maxregdatelist }">
    <fmt:parseNumber var="msldate" type="number"  value="${fn:substring(msl.regdt, 8 ,10) }" />
   <fmt:parseNumber var="mslyear" type="number" integerOnly="true"  value="${fn:substring(msl.regdt, 0 ,4) }" />
   <fmt:parseNumber var="mslmonth" type="number" integerOnly="true"  value="${fn:substring(msl.regdt, 5 ,7) }" />
     <c:if test="${ii == msldate && iy == mslyear && im == mslmonth}">
        
               <a href="javascript:mystudyGo(${now })">
                <img src="image/test.png" width=21px height=22px/></a> <!-- 학습결과리스트 -->
                </c:if>
                
                </c:forEach>
                 </c:if>               
           </c:if>
           </c:if>
          </c:if>
          
  </c:forEach>
   
    <!-- +++++++++++++++++++++++++++++++++++++++++아이콘+++++++++++++++++++++++++++++++ -->
                    
 </font>
                   
 </td>
 
<!-- && i lt endDate -->

 <c:if test="${(count-(7-(startDay-1)))%7 == 0 }"> 
 </tr>
 <tr  style='height: 70px; font-weight: bold;'> <!--둘째줄부터  -->
 </c:if>
      
      
      
      
 </c:forEach> 
   
                  



                              <c:choose>
                                <c:when test="${(count-(7-(startDay-1)))%7gt 0 && (count-(7-(startDay-1)))%7 lt 7}">
                                    <c:forEach begin='${newLine }' end="6"> 
                                    <td bgcolor='#ffffff'>&nbsp;</td>
                                    <c:set var="newLine">${ newLine+1}</c:set>
                                     <c:set var="newLine" value="0"/>
                                    </c:forEach> 
                                </c:when>
                              </c:choose> 
   
        
<%--    while(count%7 != 0){ /* 날짜끝나고 빈공간 */
%>
       <td>&nbsp;</td>
<% 
count++;
 }
%> 
    --%>
   
   <%--   <c:forEach begin="1" end="${startDay-1}" var="count"> <!-- 날짜시작전 빈공간 -->
             <td>&nbsp;</td>
           <c:set var="count" value="${count}"/>
             <c:out value="${count}"/> |
       </c:forEach> 
 --%>
   
   
 
       
<%--        <c:if test="${count%7 ne 0 }"> <!--  날짜끝나고 빈공간 -->
         <c:forEach begin="${startDate}" end="${endDate}" var="count">
         <td>&nbsp;</td>
         </c:forEach> 
         +<c:out value="${count}"/>
        </c:if> 
         --%>
      
                                
        
<%--         
      <c:choose>
         <c:when test="${count%7 ne 0}">
         <c:forEach begin='${count }' end="6"> 
         <td bgcolor='#ffffff'>&nbsp;</td>
         </c:forEach> 
         </c:when>
      </c:choose> --%>

 

 
 </tr>
</table>
<%@ include file="../sol_footer.jsp"%>
  
  
  
<%--      

	
<%
for (int i=startDate;i<=endDate;i++){
 String bgcolor = (today.equals(year+":"+(month+1)+":"+i))? "#99cc66" : "#FFFFFF";/* 오늘날짜음영 */
 String color=null; 
 if(count%7 == 0) color="red";
 else if(count%7 == 6) color="blue";
 else color="black";
 
 count++;
%> 
  <td bgcolor="<%=bgcolor %>" width="14.285%" >
  <font color=<%=color %>>

      <%=i %>)
      <!-- +++++++++++++++++++++++++++++++++++++++아이콘++++++++++++++++++++++++++++++++++++ --> 
      
  <c:forEach var="rdt" items="${maxrdtlist }">
   <c:set var="rdt_id" value="${rdt.id }" />
  <fmt:parseNumber var="parsedate" type="number"  value="${fn:substring(rdt.regdate, 8 ,10) }" />
  <fmt:parseNumber var="parseyear" type="number" integerOnly="true"  value="${fn:substring(rdt.regdate, 0 ,4) }" />
  <fmt:parseNumber var="parsemonth" type="number" integerOnly="true"  value="${fn:substring(rdt.regdate, 5 ,7) }" />
  
   <c:set var="regdate" value="${fn:substring(rdt.regdate, 0 ,10) }" />
   <c:set var="now" value="${parseyear }0${parsemonth }0${parsedate }"/>
   <c:set var="ii" value="<%=i %>"/>
   <c:set var="iy" value="${year }"/>
   <c:set var="im" value="${month +1 }"/>
         <c:if test="${rdt_id == id }">
            <c:if test="${lecturelist != null}">
            <c:if test="${ii == parsedate && iy == parseyear && im == parsemonth}">
               <img src="image/thumb.png" width=18px height=18px/><!-- 학습도장 -->
           
	           <a href="javascript:videoGo(${now })">
	             <img src="image/btn_study_play.png" width=20px height=28px/></a> <!-- 강의리스트 -->
	         
	           <a href="javascript:memoGo(${now })">
	             <img src="image/pink.png" width=20px height=28px/></a> <!-- 메모리스트 -->
           </c:if>
          </c:if>
          </c:if>
     </c:forEach>
   
    <!-- +++++++++++++++++++++++++++++++++++++++++아이콘+++++++++++++++++++++++++++++++ -->
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
%> --%>
