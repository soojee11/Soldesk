<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>학습하기</title>
<link href="../sol_css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../sol_css/player.css" rel="stylesheet" type="text/css">
<link href="../sol_css/main.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script> 
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="../sol_js/playerScript.js"></script>
</head>
<body>
<table border="1" style="width: 90%;">
  <tr>
    <td style="background-color: #99cc66; padding-left: 5%;">
      <div class="container">
          <div class="video_player" style="width: 80%;">
            <video controls="controls" poster="../storage/${dto.poster }"
              style="width: 100%;">
              <source src="../storage/${dto.filename }" type="video/mp4" />
            </video>
            <div class="custom_controls" >
              <a class="pause" title="Pause"></a>
              <a class="play" title="Play"></a> 
              <div class="time_slider"></div>
              <div class="timer">00:00</div>
              <div class="volume">
                <div class="volume_slider"></div>
                <a class="mute" title="Mute"></a> <a class="unmute"
                  title="Unmute"></a>
               </div>
            </div>
           </div>
          </div>
          </td>
          <td style="width: 400px; background-color: white">
          <div style="background-color: white; height: 100%" >
            <ul class="nav nav-tabs" >
              <li class="active"><a data-toggle="tab" href="#menu1">강의 목차</a></li>
              <li><a data-toggle="tab" href="#menu2">강의 메모</a></li>
            </ul>
            <br/><br/><br/>
            <div class="tab-content" style="width: 80%; color: black; height: 400px;">
              <div id="menu1" class="tab-pane fade in active">
              <table width="100%" border="1" align="center" class="lecturelist">
               <c:set var="lecNo" value="${lecNo+1 }"/>
                <c:forEach var="lecturelist" items="${list }">
                <c:set var="lecNo" value="${lecNo-1 }"></c:set>
                <br>
                  <tr height="30px;" style="vertical-align: center; <c:if test="${dto.lectureno == lecturelist.lectureno }">color: red;</c:if>">
                  <td>${lecNo }강.</td>
                  <td>
                  <form action="./player.do">
                    <input type="hidden" name="lectureno" value="${lecturelist.lectureno }">
                    <input type="submit" value="${lecturelist.subject }" style="border-style: none; background-color: white; vertical-align: center;
                    <c:if test="${dto.lectureno == lecturelist.lectureno }">color: red;</c:if>">
                  </form>
                  </td>
                  <td>${lecturelist.lecturetime }초</td>
                  </tr>
                </c:forEach>
                </table>
              </div>
              <div id="menu2" class="tab-pane fade">
                 <div>
                   강의 내용을 메모 하세요.<br/>
                   강의 내용을 메모한 후 저장 버튼을 누르면 저장이 됩니다.</div><br/>
                 <div>
                 <textarea rows="10" cols="50" name="memo" id="memo">
                 </textarea><br/>
                 <input type="button" name="ok" id="ok" value="저장" class="btn">
                 <input type="reset" name="reset" id="reset" value="취소" class="btn">
                 </div>
              </div>
            </div>
          </div>
          <script>
            $(function() {
              $('.video_player').myPlayer();
            });
          </script>
        </div>
    </td>
  </tr>
</table>

</body>
</html>