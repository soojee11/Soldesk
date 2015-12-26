<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!--     <style type="text/css">

    #ads{
        margin-top:20px;
    }
    
    .tableRollOverEffect1{
        background-color:#f0f0f0;
        color:#000;
    }

    .tableRollOverEffect2{
        background-color:#ffffff;
        color:#000;
    }
    
    .tableRowClickEffect1{
        background-color:#99cc66;
        color:#000;
    }
    .tableRowClickEffect2{
        background-color:#00F;
        color:#000;
    }
    
    </style> -->
<script type="text/javascript">
var arrayOfRolloverClasses = new Array();
var arrayOfClickClasses = new Array();
var activeRow = false;
var activeRowClickArray = new Array();

function highlightTableRow()
{
    var tableObj = this.parentNode;
    if(tableObj.tagName!='TABLE')tableObj = tableObj.parentNode;

    if(this!=activeRow){
        this.setAttribute('origCl',this.className);
        this.origCl = this.className;
    }
    this.className = arrayOfRolloverClasses[tableObj.id];
    
    activeRow = this;
    
}

function clickOnTableRow()
{
    var tableObj = this.parentNode;
    if(tableObj.tagName!='TABLE')tableObj = tableObj.parentNode;        
    
    if(activeRowClickArray[tableObj.id] && this!=activeRowClickArray[tableObj.id]){
        activeRowClickArray[tableObj.id].className='';
    }
    this.className = arrayOfClickClasses[tableObj.id];
    
    activeRowClickArray[tableObj.id] = this;
            
}

function resetRowStyle()
{
    var tableObj = this.parentNode;
    if(tableObj.tagName!='TABLE')tableObj = tableObj.parentNode;

    if(activeRowClickArray[tableObj.id] && this==activeRowClickArray[tableObj.id]){
        this.className = arrayOfClickClasses[tableObj.id];
        return; 
    }
    
    var origCl = this.getAttribute('origCl');
    if(!origCl)origCl = this.origCl;
    this.className=origCl;
    
}
    
function addTableRolloverEffect(tableId,whichClass,whichClassOnClick)
{
    arrayOfRolloverClasses[tableId] = whichClass;
    arrayOfClickClasses[tableId] = whichClassOnClick;
    
    var tableObj = document.getElementById(tableId);
    var tBody = tableObj.getElementsByTagName('TBODY');
    if(tBody){
        var rows = tBody[0].getElementsByTagName('TR');
    }else{
        var rows = tableObj.getElementsByTagName('TR');
    }
    for(var no=0;no<rows.length;no++){
        rows[no].onmouseover = highlightTableRow;
        rows[no].onmouseout = resetRowStyle;
        
        if(whichClassOnClick){
            rows[no].onclick = clickOnTableRow; 
        }
    }
    
}
</script>  
<script language="javascript">
function lectureGo(lectureno){
      str = "/solproject/sol_player/player.do?lectureno="+lectureno;
      r = window.open(str, "학습하기", 'scrollbars=yes, resizeable=no, width=1500, height=700');
}
</script> 
</head>
<body>
       <p><div style="color: White;height:60px;padding-top: 12px; font: 20px arial, sans-serif;background-color: #99cc66; font-weight: bold;">
       &nbsp;&nbsp;&nbsp;<font size="9px">MyStudy List</font>_${name}(${id })
       </div>
 

<!-- 학년/과목/과목제목/내점수/경과시간/학습한날짜  -->
<table cellpadding=3 border=0 cellspacing=1 width=100% bgcolor=#dddddd class="table">
          <thead>
        <tr style="font-size: 14px; font-weight: bold;" bgcolor=#fafafa align="center">
            <td >학년</td>
            <td>과목</td>
            <td >문제지</td>
            <td >내점수</td>
            <td >경과시간</td>
            <td >학습일</td>
        </tr>
        </thead>
        
    <c:forEach var="list" items="${mystudylist }">
        <c:if test="${list.id == id }">
       
        <c:set var="regdt" value="${list.regdt }" />
        <c:set var="grade" value="${list.grade }" />
        <c:set var="subject" value="${list.subject }" />
        <c:set var="testtitle" value="${list.testtitle }" />
        <c:set var="usetime" value="${list.usetime }" />
        <c:set var="id" value="${list.id }" />
        <c:set var="myscore" value="${list.myscore }" />
        
        <fmt:parseNumber var="parsedate" type="number"  value="${fn:substring(list.regdt, 8 ,10) }" />
        <fmt:parseNumber var="parseyear" type="number" integerOnly="true"  value="${fn:substring(list.regdt, 0 ,4) }" />
        <fmt:parseNumber var="parsemonth" type="number" integerOnly="true"  value="${fn:substring(list.regdt, 5 ,7) }" />
        <fmt:parseNumber var="nowdate" type="number"  value="${fn:substring(now, 8 ,10) }" />
        <fmt:parseNumber var="nowyear" type="number" integerOnly="true"  value="${fn:substring(now, 0 ,4) }" />
        <fmt:parseNumber var="nowmonth" type="number" integerOnly="true"  value="${fn:substring(now, 5 ,7) }" />
     
       <c:if test="${parseyear == nowyear && parsemonth==nowmonth && parsedate==nowdate }">
        <tbody>
        <tr
         bgcolor="#ffffff" 
         onmouseover="this.style.backgroundColor='#fafafa'"
         onmouseout="this.style.backgroundColor='#ffffff'"  style="font-size: 14px;">

            <td align="center">${grade }</td>

            <td>
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
            <td align="center">${testtitle }</td>
            <c:if test="${myscore eq 100 }">
            <td align="center"><font color="red">${myscore }점<img src="image/thumb.png" width=14px height=14px/></font></td>
            </c:if>
            <c:if test="${myscore lt  100}">
            <td align="center" ><font color="black">${myscore }점</font></td>
            </c:if>
            
            <td align="center">${usetime }</td>
            <td align="center">${regdt }</td>


        </tr>
        
        </tbody>
          </c:if>  
          </c:if>
        </c:forEach>
 
</table><br>



<script type="text/javascript">
addTableRolloverEffect('myTable','tableRollOverEffect1','tableRowClickEffect1');
</script>

</body>
</html>