<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../sol_header.jsp"%>
<%@page import="net.utility.Utility"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- page start-->
<!-- <script src="js/postscript.js"></script>-->
<script src="js/my.js"></script>

<script language="javascript">
function lectureGo(lectureno){
	  str = "/solproject/sol_player/player.do?lectureno="+lectureno;
	  r = window.open(str, "학습하기", 'scrollbars=yes, resizeable=no, width=1500, height=700');
	}

function lectureNotGo(){
	alert("로그인 후 이용해 주세요.");
}


function postApplyResponse(data, status) { //callback함수
	alert(data.replace(/^\s+|\s+$/gm,''));
	window.location.reload(); //현재 페이지 새로고침
}

//후기 등록
function postApply(){
	alert("후기를 등록하시겠습니까?");
	$("#postscriptno").val(0);
	var param=$("#postForm").serialize();  //<form id=frm> 전송할 데이터가 있는 폼
	$.ajaxSetup({datatype: "text"});  //AJAX객체준비
	//alert(param);
	//post방식. 응답이 성공하면 실행할 callback함수
	$.post("./create.do", param, postApplyResponse);
}

// 후기 삭제
function postDelete(postscriptno) {
	alert("후기를 삭제하시겠습니까?");
	var param="postscriptno="+postscriptno;         //전송 데이터
	//alert(param);
	$.ajaxSetup({datatype: "text"});
	$.get("./delete.do", param, postApplyResponse); //get방식	
}


//수정할 댓글 조회
function postUpdate(postscriptno){
	$("#postscriptno").val(postscriptno);
	var param="postscriptno="+postscriptno; // 전달할 데이터
	$.ajaxSetup({dataType:"text"});
	$.get("./read.do",param,updateFormResponse); // get방식
}

function updateFormResponse(data,status){
	//alert(data);
	$("#content").val(data.replace(/^\s*|\s*$/g, ''));
	document.getElementById("btnCreate").style.display = 'none';
	document.getElementById("btnUpdate").style.display = '';
}

//수정 저장
function updateProc() {
	alert("후기를 수정하시겠습니까?");
	//$("#postscriptno").val(0);
	var param=$("#postForm").serialize();
	//alert(param);
	$.ajaxSetup({dataType:"text"});
	$.post("./update.do",param,postApplyResponse);	
}

//강의목록리스트
function listShow(){
	document.getElementById("a").style.display = '';
	document.getElementById("b").style.display = 'none';
	document.getElementById("c").style.display = 'none';
}// end


// 후기 리스트
function postShow(){
	document.getElementById("a").style.display = 'none';
	document.getElementById("b").style.display = 'none';
	document.getElementById("c").style.display = '';
}// end

//학습qna리스트
function qnaShow(){
	document.getElementById("a").style.display = 'none';
	document.getElementById("b").style.display = '';
	document.getElementById("c").style.display = 'none';
	document.getElementById("qnaList").style.display = '';
	document.getElementById("qnaCreate").style.display = 'none';
	
}//end

//학습QnA 글쓰기
function qnaCreate(){
	document.getElementById("qnaList").style.display = 'none';
	document.getElementById("qnaCreate").style.display = '';
}// end

function validate(frm){
	var subject = frm.subject.value;
	var content = frm.content.value;
    
	subject = subject.replace(/^\s*|\s*$/g, '');
	content = content.replace(/^\s*|\s*$/g, '');
	  
	if(subject.length == 0){
	  alert("제목을 입력해 주세요.");
	  frm.subject.focus();
	  return;
	}
	  
	if(content.length == 0){
	  alert("내용을 입력해 주세요.");
	  frm.content.focus();
	  return;
	}
 
	/* msg="등록 하시겠습니까? ";
	if(confirm(msg)!=0){
	  frm.submit();
	}else{
	  return;
	} */
	  
	alert("QnA를 등록하시겠습니까?");
	//$("#QnAno").val(0);
	var param=$("#qnaCreateForm").serialize();  //<form id=frm> 전송할 데이터가 있는 폼
	$.ajaxSetup({datatype: "text"});  //AJAX객체준비
	//alert(param);
	//console.log(param);
	//post방식. 응답이 성공하면 실행할 callback함수
	$.post("./qnaCreate.do", param, postApplyResponse);
	  
}//end

