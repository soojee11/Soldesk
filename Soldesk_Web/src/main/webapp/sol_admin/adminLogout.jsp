<%@ page contentType="text/html; charset=UTF-8"%>
<%
// adminLogout.jsp
session.removeAttribute("s_admin_id");
session.removeAttribute("s_admin_mlevel");
%>

<script>
alert("정말로 로그아웃 하시겠습니까?");
location.href="login.do";
</script>

