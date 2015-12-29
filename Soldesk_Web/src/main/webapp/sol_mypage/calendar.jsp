<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../sol_header.jsp"%>

   <meta name="viewport" content="width=device-width, initial-scale=1">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
   <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
 <script src="http://code.jquery.com/jquery-latest.js"></script>
     <script src="js/bootstrap.min.js"></script> 

<!--  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
 -->


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


<script language="javascript">
function lectureGo(lectureno){
      str = "/solproject/sol_player/player.do?lectureno="+lectureno;
      r = window.open(str, "학습하기", 'scrollbars=yes, resizeable=no, width=1500, height=700');
}
</script> 




<img src="../sol_img/go_right.png" width="20px"/>
<img src="../sol_img/logos/cal_desc.png" width="140px" height="50px">| <span style="font-size: 12px;">'<strong>${name }</strong>(${id })'님의 다짐   &nbsp;"<STRONG>${promise }</strong>"</span>

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
      <option value="${val}" ${val == year ? 'selected="selected"' : '' }> 
      <c:out value="${val}"/>
      </option>
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
       <option value="${mth}" ${mth == month+1 ? 'selected="selected"' : '' }> 
       <c:out value="${mth}"/>
       </option>
       </c:forEach> 
      
      </select>
      
      <input type="button" value="▷" onClick="monthUp(this.form)"/></td>
    </tr>
    <tr>
      <td align="center" colspan="3" style="font-weight: bold; width: 100%; font-size: 18px;">
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
       --%> 
       </c:if>
        </c:forEach> 
        
        <br/>     
     <c:set var="stamp" value="0"/>
    
    
 <!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
 
<div align="right"> <img src="image/btn_study_play.png" width=20px height=20px/> 강의 | <img src="image/pink.png" width=20px height=28px/> 메모   |   <img src="image/test.png" width=20px height=20px/> 학습결과</div>
        