function qnaApply() {
	alert("QnA를 등록하시겠습니까?");
	$("#QnAno").val(0);
	var param=$("#qnaCreateForm").serialize();  //<form id=frm> 전송할 데이터가 있는 폼
	$.ajaxSetup({datatype: "text"});  //AJAX객체준비
	alert(param);
	//post방식. 응답이 성공하면 실행할 callback함수
	$.post("./qnaCreate.do", param, postApplyResponse);
}

</script>

<link href="./css/style.css" rel="stylesheet" type="text/css">
<link rel='stylesheet' type='text/css' href='css/star.css'>
<h4>
	<!-- <img src="img/cont.JPG"> -->
	<img src="../sol_img/go_right.png" width="20px"/>
	<img src="img/study.png" width="150px" height="50px"><span style="font-size: 12px;">| 학습해 보세요 </span> 
</h4>

<div class="column">
	 <div class="menu1">
			<!-- 학년별 카테고리 -->
			<ul>				
				<li style="background-color: #99cc66">학년</li>
				<li><a href="./lectureList.do?grade=1&gwamok=${gwamok}">1학년</a></li>
				<li><a href="./lectureList.do?grade=2&gwamok=${gwamok}">2학년</a></li>
				<li><a href="./lectureList.do?grade=3&gwamok=${gwamok}">3학년</a></li>
				<li><a href="./lectureList.do?grade=4&gwamok=${gwamok}">4학년</a></li>
				<li><a href="./lectureList.do?grade=5&gwamok=${gwamok}">5학년</a></li>
				<li><a href="./lectureList.do?grade=6&gwamok=${gwamok}">6학년</a></li>
			</ul>		
	</div>
	
	<div class="menu2">
			<!-- 과목 카테고리 -->
			<ul>				
				<li style="background-color: #99cc66">과목</li>
				<li><a href="lectureList.do?grade=${grade }&gwamok=국어">국어</a></li>
				<li><a href="lectureList.do?grade=${grade }&gwamok=수학">수학</a></li>
				<li><a href="lectureList.do?grade=${grade }&gwamok=사회">사회</a></li>
				<li><a href="lectureList.do?grade=${grade }&gwamok=과학">과학</a></li>
			</ul>		
	</div>
	
	<hr>
	<div class="view">
		<table class="table">
			<tr>
				<td><img src="img/lecture_desc.png" width="80px" height="80px"></td>
				<td>${categoryInfo }</td>
			</tr>
		</table>
	</div>
	<hr>
	<div class="menu3">
			<!-- 강의 카테고리 -->
			<ul>				
				<li style="background-color: #99cc66">강의</li>
				<li class="active"><a data-toggle="tab" href="#menu1" onclick="listShow()">목록</a></li>
				<li><a data-toggle="tab" href="#menu2" onclick="qnaShow()">학습Q&A</a></li>
				<li><a data-toggle="tab" href="#menu3" onclick="postShow()">수강후기</a></li>
			</ul>		
	</div>
	<hr>
<div class="tab-content" style="width: 90%; color: black; height: 400px;">
<div  id="menu1" class="tab-pane fade in active">
<div id="a">
총 <span style="color: red;"><strong>${total}</strong></span>개의 강좌가 있습니다.
<br/><br/>

<table class="table">
	<tr align="center" >
		<th>회차</th>
		<th >강의명</th>
		<th>강의</th>
		<th>강의시간</th>
		<th>선생님</th>
		<th>학습하기</th>
	</tr>

