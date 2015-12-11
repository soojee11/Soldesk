<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error.jsp</title>
</head>
<body>
<div style="text-align: center; font-size: 2em;">알림</div>
<div style="width: 100%; text-align: center; margin: 0 auto; font-size: 20px">

<% 

	String msg=(String)request.getAttribute("msg");
	String link1=(String)request.getAttribute("link1");
	String link2=(String)request.getAttribute("link2");
	
	out.print("<dl>");

	if(msg != null) {
		out.print("<dd><img src='../sol_img/face-monkey.png'>"+msg);
	}
	out.print("</dl>");
	out.print("<br /><br />");
	
	if(link1 != null) {
		out.print(link1);
	}
	if(link2 != null) {
		out.print(link2);
	}
%>

</div>
</body>
</html>