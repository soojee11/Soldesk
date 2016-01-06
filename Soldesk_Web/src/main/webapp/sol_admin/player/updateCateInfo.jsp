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
			elPlaceHolder : "bookInfo",
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
			  if($("#teacherName").val() == ""){
				    alert("선생님 이름을 입력해 주세요.");
				    $("#teacherName").focus();
				    return;
			  }
			  if($("#teacherMF").val() == ""){
				    alert("선생님 사진을 등록해주세요. ");
				    $("#teacherMF").focus();
				    return;
			  }
			  if($("#teacherCareer").val() == ""){
				    alert("선생님 이력을 작성해 주세요.");
				    $("#teacherCareer").focus();
				    return;
			  }
			  if($("#categoryinfo").val() == ""){
				    alert("강좌설명을 입력해 주세요.");
				    $("#categoryinfo").focus();
				    return;
			  }
			//id가 smarteditor인 textarea에 에디터에서 대입
			obj.getById["bookInfo"].exec("UPDATE_CONTENTS_FIELD", []);
			//폼 submit
			mess="강좌를 수정하시겠습니까? ";
			  if(confirm(mess)!=0){ 
				  $("#frm").submit();
				}else{
					return;
				}
		})
	})
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
			<header class="panel-heading">${dto.grade }학년
			 <c:choose><c:when  test="${dto.gwamok eq '국어' }" >국어 </c:when></c:choose>
			 <c:choose><c:when  test="${dto.gwamok eq '수학' }" >수학 </c:when></c:choose>
			 <c:choose><c:when  test="${dto.gwamok eq '사회' }" >사회 </c:when></c:choose>
			 <c:choose><c:when  test="${dto.gwamok eq '과학' }" >과학 </c:when></c:choose>
			 - 강좌설명 수정	</header>
			<div class="panel-body">
			
			
			<form class="form-horizontal" action="cateUpdate.do" method="post" enctype='multipart/form-data' name="frm" id="frm">
			<input type="hidden" name="categoryno" value="${param.categoryno }">
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
							<option value="수학" <c:choose><c:when  test="${dto.gwamok eq '수학' }" >selected</c:when></c:choose>>수학</option>
							<option value="사회" <c:choose><c:when  test="${dto.gwamok eq '사회' }" >selected</c:when></c:choose>>사회</option>
							<option value="과학" <c:choose><c:when  test="${dto.gwamok eq '과학' }" >selected</c:when></c:choose>>과학</option>
						</select>
				</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">선생님</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="teacherName" id="teacherName" value="${dto.teacherName }">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">선생님 사진</label>
					<div class="col-sm-10">
						등록된 파일명: ${dto.teacherPhoto }
						<input type="file" name="teacherMF" id="teacherMF" size='50' >
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">선생님 이력</label>
					<div class="col-sm-10">
						<textarea rows="5" cols="100" name ="teacherCareer" id="teacherCareer">${dto.teacherCareer }</textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">강좌 설명</label>
					<div class="col-sm-10">
						<textarea rows="5" cols="100" name ="categoryinfo" id="categoryinfo">${dto.categoryinfo }</textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">교재</label>
					<div class="col-sm-10">
						등록된 파일명: ${dto.bookPhoto }
						<input type="file" name="bookMF" size='50' >
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">교재 정보</label>
					<div class="col-sm-10">
						<textarea name="bookInfo" id="bookInfo" style="width: 80%; height: 300px;">${dto.categoryinfo }</textarea>
					</div>
				</div>
				<div align="center">
					<button type="button" class="btn btn-danger btn-sm" id="savebutton">수정</button>
					<button type="reset" class="btn btn-danger btn-sm" >취소</button>
					<button type="button" class="btn btn-danger btn-sm" onclick="history.go(-1); return false;">목록</button>
				</div>
			</form>
		</div>
	</section>
</div>
</div>		

<%@ include file="../footer.jsp"%>