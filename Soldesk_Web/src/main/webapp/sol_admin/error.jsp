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
	String msg1=(String)request.getAttribute("msg1");
	String link1=(String)request.getAttribute("link1");
	String link2=(String)request.getAttribute("link2");
	
	out.print("<dl>");
	if(msg1 != null) {
		out.print("<dd><img src='/mybatis/images/face-monkey.png'>"+msg1);
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