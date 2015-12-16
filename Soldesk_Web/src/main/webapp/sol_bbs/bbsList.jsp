<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../sol_header.jsp"%>
<!-- page start-->
<link rel="stylesheet" href="css/style.css" />
<script type="text/javascript">
function denywrite(){
  alert("로그인 후 이용해주세요.");
}
</script>
<br/>
<h5>
  <img src="img/cont.JPG"><img src="img/pna.JPG">| 무엇이든 물어보세요
</h5>
<hr>
총 <strong><style font-color="red">886</style></strong>개의 등록된 글이 있습니다. | 현재 페이지 : <strong>1/89</strong>
<div align="right"><input type="button" value="글쓰기" class="btn btn-default" 
          <c:if test="${s_id == null }">onclick="denywrite()"</c:if>
          <c:if test="${s_id != null }">onclick="location.href='./create.do'"</c:if>></div>

<table border="0" width="100%" class="table">
  <tr height="10px">
  </tr>
  <tr align="center">
    <td>번호</td>
    <td width="20%">작성자</td>
    <td width="40%">제목</td>
    <td >작성일</td>
    <td width="50px">조회수</td>
  </tr>
  <c:set var ="recNo" value="${recNo+1 }"/>
  <c:forEach var ="dto" items="${list }">
    <c:set var ="recNo" value="${recNo-1 }"/>
      <tr align="center">
        <td>${recNo }</td>
        <td>${dto.passwd }</td>
        <td>
          <a href="./bbsread.do?bbsno=${dto.bbsno }">${dto.subject }</a>
        </td>
        <td>${dto.regdt }</td>
        <td>${dto.readcnt }</td>
      </tr>
  </c:forEach>
</table>

<!-- page end-->
<%@ include file="../sol_footer.jsp"%>