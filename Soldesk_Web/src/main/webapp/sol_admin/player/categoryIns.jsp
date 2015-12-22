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
			<li><i class="fa fa-home"></i><a href="adminIndex.do">Home</a></li>
			<li>동영상 교육 관리자페이지</li>
		</ol>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<section class="panel">
			<header class="panel-heading">강좌 등록</header>
			<div class="panel-body">
			
			<form class="form-horizontal" action="cateInsert.do" method="post" enctype='multipart/form-data'>
				<div class="form-group">
					<label class="col-sm-2 control-label">학년</label>
					<div class="col-sm-10">
						<select class="form-control input-sm m-bot15" name="grade">
							<option value="1" <c:choose><c:when  test="${dto.grade eq '1' }" >selected</c:when></c:choose>>1학년</option>
							<option value="2" <c:choose><c:when  test="${dto.grade eq '2' }" >selected</c:when></c:choose>>2학년</option>
							<option value="3" <c:choose><c:when  test="${dto.grade eq '3' }" >selected</c:when></c:choose>>3학년</option>
							<option value="4" <c:choose><c:when  test="${dto.grade eq '4' }" >selected</c:when></c:choose>>4학년</option>
							<option value="5" <c:choose><c:when  test="${dto.grade eq '5' }" >selected</c:when></c:choose>>5학년</option>
							<option value="6" <c:choose><c:when  test="${dto.grade eq '6' }" >selected</c:when></c:choose>>6학년</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">과목</label>
					<div class="col-sm-10">
						<select class="form-control input-sm m-bot15" name="gwamok">
							<option value="국어" <c:choose><c:when  test="${dto.gwamok eq '국어' }" >selected</c:when></c:choose>>국어</option>
							<option value="영어" <c:choose><c:when  test="${dto.gwamok eq '영어' }" >selected</c:when></c:choose>>영어</option>
							<option value="수학" <c:choose><c:when  test="${dto.gwamok eq '수학' }" >selected</c:when></c:choose>>수학</option>
						</select>
				</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">강좌 설명</label>
					<div class="col-sm-10">
						<textarea rows="5" cols="100" name ="categoryinfo">${dto.categoryinfo }</textarea>
					</div>
				</div>
				<div align="center">
					<button type="button" class="btn btn-danger btn-sm" onclick="cateInsert(this.form)">등록</button>
					<button type="reset" class="btn btn-danger btn-sm" >취소</button>
					<button type="button" class="btn btn-danger btn-sm" onclick="history.go(-1); return false;">목록</button>
				</div>
			</form>
		</div>
	</section>
</div>
</div>		

<%@ include file="../footer.jsp"%>