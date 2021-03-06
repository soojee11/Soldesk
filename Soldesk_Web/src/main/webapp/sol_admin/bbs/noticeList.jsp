<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>
<script>
function noticeDel(bbsno){
	var mess = "선택한 공지사항을 삭제하시겠습니까? \n 공지사항에 있는 댓글 모두 삭제됩니다. ";
	if(confirm(mess)){ 
		location.href="noticeDel.do?bbsno="+bbsno;
	}
}
</script>
<c:if test="${msg==2 }">
	<script>
		alert("삭제가 완료되었습니다. ");
		location.href="noticeList.do";
	</script>
</c:if>

<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-file-text-o"></i> Notice
		</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="../../sol_admin/adminIndex.do">Home</a></li>
			<li>공지사항 관리자페이지</li>
		</ol>
	</div>
</div>
<div align="left">
<a href="noticeIns.do"><button class="btn btn-danger btn-sm">공지사항 등록</button></a>
</div>
  
<table class="table">
	<tr>
		<th width="80">보여주기</th>
		<th width="60"><div align="center">번호</div></th>
		<th><div align="center">제목</div></th>
		<th><div align="center">작성자</div></th>
		<th><div align="center">작성일</div></th>
		<th width="100"><div align="center">조회수</div></th>
		<th width="100"><div align="center">삭제</div></th>
	</tr>
	<c:if test="${total ==0 }">
		<tr>
			<td colspan="7" align="center">관련된 공지사항이 존재하지않습니다. </td>
		</tr>
	</c:if>
	<c:set var="total" value="${total+1 }" />
	<c:forEach var="dto" items="${list }">
		<c:set var="total" value="${total-1 }" />
		<tr>
			<td>
				<form action="noticeShowUpdate.do" method="post">
					<input type="hidden" name="bbsno" value="${dto.bbsno }" />
					<select name="noticeshow" class="form-control input-sm m-bot15" onchange="noticeShow(this.form)">
						<option value="Y" <c:choose><c:when  test="${dto.noticeshow eq 'Y' }" >selected</c:when></c:choose>>Y</option>
						<option value="N" <c:choose><c:when  test="${dto.noticeshow eq 'N' }" >selected</c:when></c:choose>>N</option>
					</select>
				</form>
				<script>
					function noticeShow(frm) {
						var mess = "보여주기를 변경하시겠습니까? ";
						if(confirm(mess)){ 
							frm.submit();
						}else{
							location.href="noticeList.do";
						}
					}
				</script>	
			</td>
			<td><div align="center">${total}</div></td>
			<td><a href="noticeRead.do?bbsno=${dto.bbsno }"><div align="center">${dto.subject }</div></a></td>
			<td><div align="center">${dto.passwd }</div></td>
			<td><div align="center"><c:set var="regdt" value="${dto.regdt }"/> ${fn:substring(regdt,0,16) }</div></td>
			<td><div align="center">${dto.readcnt }</div></td>
			<td><div align="center"><button class="btn btn-danger btn-sm" onclick="noticeDel(${dto.bbsno})">삭제</button></div></td>
		</tr>
	</c:forEach>
</table>

<%@ include file="../footer.jsp"%>