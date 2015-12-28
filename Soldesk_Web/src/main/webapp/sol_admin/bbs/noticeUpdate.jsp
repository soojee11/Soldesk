<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>
<script>
function notice_update(frm){
	var subject = frm.subject.value;
	var content = frm.content.value;
	subject = subject.replace(/^\s*|\s*$/g, '');
	content = content.replace(/^\s*|\s*$/g, '');
	if(subject.length == 0){
	  alert("제목을 입력해 주세요.");
	  frm.subject.focus();
	  return;
	}
	if(content.length == 0){
	  alert("내용을 입력해 주세요.");
	  frm.content.focus();
	  return;
	}
	alert("수정 하시겠습니까? ");
	frm.submit();
}
</script>
<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-file-text-o"></i> Lecture
		</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="../../sol_admin/adminIndex.do">Home</a></li>
			<li>공지사항 관리자페이지</li>
		</ol>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<section class="panel">
			<header class="panel-heading"> 공지사항 수정	</header>
			<div class="panel-body">
			<form class="form-horizontal" action="noticeUpdate.do" method="post">
			<input type="hidden" name="bbsno" value="${param.bbsno }">
				<div class="form-group">
					<label class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="subject" value="${dto.subject }">
					</div>
				</div> 
				<div class="form-group">
					<label class="col-sm-2 control-label">내용</label>
					<div class="col-sm-10">
						<textarea rows="5" cols="100" name ="content">${dto.content }</textarea>
					</div>
				</div>
				<div align="center">
					<button type="button" class="btn btn-danger btn-sm" onclick="notice_update(this.form)">수정</button>
					<button type="reset" class="btn btn-danger btn-sm" >취소</button>
					<button type="button" class="btn btn-danger btn-sm"  onclick="location.href='noticeList.do'">목록</button>
				</div>
			</form>
		</div>
	</section>
</div>
</div>		

<%@ include file="../footer.jsp"%>