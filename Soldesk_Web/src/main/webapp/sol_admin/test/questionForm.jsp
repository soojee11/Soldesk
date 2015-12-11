<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>

<script>
function show(value) {
	switch(value) {
	case '':
		document.getElementById("G").style.display = "none";
		document.getElementById("answer").style.display = "none";
		document.getElementById("OX").style.display = "none";
		break;
		
	case 'G':
		document.getElementById("G").style.display = "";
		document.getElementById("answer").style.display = "none";
		document.getElementById("OX").style.display = "none";
		break;
		
	case 'J':
		document.getElementById("G").style.display = "none";
		document.getElementById("answer").style.display = "";
		document.getElementById("OX").style.display = "none";
		break;
		
	case 'OX':
		document.getElementById("G").style.display = "none";
		document.getElementById("answer").style.display = "none";
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
			<li><i class="fa fa-home"></i><a href="../adminindex.do">Home</a></li>
			<li>문제풀기 게시판 관리 페이지</li>
		</ol>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<section class="panel">
			<header class="panel-heading"> 시험 문제지 등록 </header>
			<div class="panel-body">
			
				<form class="form-horizontal " method="post" action="questionInsert.do" enctype="multipart/form-data">
				<input type="hidden" name="testno" value="${param.testno }">
				<div class="form-group">
					<label class="col-sm-2 control-label">문제제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="qtitle" >							
					</div>
				</div>
				
				<div class="form-group">
				<label class="col-sm-2 control-label">문제종류</label>
				<div class="col-sm-10">
				<select class="form-control input-sm m-bot15" name="qtype" onchange="show(this.value)">
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
						<input type="text" class="form-control" name="example1" >							
					</div>				
				</div>
				<div class="form-inline">
					<label class="col-sm-2 control-label">보기2
					<input type="radio" name="exampleCheck" value="example2">
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="example2" >							
					</div>				
				</div>
				<div class="form-inline">
					<label class="col-sm-2 control-label">보기3
					<input type="radio" name="exampleCheck" value="example3">
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="example3" >							
					</div>				
				</div>
				<div class="form-inline">
					<label class="col-sm-2 control-label">보기4
					<input type="radio" name="exampleCheck" value="example4">
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="example4" >							
					</div>				
				</div>
				<div class="form-inline">
					<label class="col-sm-2 control-label">보기5
					<input type="radio" name="exampleCheck" value="example5">
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="example5" >							
					</div>				
				</div>	
				</div>
				
				<div class="form-group" id="answer" style="display: none;">
					<label class="col-sm-2 control-label">답</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="answer">							
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
						<textarea class="form-control ckeditor" name="comment" rows="6"></textarea>
					</div>
				</div>
					
				<div class="form-group">
					<label class="col-sm-2 control-label" for="exampleInputFile">첨부파일</label>
					<div class="col-sm-10">
					<input type="file" id="exampleInputFile" name="posterMF" size="50">
					<span class="help-block">이미지 파일만 등록가능(.exe,.jsp,.html불가)</span>						
					</div>
				</div>
					
				<div align="center">
					<button type="button" class="btn btn-danger btn-sm" onclick="javascript:history.back();">취소</button>
					<button type="button" class="btn btn-danger btn-sm" onclick="questionFormCheck(this.form)">문제등록</button>
				</div>
				</form>
				
			</div>
		</section>
	</div>
</div>

<%@ include file="../footer.jsp"%>