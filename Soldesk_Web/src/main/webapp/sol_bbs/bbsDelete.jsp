<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../sol_header.jsp"%>
<link href="./css/style.css" rel="stylesheet" type="text/css">
<!--  -->
<c:if test="${msg != null }">
	<script>
		alert("게시물 삭제 성공");
		location.href="bbslist.do?nowPage=${nowPage }";
	</script>
</c:if>
<!--  -->
<%@ include file="../sol_footer.jsp"%>