<table align="center" width=100% cellpadding="0" cellspacing="1"
	 border="1">
	
		<tr style=" width: 100%; height: 25px;"
		bgcolor="#99cc66" align="center">
		
  <td><font color="red">일</font></td>
  <td><font color="#000000">월</font></td>
  <td><font color="#000000">화</font></td>
  <td><font color="#000000">수</font></td>
  <td><font color="#000000">목</font></td>
  <td><font color="#000000">금</font></td>
  <td><font color="blue">토</font></td>
 </tr>
 
 <tr style='height: 70px; '> <!-- 첫쨰줄 -->
 
 
 
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

      <c:forEach begin="1" end="${startDay-1}" var="count"> <!-- 날짜시작전 빈공간  -->
           <td>&nbsp;</td>
           <c:set var="count" value="${count}"/>
           <c:set var="newLine">${ newLine+1}</c:set> 
               
      </c:forEach> 
     
     
       
     
     
     
   <%--     <c:forEach begin="1" end="${week-1 }" var="i">
                        <td bgcolor='#ffffff'>&nbsp;</td>
                        <c:set var="newLine">${ newLine+1}</c:set> 
                    </c:forEach>
   --%>
   
 
   <fmt:parseNumber var="todaydate" type="number"  value="${fn:substring(today, 8 ,10) }" />
   <fmt:parseNumber var="todayyear" type="number" integerOnly="true"  value="${fn:substring(today, 0 ,4) }" />
   <fmt:parseNumber var="todaymonth" type="number" integerOnly="true"  value="${fn:substring(today, 5 ,7) }" />
   <!-- 고정년월일  -->
   <c:if test="${todaymonth <10 && todaydate <10 }">
   <c:set var="todaynow" value="${todayyear }00${todaymonth }00${todaydate }"/>
   </c:if>
   <c:if test="${todaymonth >=10 && todaydate >=10 }">
   <c:set var="todaynow" value="${todayyear }0${todaymonth }0${todaydate }"/>
   </c:if>
   <c:if test="${todaymonth <10 && todaydate >=10 }">
   <c:set var="todaynow" value="${todayyear }00${todaymonth }0${todaydate }"/>
   </c:if>
   <c:if test="${todaymonth >=10 && todaydate <10 }">
   <c:set var="todaynow" value="${todayyear }0${todaymonth }00${todaydate }"/>
   </c:if>
   
   <!-- 변경년월일  -->
   <c:if test="${month+1 <10 && date <10 }">
   <c:set var="nowymd" value="${year }00${month+1 }00${date }"/>
   </c:if>
   <c:if test="${month+1 >=10 && date >=10 }">
    <c:set var="nowymd" value="${year }0${month+1 }0${date }"/>
   </c:if>
   <c:if test="${month+1 <10 && date >=10 }">
    <c:set var="nowymd" value="${year }00${month+1 }0${date }"/>
   </c:if>
   <c:if test="${month+1 >=10 && date <10 }">
    <c:set var="nowymd" value="${year }0${month+1 }00${date }"/>
   </c:if>

  <!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
   
   
 
   
 <%--      <c:forEach begin="${startDate}" end="${endDate}" var="i"> --%>
   <c:forEach begin="${startDate}" end="${42-newLine}" var="i">
       
   <%--     
                  <c:if test="${year eq val && month eq mth && date eq i }">
                     <c:set var="bgcolor" value="#99cc66"/>
                  </c:if>
                  <c:if test="${year ne val && month ne mth}">
                     <c:set var="bgcolor" value="#FFFFFF"/>
                  </c:if> 
      --%>
                       <c:choose>
                            <c:when test="${nowymd eq  todaynow && date eq i}">
                                <c:set var="bgcolor" value="#99cc66"/>
                                
                            </c:when> 
                            <c:when test="${i gt endDate}"> <!-- 달력외부 -->
                                <c:set var="bgcolor" value="#fafafa"/>
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
                  
                       <%-- <c:if test="${(count-(7-(startDay-1)))%7 eq 6}">
                        <c:set var="color" value="blue"/>
                       </c:if> --%>
                  
                  
                        <c:choose>
                            <c:when test="${(count-(7-(startDay-1)))%7 eq 0 }">
                                <c:set var="color" value="red"/>
                            </c:when>
                            <c:when test="${(count-(7-(startDay-1)))%7 eq 6}">
                                <c:set var="color" value="blue"/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="color" value="black"/>
                            </c:otherwise>
                        </c:choose> 
                       
                        <c:if test="${(count-(6-(startDay-1)))%7 == 0 }"><!-- 첫줄토요일 -->
                            <c:set var="color" value="blue"/>
                        </c:if> 
                  
                  
                  
                        <c:if test="${i gt endDate }">
   
                            <c:set var="color" value="#fafafa"/>
                            <c:set var="i">0</c:set> 
                            
                        </c:if> 
                  
                  
                  
                  
                  <c:set var="newLine">${ newLine+1}</c:set>
                  <c:set var="count">${ count+1}</c:set> 
                  <%--   <c:out value="${count}"/>   --%>
                  
                  
                  
    <!-- +++++++++++++++++++++++++++++++++++++++아이콘++++++++++++++++++++++++++++++++++++ --> 
    <!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ --> 
             
        
    <td bgcolor="${bgcolor}" width="14.28571428%" >
    <font color="${color}">
    
      &nbsp;${i })
   
      
   <c:set var="ii" value="${i }"/>
   <c:set var="iy" value="${year }"/>
   <c:set var="im" value="${month +1 }"/>
      
   <c:if test="${maxregdtlist ne null || maxrdtlist ne null}">
  
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
   

         <c:if test="${rdt_id == id }">
            <c:if test="${lecturelist != null}">
            <c:if test="${ii == parsedate && iy == parseyear && im == parsemonth}">
                
             <%--   <a href="javascript:videoGo(${now })">
                 <img src="image/btn_study_play.png" width=20px height=28px/></a> <!-- 강의리스트 --> 
              --%>
             
                 
             
  <!-- ●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●강의모달●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●● --> 
 
     
     
       <!--Lecture Modal -->
 <span class="container">
