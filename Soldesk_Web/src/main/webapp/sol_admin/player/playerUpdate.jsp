<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>
<script>
function player_validate2(frm){
	  var subject = frm.subject.value;
	  var posterMF = frm.posterMF.value;
	  var filenameMF = frm.filenameMF.value;
	  var lecturetime = frm.lecturetime.value;
	  
	  subject = subject.replace(/^\s*|\s*$/g, '');
	  lecturetime = lecturetime.replace(/^\s*|\s*$/g, '');
	  posterMF = posterMF.replace(/^\s*|\s*$/g, '');
	  filenameMF = filenameMF.replace(/^\s*|\s*$/g, '');
	  
	  if(subject.length == 0){
	    alert("제목을 입력해 주세요.");
	    frm.subject.focus();
	    return;
	  }
	  if(posterMF.length == 0){
	    alert("포스터를 등록하세요");
	    frm.posterMF.focus();
	    return;
	  }
	  if(filenameMF.length == 0){
	    alert("파일을 등록하세요");
	    frm.filenameMF.focus();
	    return;
	  }
	  if(lecturetime.length == 0){
	    alert("동영상 시간을 등록하세요");
	    frm.lecturetime.focus();
	    return;
	  }
	  mess ="수정하시겠습니까? ";
	  if(confirm(mess)!=0){ 
			frm.submit(); 
	  }else{return;}
}
</script>
<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-file-text-o"></i> Lecture
		</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="../../sol_admin/adminIndex.do">Home</a></li>
			<li>동영상 교육 관리자페이지</li>
		</ol>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<section class="panel">
			<header class="panel-heading"> 
				<strong>${dto.subject } </strong>동영상 수정 
			</header>
			<div class="panel-body">
			
			<form class="form-horizontal" action="lecUpdate.do" method="post" enctype='multipart/form-data'>
				<input type="hidden" name="lectureno" value="${param.lectureno }">
				<div class="form-group">
					<label class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="subject" value="${dto.subject }">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">등록된 포스터</label>
					<div class="col-sm-10">
						<img src="storage/${dto.poster }" width="60px">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">새 포스터</label>
					<div class="col-sm-10">
						<input type="file" name="posterMF" size='50' value="${dto.posterMF }">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">등록된 동영상 파일 이름</label>
					<div class="col-sm-10">
						${dto.filename }
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">새 동영상 파일</label>
					<div class="col-sm-10">
						<input type="file" name="filenameMF" size='50' value="${dto.filenameMF }">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">동영상 시간(분)</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="lecturetime" value="${dto.lecturetime }">
					</div>
				</div>	
				<div align="center">
					<button type="button" class="btn btn-danger btn-sm" onclick="javascript:player_validate2(this.form)">수정</button>
					<button type="reset" class="btn btn-danger btn-sm" >취소</button>
					<button type="button" class="btn btn-danger btn-sm" onclick="history.go(-1); return false;">뒤로가기</button>
				</div>
			</form>
		</div>
	</section>
</div>
</div>



<%@ include file="../footer.jsp"%>