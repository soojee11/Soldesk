<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>
<c:if test="${msg==2 }">
	<script>
		alert("등록 실패! 다시시도 해주세요. ");
		location.href="noticeIns.do";
	</script>
</c:if>
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
			<header class="panel-heading"> 공지사항 등록	</header>
			<div class="panel-body">
			<form class="form-horizontal" action="noticeIns.do" method="post">
				<div class="form-group">
					<label class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="subject">
					</div>
				</div> 
				<div class="form-group">
					<label class="col-sm-2 control-label">내용</label>
					<div class="col-sm-10">
						<textarea rows="5" cols="100" name ="content"></textarea>
					</div>
				</div>
				<div align="center">
					<button type="button" class="btn btn-danger btn-sm" onclick="notice_validate(this.form)">등록</button>
					<button type="reset" class="btn btn-danger btn-sm" >취소</button>
					<button type="button" class="btn btn-danger btn-sm"  onclick="javascript:history.go(-1)">목록</button>
				</div>
			</form>
		</div>
	</section>
</div>
</div>		

<%@ include file="../footer.jsp"%>