<!--   <button type="button" class="btn btn-lecture btn-sm" data-toggle="modal" data-target="#${now }lecture">
<img src="image/btn_study_play.png" width=20px height=28px/>
</button> -->

  <span data-toggle="modal" data-target="#${now }lecture">
<img src="image/btn_study_play.png" width=20px height=28px/>
</span>


  <span class="modal fade" id="${now }lecture" role="dialog"  ">
    <span class="modal-dialog">
    
      <!-- Lecture Modal content-->
      <span class="modal-content">
        <span class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><font size="9px">Lecture List</font>_${name}(${id })</h4>
        </span>
        <div class="modal-body">
         
			<table cellpadding=3 border=0 cellspacing=1 width=100% bgcolor=#dddddd class="table">
			          <thead>
			        <tr style="font-size: 14px; font-weight: bold;" bgcolor=#fafafa align="center">
			            <td >회차</td>
			            <td>강의명</td>
			            <td >선생님</td>
			            <td >수강일</td>
			            <td width="14%">복습하기</td>
			        </tr>
			        </thead>
			        
			        <c:forEach var="list" items="${videolist }">
			        <c:if test="${list.id == id }">
			        <c:set var="lregdate" value="${list.regdate }" />
			        <c:set var="lectureno" value="${list.lectureno }" />
			        <c:set var="subject" value="${list.subject }" />
			        <c:set var="poster" value="${list.poster }" />
			        <c:set var="teacher" value="${list.teacher }" />
			        <c:set var="memodate" value="${list.memodate }" />
			        <c:set var="memo" value="${list.memo }" />
			        <c:set var="id" value="${list.id }" />
			        <c:set var="lectureno" value="${list.lectureno }" />
                    
			        <fmt:parseNumber var="listdate" type="number"  value="${fn:substring(list.regdate, 8 ,10) }" />
			        <fmt:parseNumber var="listyear" type="number" integerOnly="true"  value="${fn:substring(list.regdate, 0 ,4) }" />
			        <fmt:parseNumber var="listmonth" type="number" integerOnly="true"  value="${fn:substring(list.regdate, 5 ,7) }" />
			        
			         <c:if test="${ii == listdate && iy == listyear && im == listmonth}">
           
			        <tbody>
			        <tr
			         bgcolor="#ffffff" 
			         onmouseover="this.style.backgroundColor='#fafafa'"
			         onmouseout="this.style.backgroundColor='#ffffff'"  style="font-size: 14px;">
			
			            <td align="center" width="9%">${lectureno }</td>
			            <td align="center" width="40%">${subject }</td>
			            <td align="center">${teacher }</td>
			            <td align="center">${listyear }/${listmonth }/${listdate }</td>
			            <td align="center">  <a href="javascript:lectureGo(${lectureno })">
			               <img src='image/btn_study_play.png' width="30" height="30"></a>
			            </td>
			        </tr>
			        </tbody>
			         </c:if>   
			        </c:if>
			        </c:forEach>
			</table>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </span>
    </span>
  </span>
 </span>
 <!-- //Lecture Modal --> 
 

            
            
    <!-- ●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●//강의모달●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●● --> 
             
             
             
             
    <!-- ●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●메모모달●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●● --> 
     
     
     
       <!--Lecture Modal -->
 <span class="container">
<!--   <button type="button" class="btn btn-memo btn-sm" data-toggle="modal" data-target="#${now }memo">
<img src="image/pink.png" width=20px height=28px/>
</button> -->

  <span   data-toggle="modal" data-target="#${now }memo">
