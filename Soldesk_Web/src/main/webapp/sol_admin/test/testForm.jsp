<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-file-text-o"></i> Test
		</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="adminIndex.do">Home</a></li>
			<li>문제풀기 게시판 관리 페이지</li>
		</ol>
	</div>
</div>
			
<div class="row">
	<div class="col-lg-12">
		<section class="panel">
			<header class="panel-heading"> 시험 문제지 등록 </header>
			<div class="panel-body">
			
				<form class="form-horizontal" method="post" action="testInsert.do">
				
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
				<select class="form-control input-sm m-bot15" name="subject">
					<option value="kor">국어</option>
					<option value="eng">영어</option>
					<option value="mat">수학</option>
				</select>
				</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">문제지제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="testtitle" placeholder="1학년 국어 핵심 예제1" >							
					</div>
				</div>
				
				<div align="center">
					<button type="button" class="btn btn-danger btn-sm" onclick="javascript:history.back();">취소</button>
					<button type="button" class="btn btn-danger btn-sm" onclick="testFormCheck(this.form)">문제지 등록</button>
				</div>
				</form>
				
			</div>
		</section>
	</div>
</div>

<%@ include file="../footer.jsp"%>