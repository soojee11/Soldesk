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
			<li><i class="fa fa-home"></i><a href="adminIndex.do">Home</a></li>
			<li>문제풀기 게시판 관리 페이지</li>
		</ol>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<section class="panel">
			<header class="panel-heading"> 시험 문제지 수정 </header>
			<div class="panel-body">
			
				<form class="form-horizontal" method="post" action="testUpdateProc.do">
				<input type="hidden" value="${dto.testno }" name="testno" />
				<div class="form-group">
				<label class="col-sm-2 control-label">학년</label>
				<div class="col-sm-10">
				<select class="form-control input-sm m-bot15" name="grade">
					<option value="1" <c:if test="${dto.grade eq 1}">selected</c:if>>1학년</option>
					<option value="2" <c:if test="${dto.grade eq 1}">selected</c:if>>2학년</option>
					<option value="3" <c:if test="${dto.grade eq 1}">selected</c:if>>3학년</option>
					<option value="4" <c:if test="${dto.grade eq 1}">selected</c:if>>4학년</option>
					<option value="5" <c:if test="${dto.grade eq 1}">selected</c:if>>5학년</option>
					<option value="6" <c:if test="${dto.grade eq 1}">selected</c:if>>6학년</option>
				</select>
				</div>
				</div>
			
				<div class="form-group">
				<label class="col-sm-2 control-label">과목</label>
				<div class="col-sm-10">
				<select class="form-control input-sm m-bot15" name="subject">
					<option value="kor" <c:if test="${dto.subject eq 'kor'}">selected</c:if>>국어</option>
					<option value="eng" <c:if test="${dto.subject eq 'eng'}">selected</c:if>>영어</option>
					<option value="mat" <c:if test="${dto.subject eq 'mat'}">selected</c:if>>수학</option>
				</select>
				</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">문제지제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="testtitle" value="${dto.testtitle }" >							
					</div>
				</div>
				
				<div align="center">
					<button type="button" class="btn btn-danger btn-sm" onclick="javascript:history.back();">취소</button>
					<button type="button" class="btn btn-danger btn-sm" onclick="testFormCheck(this.form)">문제지 수정</button>
				</div>
				</form>
				
			</div>
		</section>
	</div>
</div>

<%@ include file="../footer.jsp"%>