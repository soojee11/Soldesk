<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../sol_header.jsp"%>
<!-- page start-->

<link href="./css/style.css" rel="stylesheet" type="text/css">

<ul id="tabs">
    <li><a href="#" name="tab1">1학년</a></li>
    <li><a href="#" name="tab2">2학년</a></li>
    <li><a href="#" name="tab3">3학년</a></li>
    <li><a href="#" name="tab4">4학년</a></li>    
    <li><a href="#" name="tab5">5학년</a></li>    
    <li><a href="#" name="tab6">6학년</a></li>
        
</ul>

<div id="content"> 
    <div id="tab1">...</div>
    <div id="tab2">...</div>
    <div id="tab3">...</div>
    <div id="tab4">...</div>
    <div id="tab5">...</div>
    <div id="tab6">...</div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script>
$(document).ready(function() {
    $("#content").find("[id^='tab']").hide(); // Hide all content
    $("#tabs li:first").attr("id","current"); // Activate the first tab
    $("#content #tab1").fadeIn(); // Show first tab's content
    
    $('#tabs a').click(function(e) {
        e.preventDefault();
        if ($(this).closest("li").attr("id") == "current"){ //detection for current tab
         return;       
        }
        else{             
          $("#content").find("[id^='tab']").hide(); // Hide all content
          $("#tabs li").attr("id",""); //Reset id's
          $(this).parent().attr("id","current"); // Activate this
          $('#' + $(this).attr('name')).fadeIn(); // Show content for the current tab
        }
    });
});
</script>

<!-- page end-->
<%@ include file="../sol_footer.jsp"%>