<img src="image/pink.png" width=20px height=28px/>
</span>


  <span class="modal fade" id="${now }memo" role="dialog">
    <span class="modal-dialog">
    
      <!-- Lecture Modal content-->
      <span class="modal-content">
        <span class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><font size="9px">Memo List</font>_${name}(${id })</h4>
        </span>
        <div class="modal-body">
         
          <table cellpadding=3 border=0 cellspacing=1 width=100% bgcolor=#dddddd class="table">
		    
		    <thead>
		        <tr align="center" bgcolor="#fafafa" style="font-weight: bold; font-size: 14px;">
		            <td width="9%" >회차</td>
		            <td width="20%">강의명</td>
		            <td width="40%">메모</td>
		            <td>등록일</td>
		            <td width="14%">복습하기</td>
		        </tr>
		    </thead>
		    
		       <c:forEach var="mlist" items="${modalmemolist }">
		    <c:set var="memodatee" value="${mlist.memodate }" />
		    
		        <c:if test="${mlist.id == id }">
		        <c:set var="lregdate" value="${mlist.regdate }" />
		        <c:set var="lectureno" value="${mlist.lectureno }" />
		        <c:set var="subject" value="${mlist.subject }" />
		        <c:set var="poster" value="${mlist.poster }" />
		        <c:set var="teacher" value="${mlist.teacher }" />
		        
		        <c:set var="memo" value="${mlist.memo }" />
		        <c:set var="id" value="${mlist.id }" />
		        <c:set var="lectureno" value="${mlist.lectureno }" />
		        
		        <fmt:parseNumber var="memodate" type="number"  value="${fn:substring(mlist.regdate, 8 ,10) }" />
		        <fmt:parseNumber var="memoyear" type="number" integerOnly="true"  value="${fn:substring(mlist.regdate, 0 ,4) }" />
		        <fmt:parseNumber var="memomonth" type="number" integerOnly="true"  value="${fn:substring(mlist.regdate, 5 ,7) }" />
		        <fmt:parseNumber var="nowdate" type="number"  value="${fn:substring(now, 8 ,10) }" />
		        <fmt:parseNumber var="nowyear" type="number" integerOnly="true"  value="${fn:substring(now, 0 ,4) }" />
		        <fmt:parseNumber var="nowmonth" type="number" integerOnly="true"  value="${fn:substring(now, 5 ,7) }" />
		     
		        <fmt:parseNumber var="mdate" type="number"  value="${fn:substring(mlist.memodate, 8 ,10) }" />
                <fmt:parseNumber var="myear" type="number" integerOnly="true"  value="${fn:substring(mlist.memodate, 0 ,4) }" />
                <fmt:parseNumber var="mmonth" type="number" integerOnly="true"  value="${fn:substring(mlist.memodate, 5 ,7) }" />
                    
                   
		     
		       <c:if test="${memoyear == nowyear && memomonth==nowmonth && memodate==nowdate }">
		      <tbody>
		        <tr
		         bgcolor="#ffffff" 
		         onmouseover="this.style.backgroundColor='#fafafa'"
		         onmouseout="this.style.backgroundColor='#ffffff'" style="font-size: 14px;">
		            <td align="center">${lectureno }</td>
		            <td align="center">${subject }</td>
		            
		            
		                        <c:choose>
		                            <c:when test="${memo eq ''}">
		                               <td align="center" width="40%">등록된 메모가 없습니다.</td>
		                            </c:when>
		                             <c:otherwise>
		                              <td align="center" width="40%">${memo }</td>
		                            </c:otherwise>
		                        </c:choose> 
		                      
		            
		            
		                     <c:choose>
                                    <c:when test="${memo eq ''}">
                                        <td align="center"></td>
                                    </c:when>
                                     <c:otherwise>
                                      <td align="center">${myear }/${mmonth }/${mdate }</td>
                                    </c:otherwise>
                                </c:choose> 
		            
		            
		            <td align="center">  <a href="javascript:lectureGo(${lectureno })">
		                <img src='image/btn_study_play.png' width="30" height="30"></a>
		            </td>
		        </tr>
		      </tbody>
		          </c:if>  
		          </c:if>
		        </c:forEach>
				</table>
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </span>
    </span>
  </span>
 </span>
 <!-- //Lecture Modal -->
            
            
    <!-- ●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●//메모모달●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●● --> 
        
             
             