<c:set var="lectureNo" value="${lectureNo }" />	
<c:forEach var="dto" items="${list }" >
<c:set var="lectureNo" value="${lectureNo-1 }" />

	<tr align="center">
		<td>${lectureNo }</td>
		<td>${dto.subject }</td>
		<td>${dto.poster }</td>
		<td>${dto.lecturetime }분</td>
		<td>${dto.teacher }</td>
		<td align="center">
		<c:choose>
		  <c:when test="${s_id != null }">
		     <a href="javascript:lectureGo(${dto.lectureno })">
		     <img src='img/btn_study_play.png' width="30" height="20"></a>
		  </c:when>
		  <c:otherwise>
		    <a href="javascript:lectureNotGo()">
		     <img src='img/btn_study_play.png' width="30" height="20"></a>
		  </c:otherwise>
    	 </c:choose>
		</td>
	</tr>
</c:forEach>

	<tr>
		<td colspan="5"><div align="center">${paging }</div></td>
	</tr>

</table>
</div>
</div>


<!-- 학습QnA 탭 -->
<div id="menu2" class="tab-pane fade">

<div id="b">
<!-- 학습QnA List탭 -->
<div id="qnaList">
총 <span style="color: red;"><strong>${qnaTotal}</strong></span>개의 Q&A가 있습니다.
<br/>
<div align="right">
<c:choose>
<c:when test="${s_id != null }">
<a href="javascript:qnaCreate()"><img src='./img/bt_write.gif' width="40" height="20"></a>
</c:when>
<c:otherwise>
<a href="javascript:lectureNotGo()"><img src='./img/bt_write.gif' width="40" height="20"></a>
</c:otherwise>
</c:choose>
</div>
<br/>
<table class="table">
	<tr align="center" >
		<th>순번</th>
		<th >작성자</th>
		<th>제목</th>
		<th>등록일</th>
		<th>조회수</th>
	</tr>

<c:set var="QnAno" value="${QnAno+1 }" />	
<c:forEach var="qnaDto" items="${qnaList }" >
<c:set var="QnAno" value="${QnAno-1 }" />

	<tr align="center">
		<td>${QnAno }</td>
		<td>${qnaDto.id }</td>
		<td>${qnaDto.subject }</td>
		<td>${qnaDto.regdate }</td>
		<td>${qnaDto.readcnt }</td>
	</tr>
</c:forEach>

	<tr>
		<td colspan="5"><div align="center">${qnaPaging }</div></td>
	</tr>

</table>
</div>

<!--  List 끝  -->

<!--  QnA 등록  -->
<div id="qnaCreate" align="center" style="display:none">
<form name='qnaCreateForm' id="qnaCreateForm" method="post" >  <!-- action="insert.do" -->
 	<input type="hidden" name='QnAno' id='QnAno' value='${lectureqnano}'>
	<input type='hidden' name='gwamok' id='gwamok' value='${gwamok}'> 
	<input type='hidden' name='grade' id='grade' value='${grade}'>
 
 <table border ="0" width="100%" class="table" style="text-align:center">
	<tr bgcolor="#f5f7f9">
		<th style="text-align:center" valign="bottom"><a >제목</a></th>
		<td bgcolor="#ffffff"><input type="text" name="subject" size="100"></td>
	</tr>
	<tr bgcolor="#f5f7f9">
		<th style="text-align:center" valign="bottom">아이디</th>
		<td bgcolor="#ffffff">${s_id }</td>
	</tr>
	<tr bgcolor="#f5f7f9">
		<th style="text-align:center"  valign="bottom">내용</th>
		<td bgcolor="#ffffff"><textarea cols="50" rows="7" name="content"></textarea></td>
	</tr>
</table> 
 <div align="right">
	<input name="btnCreate" type="button" class="btn btn-warning button" value="등록" onclick="validate(this.form)">
 	<input name="btnCancel" type="button" class="btn btn-warning button" value="취소" onclick="javascript:history.go()">
 	<!-- <a id="btnCreate" href="javascript:qnaApply()">	<img src='img/btn.gif'></a>
	<a id="btnCancel" href="javascript:history.go()">	<img src='img/btn_del.gif'></a> -->
  </div>
