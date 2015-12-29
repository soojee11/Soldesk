<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="./js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script>
	$(function() {
		//전역변수
		var obj = [];
		//스마트에디터 프레임생성
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : obj,
			elPlaceHolder : "content",
			sSkinURI : "./SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : false,
			}
		});

		//전송버튼
		$("#savebutton").click(function() {
			if ($("#subject").val() == "") {
				alert("제목을 입력해 주세요.");
				$("#subject").focus();
				return;
			}
			//id가 smarteditor인 textarea에 에디터에서 대입
			obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			//폼 submit
			$("#frm").submit();
		})
	})
</script>
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
			<form class="form-horizontal" action="noticeIns.do" method="post" id="frm" name="frm">
				<div class="form-group">
					<label class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="subject" id="subject">
					</div>
				</div> 
				<div class="form-group">
					<label class="col-sm-2 control-label">내용</label>
					<div class="col-sm-10">
						<textarea name="content" id="content"
							style="width: 100%; height: 412px;"></textarea>
					</div>
				</div>
				<div align="center">
					<button type="button" id="savebutton" class="btn btn-danger btn-sm">등록</button>
					<button type="reset" class="btn btn-danger btn-sm" >취소</button>
					<button type="button" class="btn btn-danger btn-sm"  onclick="location.href='noticeList.do'">목록</button>
				</div>
			</form>
		</div>
	</section>
</div>
</div>		

<%@ include file="../footer.jsp"%>