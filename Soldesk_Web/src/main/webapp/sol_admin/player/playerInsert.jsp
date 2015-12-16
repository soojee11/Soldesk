<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-file-text-o"></i> Lecture
		</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="adminIndex.do">Home</a></li>
			<li>동영상 교육 관리자페이지</li>
		</ol>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<section class="panel">
			<header class="panel-heading"> 동영상 등록	</header>
			<div class="panel-body">
			
			<form class="form-horizontal" action="lecinsert.do" method="post" enctype='multipart/form-data'>
				<div class="form-group">
					<label class="col-sm-2 control-label">학년</label>
					<div class="col-sm-10">
						<select class="form-control input-sm m-bot15" name="grade">
							<option value="1">1학년</option>
							<option value="2">2학년</option>
							<option value="3">3학년</option>
							<option value="4">4학년</option>
							<option value="5">5학년</option>
							<option value="6">6학년</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">과목</label>
					<div class="col-sm-10">
						<select class="form-control input-sm m-bot15" name="gwamok">
							<option value="kor">국어</option>
							<option value="eng">영어</option>
							<option value="mat">수학</option>
						</select>
				</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="subject" placeholder="1-1 국어 (1) 슬기로운 국어 생활">
					</div>
				</div> 
				<div class="form-group">
					<label class="col-sm-2 control-label">선생님</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="teacher" placeholder="신윤경 선생님">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">포스터</label>
					<div class="col-sm-10">
						<input type="file" name="posterMF" size='50' >
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">동영상 파일</label>
					<div class="col-sm-10">
						<input type="file" name="filenameMF" size='50'>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">동영상 시간(초)</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="lecturetime"  placeholder="1020(초)">
					</div>
				</div>	
				<div align="center">
					<button type="button" class="btn btn-danger btn-sm" onclick="player_validate(this.form)">등록</button>
					<button type="reset" class="btn btn-danger btn-sm" >취소</button>
					<button type="button" class="btn btn-danger btn-sm"  onclick="location.href='./leclist.do">목록</button>
				</div>
			</form>
		</div>
	</section>
</div>
</div>		

<%@ include file="../footer.jsp"%>