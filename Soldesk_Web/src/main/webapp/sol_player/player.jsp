<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>학습하기</title>
<!--  한글 웹 폰트 적용-->
    <link rel='stylesheet' href='http://fonts.googleapis.com/earlyaccess/jejugothic.css'>
    <style type="text/css">
     td, .memo{
        font-family:'Jeju Gothic', sans-serif;
        font-size:10pt;
    }
    .button{
        font-family:'Jeju Gothic', sans-serif;
        font-size:11pt;
    }
    </style>
<!-- 한글 웹 폰트 적용 끝 -->
    </style>
<!-- 한글 웹 폰트 적용 끝 -->
<link href="../sol_css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../sol_css/player.css" rel="stylesheet" type="text/css">
<link href="../sol_css/main.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script> 
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="../sol_js/playerScript.js"></script>
<script>
function reset(){
	$("#memo").val('');
	$("#memo").focus();
}

function save(){
	  var param = "memo="+$("#memo").val()+"&"+"lectureno="+$("#lectureno").val();
	  $.ajaxSetup({datatype: "text"});  //AJAX객체준비
	  $.post("./memoSave.do", param, memoSaveResponse);
}

function memoSaveResponse(data, status) { //callback함수
	 alert("메모가 저장되었습니다.");
}

</script>
</head>
<body>
<table border="1" style="width: 100%;">
  <tr style="background-color: #99cc66">
      <td height="50px" colspan="2" style="padding-top: 7px;"> 
          <p><span style="color: White; font: 30px arial, sans-serif; font-weight: bold;">&nbsp;&nbsp;&nbsp;${dto.subject }</span>
          &nbsp;&nbsp;&nbsp;<span style="color: #444444">${dto.teacher }</span></p>
      </td>
  </tr>
  <tr>
    <td style="background-color: #ffffff; padding-left: 10%;">
      <div class="container">
          <div class="video_player" style="width: 80%;">
            <video id="video" controls="controls" poster="../sol_admin/player/storage/${dto.poster }"
              style="width: 100%;">
              <source src="../sol_admin/player/storage/${dto.filename }" type="video/mp4" />
            </video>
            <div class="custom_controls" >
              <a class="pause" title="Pause"></a>
              <a class="play" title="Play"></a> 
              <div class="time_slider"></div>
              <div class="timer">00:00</div>
              <div class="volume">
                <div class="volume_slider"></div>
                <a class="mute" title="Mute"></a> 
                <a class="unmute" title="Unmute"></a>
              </div>
            <!--   &nbsp;&nbsp;
              <button type="button" id="btnFS" name="btnFS" style="border-style: none; color: #444444"><i class="fa fa-arrows-alt"></i></button> -->
            </div>
           </div>
          </div>
    </td>
    <td style="width: 400px; background-color: white">
       <div style="background-color: white; height: 100%;" >
         <ul class="nav nav-tabs" >
           <li class="active"><a data-toggle="tab" href="#menu1">강의 목차</a></li>
           <li><a data-toggle="tab" href="#menu2">강의 메모</a></li>
         </ul>
         <br/><br/><br/>
         <div class="tab-content" style="width: 90%; color: black; height: 400px;">
           <div id="menu1" class="tab-pane fade in active">
           <table width="100%" border="0" align="center" class="table">
            <c:set var="lecNo" value="${lecNo+1 }"/>
             <c:forEach var="lecturelist" items="${list }">
             <c:set var="lecNo" value="${lecNo-1 }"></c:set>
             <br>
               <tr  style="vertical-align: center; <c:if test="${dto.lectureno == lecturelist.lectureno }">color: red;</c:if>">
               <td>${lecNo }강.</td>
               <td>
               <form action="./player.do">
                 <input type="hidden" name="lectureno" value="${lecturelist.lectureno }">
                 <input type="submit" value="${lecturelist.subject }" style="border-style: none; background-color: white; vertical-align: center;
                 <c:if test="${dto.lectureno == lecturelist.lectureno }">color: red;</c:if>">
               </form>
               </td>
               <td>${lecturelist.lecturetime }분</td>
               </tr>
             </c:forEach>
             </table>
           </div>
           <div id="menu2" class="tab-pane fade">
              <div>
                강의 내용을 메모 하세요.<br/>
                강의 내용을 메모한 후 저장 버튼을 누르면 저장이 됩니다.
               </div><br/>
              <div>
                <input type="hidden" name="lectureno" id="lectureno" value="${dto.lectureno }">
                <textarea rows="10" cols="50" name="memo" id="memo" class="memo">${sdto.memo }</textarea><br/>
                <input type="button" name="save"  value="저장" class="btn button" onclick="save()">
                <input type="button" name="reset"  value="취소" class="btn button" onclick="reset()" >
              </div>
           </div>
         </div>
       </div>
       <script>
         $(function() {
           $('.video_player').myPlayer();
         });
       </script>
    </td>
  </tr>
</table>

</body>
</html>