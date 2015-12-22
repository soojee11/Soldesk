<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../sol_header.jsp"%>
<!-- page start-->
<link rel="stylesheet" href="css/style.css" />
<br/>
<h5>
	<img src="bbs_img/cont.JPG"><img src="bbs_img/pna.JPG">| 무엇이든 물어보세요
</h5>
<hr>
<div align="center"><h3>상세 보기</h3></div>

<table border="0" align="center" class="table" width="60%">
<tr>
  <td width="50px">작성자</td>
  <td>${dto.passwd }</td>
</tr>
<tr>
  <td width="50px">조회수</td>
  <td>${dto.readcnt }</td>
</tr>
<tr>
  <td width="50px">작성일</td>
  <td>${dto.regdt }</td>
</tr>
<tr>
	<td width="50px">제목</td>
	<td>${dto.subject }</td>
</tr>
<tr>
	<td>내용</td>
	<td>${dto.content }</td>
</tr>
<tr>
   <td colspan="2" align="center">
      <input type="button" name="list" value="목록" onclick="location.href='bbslist.do?nowPage=${nowPage }'">
      <c:if test="${s_id == dto.passwd }">
        <input type="button" name="insert" value="수정" onclick="location.href='bbsupdate.do?bbsno=${dto.bbsno }&nowPage=${nowPage }'">
        <input type="reset" name="reset" value="삭제" onclick="location.href='bbsdelete.do?bbsno=${dto.bbsno }&nowPage=${nowPage }'">
      </c:if>
   </td>
</tr>
</table>

<!-- page end-->
<%@ include file="../sol_footer.jsp"%>