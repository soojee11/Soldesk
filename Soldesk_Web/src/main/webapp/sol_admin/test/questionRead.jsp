<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>
<c:if test="${res==1 }">
	<script>
		alert("해당 문제를 수정하였습니다.");
		location.href="questionRead.do?testno=${param.testno}&questno=${param.questno }&testtitle=${param.testtitle }";
	</script>
</c:if>
<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-file-text-o"></i> Test
		</h3>
		<ol class="breadcrumb">

			<li><i class="fa fa-home"></i><a href="../../sol_admin/adminIndex.do">Home</a></li>
			<li>문제풀기 게시판 관리 페이지</li>

		</ol>
	</div>
</div>

<div align="left">
<a href="testDelete.do"><button class="btn btn-info btn-sm">문제지 목록</button></a>
<a href="questionDeleteList.do?testno=${dto.testno }&testtitle=${param.testtitle }"><button class="btn btn-info btn-sm">문제 목록</button></a>
</div>

<div style="text-align:center; font-size:33px;">
<strong>${param.testtitle }</strong>
</div><br />
<div align="center">

<table class="table" style="text-align: left; width:750px;">
	<tr>
		<th width="100">번호</th>
		<td width="100">${dto.questno }</td>
		<th width="100">종류</th>
		<td width="100">${dto.qtype }</td>
		<th width="100">답</th>
		<td>${dto.answer }</td>
	</tr>
	<tr>
		<th width="100">제목</th>
		<td colspan="5">${dto.qtitle }</td>
	</tr>

	<c:if test="${dto.qtype eq 'G' }">
	<tr>
		<th width="100">보기</th>
		<td colspan="5">
			<c:set var="example" value="${dto.example }" />
		 	<%
		 	String example = (String)pageContext.getAttribute("example");
		 	String[] number=new String[5];
			String[] str=example.split("/");
			for (int idx = 0; idx < str.length; idx++) {
				number[idx]=str[idx];
				//System.out.print(number[idx]);
			}
			
			for (int idx = 0; idx < str.length; idx++) {
				pageContext.setAttribute("number"+idx, number[idx]) ;
			}
			%>
			1. ${number0}<br />
			2. ${number1}<br />
			3. ${number2}<br />
			4. ${number3}<br />
			5. ${number4}<br />
		</td>
		</tr> 
	</c:if>

	<tr>
		<th width="100">상세문제</th>
		<td colspan="5">${dto.poster }</td>
	</tr>
	
	<tr>
		<th width="100">해설</th>
		<td colspan="5">
		<jsp:scriptlet>
			pageContext.setAttribute("cr", "\r");
			pageContext.setAttribute("lf", "\n");									
			pageContext.setAttribute("crlf", "\r\n");									
		</jsp:scriptlet>
			${fn:replace(dto.comment,crlf,'<br/>') }
		</td>
	</tr>
	
</table>
<script>
function questionReadDelete() {

	msg = "문제를 삭제하시겠습니까?\n삭제한 문제는 되돌릴 수 없습니다.\n원치 않으시면 취소를 눌러주세요";
	   if (confirm(msg)!=0){
		   location.href='questionReadDelete.do?testno=${dto.testno}&questno=${dto.questno }&testtitle=${param.testtitle }';
	   }
	   else
		   return; 

}
</script>

<div align="center">
	<button type="submit" class="btn btn-danger btn-sm" onclick="location.href='questionUpdateForm.do?testno=${dto.testno}&questno=${dto.questno }&testtitle=${param.testtitle }'">수정</button>
	<button type="button" class="btn btn-danger btn-sm" onclick="questionReadDelete()">삭제</button>
	<button type="button" class="btn btn-danger btn-sm" onclick="location.href='questionDeleteList.do?testno=${dto.testno}&testtitle=${param.testtitle }'">목록</button>
</div>
</div>

<%@ include file="../footer.jsp"%>