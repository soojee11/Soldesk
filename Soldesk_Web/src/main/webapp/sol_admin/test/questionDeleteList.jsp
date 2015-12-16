<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-file-text-o"></i> Test
		</h3>
		<ol class="breadcrumb">

			<li><i class="fa fa-home"></i><a href="../adminindex.do">Home</a></li>
			<li>문제풀기 게시판 관리 페이지</li>

		</ol>
	</div>
</div>
<div style="text-align:center; font-size:33px;">
<strong>${param.testtitle }</strong>
</div>
<div class="row">
	<div class="col-lg-24" align="center">
		<form class="form-inline" method="post" action="questionDeleteList.do?testno=${param.testno }&testtitle=${param.testtitle }">
			<div class="form-group">
				<select class="form-control input-sm m-bot15" name="col">
					<option value=""
						<c:choose><c:when  test="${col eq '' }" >selected</c:when></c:choose>>전체보기</option>
					<option value="G"
						<c:choose><c:when  test="${col eq 'G' }" >selected</c:when></c:choose>>객관식</option>
					<option value="J"
						<c:choose><c:when  test="${col eq 'J' }" >selected</c:when></c:choose>>주관식</option>
					<option value="OX"
						<c:choose><c:when  test="${col eq 'OX' }" >selected</c:when></c:choose>>OX문제</option>
				</select>
			</div>

				<button class="btn btn-success btn-sm">문제종류선택</button>
		</form>
	</div>
</div>

<div align="left">
<a href="testDelete.do"><button class="btn btn-info btn-sm">문제지 목록</button></a>
</div>

<script>
function questionDeleteCheck(frm) {
	
	msg = "문제를 삭제하시겠습니까?\n삭제한 문제는 되돌릴 수 없습니다.";
    if (confirm(msg)!=0) {
         frm.submit();
    } else {
        return;
	} 
    
}
</script>
<form method="post" action="questionDelete.do?testno=${param.testno }">
<table class="table" style="text-align: center;">
	<tr>
		<td colspan="9" align="left"> 
		<input type="checkbox" name="allck4" id="allck4" onclick="checkboxEnable4()"/>
		<strong><span style="font-size:12px; color:#1717ff;">모두체크</span></strong>
		<button type="button" class="btn btn-danger btn-sm" onclick="questionDeleteCheck(this.form)">문제삭제</button>
	</td>
	</tr>
	<tr>
		<th width="50">선택</th>
		<th width="90">문제지번호</th>
		<th width="90">문제번호</th>
		<th width="90">문제종류</th>
		<th>문제제목</th>
		<th>답</th>
		<th>보기</th>
		<th>해설</th>
		<th width="100">첨부파일</th>
	</tr>
	
	<c:if test="${total ==0 }">
		<tr>
			<td colspan="9" align="center">관련된 문제가 없습니다. </td>
		</tr>
	</c:if>

	<c:forEach var ="dto" items="${list }">
	<tr>
		<td><input type="checkbox" name="check4" value="${dto.questno }" <c:if test="${dto.qynshow eq 'Y'}">checked</c:if>/></td>
		<td>${dto.testno }</td>
		<td>${dto.questno }</td>
		<td>${dto.qtype }</td>
		<td style="text-align: left;">${dto.qtitle }</td>
		<td style="text-align: left;">${dto.answer }</td>
		<td style="text-align: left;">${dto.example }</td>
		<td style="text-align: left;">${dto.comment }</td>
		<td>
		<c:if test="${dto.poster != '' }">${dto.poster }
		<%-- <img src="../sol_admin/test/storage/${dto.poster }" > --%>
		</c:if>
		</td>
	</tr>

	</c:forEach>
</table>
</form>
 

<%@ include file="../footer.jsp"%>