</form>
</div>
</div>
</div>
<!-- 후기 탭 -->
<div id="menu3" class="tab-pane fade">
<div id="c">
총 <span style="color: red;"><strong>${postTotal}</strong></span>개의 후기가 있습니다.
<br/>
<div> </div>
<br/>

<table class="table">
	<tr align="center" >
		<th>순번</th>
		<th >작성자</th>
		<th>내용</th>
		<th>등록일</th>
		<th>수정/삭제</th>
	</tr>

<c:set var="postNo" value="${postNo+1 }" />	
<c:forEach var="postDto" items="${postList }" >
<c:set var="postNo" value="${postNo-1 }" />

	<tr align="center">
		<td>${postNo }</td>
		<td>${postDto.id }</td>
		<td>${postDto.content }</td>
		<td>${postDto.regdate }</td>
		<td>
		<c:choose>
		<c:when test="${s_id != null }">
		<a href="javascript:postUpdate(${postDto.postscriptno })"><img src='img/bt_mod.gif'></a>
		<a href="javascript:postDelete(${postDto.postscriptno })"><img src='img/bt_del.gif'></a>
		</c:when>
		<c:otherwise>
		<a href="javascript:lectureNotGo()"><img src='img/bt_mod.gif'></a>
		<a href="javascript:lectureNotGo()"><img src='img/bt_del.gif'></a>
	</c:otherwise>
    </c:choose>
		</td>
	</tr>
</c:forEach>

	<tr>
		<td colspan="5"><div align="center">${postPaging }</div></td>
	</tr>

</table>


<div style='background-color:#f8f8f8; padding:25px;'>
<form name='postForm' id='postForm' method='post'>  
	<input type='hidden' name='postscriptno' id='postscriptno' value='${postscriptno}'>
	<input type='hidden' name='gwamok' id='gwamok' value='${gwamok}'>
	<input type='hidden' name='grade' id='grade' value='${grade}'>
      
	<span class="star-cb-group">
		<input type="radio" id="rating-5" name="rating" value="5" onclick="alert1(this.value)" checked="checked"/><label for="rating-5">5</label>
		<input type="radio" id="rating-4" name="rating" value="4" onclick="alert1(this.value)" /><label for="rating-4">4</label>
		<input type="radio" id="rating-3" name="rating" value="3" onclick="alert1(this.value)" /><label for="rating-3">3</label>
		<input type="radio" id="rating-2" name="rating" value="2" onclick="alert1(this.value)" /><label for="rating-2">2</label>
		<input type="radio" id="rating-1" name="rating" value="1" onclick="alert1(this.value)" /><label for="rating-1">1</label>
	</span>
	<span id="demo" style="font-size:12px;">&nbsp;별점:&nbsp;5</span><br />
	<script>
	function alert1(val) {
		alert(val);
		document.getElementById("demo").innerHTML = '&nbsp;별점:&nbsp;'+val;
	}
	</script>
    <textarea name='content' id='content' rows="5" cols="50" style="width: 88%; height:53px;"></textarea>
    <!-- <br><br> -->
	<c:choose>
	<c:when test="${s_id != null }">
		<a id="btnCreate" href="javascript:postApply()">	<img src='img/btn.gif'></a>
		<a id="btnUpdate" href="javascript:updateProc()" style="display:none">	<img src='img/btn.gif'></a>		  
	</c:when>
	<c:otherwise>
		<a href="javascript:lectureNotGo()">	<img src='img/btn.gif'>
		</a>
	</c:otherwise>
    </c:choose>
<!--
 	<a href="javascript:postCancel()"><img src='img/btn_cancel02.gif'></a>
	<input type='button' name='btnCreate' value='등록'      onclick='createProc()'>  
    <input type='button' name='btnDelete' value='삭제'  onclick='deleteProc()' style='display:none'>
    <input type='button' name='btnUpdate' value='수정'  onclick='updateProc()' style='display:none'>
    <input type='button' name='btnCancel' value='취소'      onclick='cancel()'> -->
</form>
</div>
</div>
</div>
</div>
</div>
<!-- page end-->
<%@ include file="../sol_footer.jsp"%>