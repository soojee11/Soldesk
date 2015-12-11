<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-file-text-o"></i> Lecture
		</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="adminindex.do">Home</a></li>
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
					<label class="col-sm-2 control-label">선생님</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="teacher" value="${dto.teacher }">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">등록된 포스터</label>
					<div class="col-sm-10">
						<img src="./player/storage/${dto.poster }" width="60px">
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
					<label class="col-sm-2 control-label">동영상 시간(초)</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="lecturetime" value="${dto.lecturetime }">
					</div>
				</div>	
				<div align="center">
					<button type="button" class="btn btn-danger btn-sm" onclick="javascript:player_validate2(this.form)">수정</button>
					<button type="reset" class="btn btn-danger btn-sm" >취소</button>
				</div>
			</form>
		</div>
	</section>
</div>
</div>



<%@ include file="../footer.jsp"%>