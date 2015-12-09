<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>학습하기</title>
<link href="../sol_css/player.css" rel="stylesheet" type="text/css">
<link href="../sol_css/main.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script> 
<script src="../sol_js/playerScript.js"></script>
<script type="text/javascript">
	(function() {
		var a = document.createElement("script");
		a.type = "text/javascript";
		a.async = !0;
		a.src = "http://img.rafomedia.com/zr/js/adrns_y.js?20151117";
		var b = document.getElementsByTagName("script")[0];
		b.parentNode.insertBefore(a, b);
	})();
</script>
</head>
<body>
<table>
  <tr>
    <td style="width: 60%">
      <div class="container">
            <div class="video_player">
                <video controls="controls" poster="../sol_storage/${dto.poster }" style="width:800px;">
          <source src="../sol_storage/${dto.filename }" type="video/mp4" />
                </video>
                <div class="custom_controls">
                    <a class="play" title="Play"></a>
                    <a class="pause" title="Pause"></a>
                    <div class="time_slider"></div>
                    <div class="timer">00:00</div>
                    <div class="volume">
                        <div class="volume_slider"></div>
                        <a class="mute" title="Mute"></a>
                        <a class="unmute" title="Unmute"></a>
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
    <td style="width: 40%">
        
    </td>
  </tr>
</table>

</body>
</html>