<%--              <a href="javascript:videoGo(${now })">
             <img src="image/btn_study_play.png" width=20px height=28px/></a> <!-- 강의리스트 --> 
             
                <a href="javascript:memoGo(${now })">
                <img src="image/pink.png" width=20px height=28px/></a> <!-- 메모리스트 -->
              --%>
           </c:if>
           </c:if>
          </c:if>
          
   </c:forEach>
   </c:if>
   
   
  
   
   
   
    <!-- 학습결과리스트 -->
   <c:if test="${maxregdtlist ne null }">
   <c:forEach var="msl" items="${maxregdtlist }">
   <fmt:parseNumber var="msldate" type="number"  value="${fn:substring(msl.regdt, 8 ,10) }" />
   <fmt:parseNumber var="mslyear" type="number" integerOnly="true"  value="${fn:substring(msl.regdt, 0 ,4) }" />
   <fmt:parseNumber var="mslmonth" type="number" integerOnly="true"  value="${fn:substring(msl.regdt, 5 ,7) }" />
   
   <c:if test="${mslmonth <10 && msldate <10 }">
   <c:set var="now" value="${mslyear }00${mslmonth }00${msldate }"/>
   </c:if>
   <c:if test="${mslmonth >=10 && msldate >=10 }">
   <c:set var="now" value="${mslyear }0${mslmonth }0${msldate }"/>
   </c:if>
   <c:if test="${mslmonth <10 && msldate >=10 }">
   <c:set var="now" value="${mslyear }00${mslmonth }0${msldate }"/>
   </c:if>
   <c:if test="${mslmonth >=10 && msldate <10 }">
   <c:set var="now" value="${mslyear }0${mslmonth }00${msldate }"/>
   </c:if>
   
 
 <c:if test="${ii eq msldate && iy eq mslyear && im eq mslmonth }">
          
    <!-- ●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●학습결과모달●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●● --> 
     
       <!--mystudy Modal -->
 <span class="container" >
<!--   <button type="button" class="btn btn-mystudy btn-sm" data-toggle="modal" data-target="#${now }study">
  <img src="image/test.png" width=20px height=20px/>
</button> -->

  <span  data-toggle="modal" data-target="#${now }study">
<img src="image/test.png" width=20px height=28px/>
</span>

  <span class="modal fade" id="${now }study" role="dialog">
    <span class="modal-dialog">
    
      <!-- Lecture Modal content-->
      <span class="modal-content">
        <span class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><font size="9px">MyStudy List</font>_${name}(${id })</h4>
        </span>
        <div class="modal-body">
         
         
         
