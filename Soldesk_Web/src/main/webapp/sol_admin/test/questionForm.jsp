<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="./js/HuskyEZCreator.js" charset="utf-8"></script>
<%@ include file="../header.jsp"%>
<script>
$(function() {
	// 전역변수
	var obj = [];
	// 스마트에디터 프레임생성
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : obj,
		elPlaceHolder : "poster",
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

	// 전송버튼
	$("#savebutton").click(function() {
		if ($("#qtype").val() == "") {
			alert("문제 유형을 입력해주세요.");
			return false;
		}
		if ($("#qtype").val() == "G") {
			if ($.trim($("#qtitle").val()) == "") {
				alert("문제 제목을 입력해 주세요.");
				$("#qtitle").focus();
				return false;
			}
			if ($.trim($("#example1").val()) == "") {
				alert("1번 보기를 입력해주세요.");
				$("#example1").focus();
				return false;
			}

			if ($.trim($("#example2").val()) == "") {
				alert("2번 보기를 입력해주세요.");
				$("#example2").focus();
				return false;
			}

			if ($.trim($("#example3").val()) == "") {
				alert("3번 보기를 입력해주세요.");
				$("#example3").focus();
				return false;
			}

			if ($.trim($("#example4").val()) == "") {
				alert("4번 보기를 입력해주세요.");
				$("#example4").focus();
				return false;
			}

			if ($.trim($("#example5").val()) == "") {
				alert("5번 보기를 입력해주세요.");
				$("#example5").focus();
				return false;
			}
			if ($.trim($("#comment").val()) == "") {
				alert("해설을 입력해주세요.");
				$("#comment").focus();
				return false;
			}
		}
		if ($("#qtype").val() == "J") {
			if ($.trim($("#qtitle").val()) == "") {
				alert("문제 제목을 입력해 주세요.");
				$("#qtitle").focus();
				return false;
			}
			if ($.trim($("#answer").val()) == "") {
				alert("답을 입력해주세요.");
				$("#answer").focus();
				return false;
			}

			if ($.trim($("#comment").val()) == "") {
				alert("해설을 입력해주세요.");
				$("#comment").focus();
				return false;
			}
		}
		if ($("#qtype").val() == "OX") {
			if ($.trim($("#qtitle").val()) == "") {
				alert("문제 제목을 입력해 주세요.");
				$("#qtitle").focus();
				return false;
			}

			if ($.trim($("#comment").val()) == "") {
				alert("해설을 입력해주세요.");
				$("#comment").focus();
				return false;
			}
		}
		// id가 smarteditor인 textarea에 에디터에서 대입
		obj.getById["poster"].exec("UPDATE_CONTENTS_FIELD", []);
		// 폼 submit
		$("#frm").submit();
	})
})

function show(value) {
	switch (value) {
	case '':
		document.getElementById("G").style.display = "none";
		document.getElementById("Answer").style.display = "none";
		document.getElementById("OX").style.display = "none";
		break;

	case 'G':
		document.getElementById("G").style.display = "";
		document.getElementById("Answer").style.display = "none";
		document.getElementById("OX").style.display = "none";
		break;

	case 'J':
		document.getElementById("G").style.display = "none";
		document.getElementById("Answer").style.display = "";
		document.getElementById("OX").style.display = "none";
		break;

	case 'OX':
		document.getElementById("G").style.display = "none";
		document.getElementById("Answer").style.display = "none";
		document.getElementById("OX").style.display = "";
		break;
	}
}
</script>
<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-file-text-o"></i> Test
		</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="../../sol_admin/adminIndex.do">Home</a></li>
			<li>문제풀기 게시판 관리 페이지</li>
		</ol>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<section class="panel">
			<header class="panel-heading"> 시험 문제지 등록 </header>
			<div class="panel-body">
			
				<!-- <form class="form-horizontal " method="post" action="questionInsert.do" enctype="multipart/form-data"> -->
				<form name="frm" id="frm" class="form-horizontal " method="post" action="questionInsert.do">
				<input type="hidden" name="testno" value="${param.testno }">
				<input type="hidden" name="testtitle" value="${param.testtitle }">
				<div class="form-group">
					<label class="col-sm-2 control-label">문제제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="qtitle" id="qtitle" >							
					</div>
				</div>
				
				<div class="form-group">
				<label class="col-sm-2 control-label">문제종류</label>
				<div class="col-sm-10">
				<select class="form-control input-sm m-bot15" name="qtype" id="qtype" onchange="show(this.value)">
						<option value="">문제유형을 선택하세요</option>
						<option value="G">객관식</option>
						<option value="J">주관식</option>
						<option value="OX">OX</option>
				</select>
				</div>
				</div>
				
				<div class="form-group" id="G" style="display: none;">
				<div class="form-inline">
					<span class="help-block" style="padding-left: 250px;color: red;">* 보기 중 답을 체크하세요 *</span>	
					<label class="col-sm-2 control-label">보기 1
					<input type="radio" name="exampleCheck" value="example1" checked>
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="example1" id="example1">							
					</div>				
				</div>
				<div class="form-inline">
					<label class="col-sm-2 control-label">보기2
					<input type="radio" name="exampleCheck" value="example2">
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="example2" id="example2">							
					</div>				
				</div>
				<div class="form-inline">
					<label class="col-sm-2 control-label">보기3
					<input type="radio" name="exampleCheck" value="example3">
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="example3" id="example3">							
					</div>				
				</div>
				<div class="form-inline">
					<label class="col-sm-2 control-label">보기4
					<input type="radio" name="exampleCheck" value="example4">
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="example4" id="example4">							
					</div>				
				</div>
				<div class="form-inline">
					<label class="col-sm-2 control-label">보기5
					<input type="radio" name="exampleCheck" value="example5">
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="example5" id="example5">							
					</div>				
				</div>	
				</div>
				
				<div class="form-group" id="Answer" style="display: none;">
					<label class="col-sm-2 control-label">답</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="answer" id="answer">							
					</div>
				</div>
				
				<div class="form-group" id="OX" style="display: none;">
					<label class="col-sm-2 control-label">답</label>
					<div class="col-lg-10">
						<label class="checkbox-inline">
							<input type="radio" name="OXAnswer" value="O" checked>O
						</label>
						<label class="checkbox-inline">
							<input type="radio" name="OXAnswer" value="X">X
						</label>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">해설</label>
					<div class="col-sm-10">
						<textarea class="form-control ckeditor" name="comment" id="comment" rows="6"></textarea>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">상세문제</label>
					<div class="col-sm-10">
					<textarea name="poster" id="poster" style="width:100%;" rows="20"></textarea>
					</div>
				</div>

				<div align="center">
					<button type="button" class="btn btn-danger btn-sm" onclick="javascript:history.back();">취소</button>
					<button type="button" class="btn btn-danger btn-sm" id="savebutton" ><!--  onclick="questionFormCheck(this.form)" -->문제등록</button>
				</div>
				</form>
				
			</div>
		</section>
	</div>
</div>

<%@ include file="../footer.jsp"%>