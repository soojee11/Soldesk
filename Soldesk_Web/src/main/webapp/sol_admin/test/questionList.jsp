<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>

<c:if test="${res == 1 }">
	<script>
		alert("문제 등록에 성공하였습니다. ");
		location.href="questionList.do?testno=${param.testno }&testtitle=${param.testtitle }";
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
<div style="text-align:center; font-size:33px;">
<strong>${param.testtitle }</strong>
</div>
<div class="row">
	<div class="col-lg-24" align="center">
		<form class="form-inline" method="post" action="questionList.do?testno=${param.testno }&testtitle=${param.testtitle }">
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
<a href="testList.do"><button class="btn btn-info btn-sm">문제지 목록</button></a>
<a href="questionForm.do?testno=${param.testno }&testtitle=${param.testtitle }"><button class="btn btn-info btn-sm">문제 등록</button></a>
</div>

<form method="post" action="questionUnSelect.do?testno=${param.testno }">
<table class="table" style="text-align: center;">
	<tr>
		<td colspan="9" align="left"> 
		<input type="checkbox" name="allck2" id="allck2" onclick="checkboxEnable2()"/>
		<strong><span style="font-size:12px; color:#1717ff;">모두체크</span></strong>
		<button type="button" class="btn btn-danger btn-sm" onclick="questionCheck2(this.form)">문제제외</button>
	</td>
	</tr>
	<tr>
		<th width="45">선택</th>
		<th width="45">번호</th>
		<th width="50">종류</th>
		<th width="200">답</th>
		<th>제목</th>
		<th width="100">상세보기</th>
	</tr>
	
	<c:forEach var ="dto" items="${list }">
	<c:if test="${dto.qynshow eq 'Y'}">
			<tr>
				<td><input type="checkbox" name="check2" value="${dto.questno }" <c:if test="${dto.qynshow eq 'Y'}">checked</c:if>/></td>
				<td>${dto.questno }</td>
				<td>${dto.qtype }</td>
				<td style="text-align: left;">${dto.answer }</td>
				<td style="text-align: left;">${dto.qtitle }</td>
				<td>
				<button type="button" class="btn btn-danger btn-sm" onclick="javascript:location.href='questionRead2.do?testno=${dto.testno }&questno=${dto.questno }&testtitle=${param.testtitle }'">문제상세보기</button>
				</td>				
			</tr>
	</c:if>
	<c:if test="${dto.qynshow eq 'N'}">
	</c:if>	
	</c:forEach>
</table>
</form>

<form method="post" action="questionSelect.do?testno=${param.testno }">
<table class="table" style="text-align: center;">
	<tr>
		<td colspan="9" align="left"> 
		<input type="checkbox" name="allck" id="allck" onclick="checkboxEnable()"/>
		<strong><span style="font-size:12px; color:#1717ff;">모두체크</span></strong>
		<button type="button" class="btn btn-danger btn-sm" onclick="questionCheck(this.form)">문제추가</button>
	</td>
	</tr>
	<tr>
		<th width="45">선택</th>
		<th width="45">번호</th>
		<th width="50">종류</th>
		<th width="200">답</th>
		<th>제목</th>
		<th width="100">상세보기</th>
	</tr>

	<c:forEach var ="dto" items="${list }">
	<c:if test="${dto.qynshow eq 'Y'}">
	</c:if>
	<c:if test="${dto.qynshow eq 'N'}">
				<tr>
				<td><input type="checkbox" name="check" value="${dto.questno }" <c:if test="${dto.qynshow eq 'Y'}">checked</c:if>/></td>
				<td>${dto.questno }</td>
				<td>${dto.qtype }</td>
				<td style="text-align: left;">${dto.answer }</td>
				<td style="text-align: left;">${dto.qtitle }</td>
				<td>
				<button type="button" class="btn btn-danger btn-sm" onclick="javascript:location.href='questionRead2.do?testno=${dto.testno }&questno=${dto.questno }&testtitle=${param.testtitle }'">문제상세보기</button>
				</td>
			</tr>
	</c:if>	
	</c:forEach>
</table>
</form>
 
<%@ include file="../footer.jsp"%>