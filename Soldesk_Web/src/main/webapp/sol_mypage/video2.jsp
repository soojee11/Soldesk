<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    
    <style type="text/css">

    #ads{
        margin-top:20px;
    }
    
    .tableRollOverEffect1{
        background-color:#dedede;
        color:#000;
    }

    .tableRollOverEffect2{
        background-color:#dedede;
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
    
    </style>
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
</head>
<body>
       <p><div style="color: White;height:50px;padding-top: 11px; font: 30px arial, sans-serif;background-color: #99cc66; font-weight: bold;">
       &nbsp;&nbsp;&nbsp;Lecture List</div>
   


<br/>
<table id="myTable" cellpadding=3 border=0 cellspacing=1 width=100% bgcolor=c0c0c0>
    <thead>
        <tr bgcolor=efefef>
            <th></th>
            <th></th>
            <th>subject</th>
            <th>선생님</th>
            <th>강의수강날짜</th>
          
        </tr>
    </thead>
    <tbody>
        <tr bgcolor=white>
            <td>John</td>
            <td>37</td>
            <td>Managing director</td>
            <td>90.000</td>
            <td>Male</td>
        </tr>
        <tr bgcolor=white>
            <td>Susan</td>
            <td>34</td>
            <td>Partner</td>
            <td>90.000</td>
            <td>Female</td>
        </tr>
        <tr bgcolor=white>
            <td>David</td>
            <td>29</td>
            <td>Head of production</td>
            <td>70.000</td>
            <td>Male</td>
        </tr>
        <tr bgcolor=white>
            <td>Laura</td>
            <td>29</td>
            <td>Head of marketing</td>
            <td>70.000</td>
            <td>Female</td>
        </tr>
        <tr bgcolor=white>
            <td>Kate</td>
            <td>18</td>
            <td>Marketing</td>
            <td>50.000</td>
            <td>Female</td>
        </tr>
        <tr bgcolor=white>
            <td>Mona</td>
            <td>21</td>
            <td>Marketing</td>
            <td>53.000</td>
            <td>Female</td>
        </tr>
    </tbody>
</table><br>



<script type="text/javascript">
addTableRolloverEffect('myTable','tableRollOverEffect1','tableRowClickEffect1');
addTableRolloverEffect('myTable2','tableRollOverEffect2','tableRowClickEffect2');
</script>

</body>
</html>