<!-- 학년/과목/과목제목/내점수/경과시간/학습한날짜  -->
<table cellpadding=3 border=0 cellspacing=1 width=100% bgcolor=#dddddd class="table">
          <thead>
        <tr style="font-size: 14px; font-weight: bold;" bgcolor=#fafafa align="center">
            <td >학년</td>
            <td>과목</td>
            <td >문제지</td>
            <td >점수</td>
            <td >경과시간</td>
            <td >학습일</td>
        </tr>
        </thead>
        
    <c:forEach var="slist" items="${mystudylist }">
        <c:if test="${slist.id == id }">
       
        <c:set var="regdt" value="${slist.regdt }" />
        <c:set var="grade" value="${slist.grade }" />
        <c:set var="subject" value="${slist.subject }" />
        <c:set var="testtitle" value="${slist.testtitle }" />
        <c:set var="usetime" value="${slist.usetime }" />
        <c:set var="id" value="${slist.id }" />
        <c:set var="myscore" value="${slist.myscore }" />
        
        <fmt:parseNumber var="slistdate" type="number"  value="${fn:substring(slist.regdt, 8 ,10) }" />
        <fmt:parseNumber var="slistyear" type="number" integerOnly="true"  value="${fn:substring(slist.regdt, 0 ,4) }" />
        <fmt:parseNumber var="slistmonth" type="number" integerOnly="true"  value="${fn:substring(slist.regdt, 5 ,7) }" />
        <fmt:parseNumber var="nowdate" type="number"  value="${fn:substring(now, 8 ,10) }" />
        <fmt:parseNumber var="nowyear" type="number" integerOnly="true"  value="${fn:substring(now, 0 ,4) }" />
        <fmt:parseNumber var="nowmonth" type="number" integerOnly="true"  value="${fn:substring(now, 5 ,7) }" />
     
       <c:if test="${slistyear == nowyear && slistmonth==nowmonth && slistdate==nowdate }">
        <tbody>
        <tr
         bgcolor="#ffffff" 
         onmouseover="this.style.backgroundColor='#fafafa'"
         onmouseout="this.style.backgroundColor='#ffffff'"  style="font-size: 14px;">

            <td align="center" width="9%">${grade }</td>

            <td width="10%">
                      <c:choose>
                            <c:when test="${subject eq 'kor' }">
                                                                   국어
                            </c:when>
                            <c:when test="${subject eq 'mat' }">
                                                                    수학
                            </c:when>
                             <c:when test="${subject eq 'soc' }">
                                                                        사회
                            </c:when>
                            <c:otherwise>
                                                                          과학
                            </c:otherwise>
                        </c:choose> 

           </td>
	           <td align="center"  width="30%">${testtitle }</td>
	           <c:if test="${myscore eq 100 }">
	           <td align="center" width="13%"><font color="red">${myscore }<img src="image/thumb.png" width=14px height=14px/></font></td>
	           </c:if>
	           <c:if test="${myscore lt  100}">
	           <td align="center" width="13%">${myscore }점</td>
	           </c:if>
	           
            <td align="center"  width="20%">${usetime }</td>
            <td align="center">${slistyear }/${slistmonth }/${slistdate }</td>


        </tr>
        
        </tbody>
          </c:if>  
          </c:if>
        </c:forEach>
 
</table>
         
         
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </span>
    </span>
  </span>
 </span>
 <!-- //Lecture Modal -->
            
            
    <!-- ●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●//학습결과모달●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●● --> 
   
       <%--  <a href="javascript:mystudyGo(${now })">
        <img src="image/test.png" width=21px height=22px/></a> <!-- 학습결과리스트 --> --%>
     </c:if>
 </c:forEach> 
</c:if> 




    <!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ --> 
    <!-- +++++++++++++++++++++++++++++++++++++++++아이콘시작+++++++++++++++++++++++++++++++ -->
                   
 </font>
                   
 </td>
 
<!-- && i lt endDate -->


 <c:if test="${(count-(7-(startDay-1)))%7 == 0 }"> 
 </tr>
 <tr  style='height: 70px; '> <!--둘째줄부터  -->
 </c:if>
      
     
      
 </c:forEach> 



   <%--      <c:choose>    <!--  날짜끝나고 빈공간 -->
         <c:when test="${(count-(7-(startDay-1)))%7 gt 0 && (count-(7-(startDay-1)))%7 lt 7}">
        <c:when test="${(count-(7-(startDay-1)))%7 gt 0 && (count-(7-(startDay-1)))%7 lt 7}">
          <c:forEach begin='${newLine }' end="6"> 
             <td bgcolor='#ffffff'>&nbsp;</td>
             <c:set var="newLine">${ newLine+1}</c:set>
             <c:set var="newLine" value="0"/>
          </c:forEach> 
         </c:when>
        </c:choose>  --%>


        
     <%--     <c:if test="${(count-(7-(startDay-1)))%7  ne 0 }"> <!--  날짜끝나고 빈공간 -->
         <c:forEach begin="${endDate }" end="${42-newLine }" >
         <td>&nbsp;</td>
         </c:forEach> 
        </c:if>  --%>
  
</tr>
</table>

<%@ include file="../sol_footer.jsp"%>

  
  
<%-- <%
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
%>  --%>
