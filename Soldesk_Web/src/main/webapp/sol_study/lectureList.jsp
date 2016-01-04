<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../sol_header.jsp"%>
<%@page import="net.utility.Utility"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- page start-->
<!-- <script src="js/postscript.js"></script>-->
<script src="js/my.js"></script>
<script>
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


</script>

<link href="./css/style.css" rel="stylesheet" type="text/css">
<link rel='stylesheet' type='text/css' href='css/star.css'>
<h4>
	<img src="../sol_img/go_right.png" width="20px"/>
	<img src="img/study.png" width="150px" height="50px"><span style="font-size: 12px;">| 학습해 보세요 </span> 
</h4>
<div class="column">
	<div class="view">
		<table class="table">
			<tr>
				<td><img src="img/lecture_desc.png" width="80px" height="80px"></td>
				<td>${categoryInfo }</td>
			</tr>
		</table>
	</div>

	<div class="menu3">
	<!-- 강의 카테고리 -->
	<ul>
		<li style="background-color: #99cc66">강의</li>
		<li><a onclick="location.href='lectureList.do?grade=${grade}&gwamok=${gwamok}&tabNfum=1'">목록</a></li>
		<li><a onclick="location.href='lectureList.do?grade=${grade}&gwamok=${gwamok}&tabNum=2'">학습Q&A</a></li>
		<li><a onclick="location.href='lectureList.do?grade=${grade}&gwamok=${gwamok}&tabNum=3'">수강후기</a></li>
	</ul>		
</div>

<div class="tab-content" style="width: 100%; color: black; height: 500px;">
<c:if test="${tabNum == 1}">
<div  id="menu1">
총 <span style="color: red;"><strong>${total}</strong></span>개의 강좌가 있습니다.
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
</c:if>

<!-- 학습QnA 탭 -->
<script>
//Q&A 등록
function qnaApply(frm){
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

	  msg="QnA를 등록하시겠습니까?";
	  if(confirm(msg)!=0){
			var param=$("#qnaCreateForm").serialize();  //<form id=frm> 전송할 데이터가 있는 폼
			//alert(document.getElementById("qnaCreateForm"));
			$.ajaxSetup({datatype: "text"});  //AJAX객체준비
			//alert(param);
			//post방식. 응답이 성공하면 실행할 callback함수
			$.post("./qnaCreate.do", param, postApplyResponse);
	  }else{
		  return;
	  }
}//end
//학습qna리스트
function qnaShow(){
    document.getElementById("qnaList").style.display = '';
    document.getElementById("qnaCreate").style.display = 'none';
    document.getElementById("qnaRead").style.display = 'none';
    
}//end

//학습QnA 글쓰기
function qnaCreate(){
    document.getElementById("qnaList").style.display = 'none';
    document.getElementById("qnaCreate").style.display = '';
    document.getElementById("qnaRead").style.display = 'none';
}// end


</script>

<c:if test="${tabNum==2 }">
<div id="menu2">
<!-- 학습QnA List -->
<div id="qnaList">

총 <span style="color: red;"><strong>${qnaTotal}</strong></span>개의 Q&A가 있습니다.<br /><br />

<table class="table">
<tr align="center" >
	<td width="60">번호</td>
	<td>제목</td>
	<td width="100">ID</td>
	<td width="100">작성일</td>
	<td width="60">조회수</td>
</tr>

<c:set var="QnAno" value="${QnAno }" />    
<c:forEach var="qnaDto" items="${qnaList }" >
<c:set var="QnAno" value="${QnAno-1 }" />

<tr align="center">
	<td>${QnAno }</td>
	<td><a href="javascript:qnaRead(${qnaDto.lectureqnano })">${qnaDto.subject }</a></td>
	<td>${qnaDto.id }</td>
	<td><c:set var="pregdt" value="${qnaDto.regdate }"/>${fn:substring(pregdt,0,10) }</td>
	<td>${qnaDto.readcnt }</td>
</tr>
</c:forEach>

<tr>
	<td colspan="5"><div align="center">${qnaPaging }</div></td>
</tr>

</table>

<div align="right">
	<input type="button" value="글쓰기" class="btn btn-warning button"
		<c:if test="${s_id == null }">onclick="lectureNotGo()"</c:if>
		<c:if test="${s_id != null }">onclick="qnaCreate()"</c:if>>
</div>
</div>

<!-- 학습QnA Form -->
<div id="qnaCreate" align="center" style="display:none">

<form name='qnaCreateForm' id="qnaCreateForm" method="post" style="width: 98%;">  <!-- action="insert.do" -->
 	<input type="hidden" name='QnAno' id='QnAno' value='${lectureqnano}'>
	<input type='hidden' name='gwamok' id='gwamok' value='${gwamok}'> 
	<input type='hidden' name='grade' id='grade' value='${grade}'>
 
 <table border ="0" width="100%" class="table" style="text-align:center">
	<tr bgcolor="#f5f7f9">
		<th style="text-align:center" valign="bottom"><a onclick="qnaRead()">제목</a></th>
		<td bgcolor="#ffffff"><input type="text" name="subject" size="100"></td>
	</tr>
	<tr bgcolor="#f5f7f9">
		<th style="text-align:center" valign="bottom">ID</th>
		<td bgcolor="#ffffff">${s_id }</td>
	</tr>
	<tr bgcolor="#f5f7f9">
		<th style="text-align:center"  valign="bottom">내용</th>
		<td bgcolor="#ffffff"><textarea cols="50" rows="7" name="content"></textarea></td>
	</tr>
</table> 
 <div align="right">
	<input name="btnCreate" type="button" class="btn btn-warning button" value="등록" onclick="qnaApply(this.form)">
 	<input name="btnCancel" type="button" class="btn btn-warning button" value="취소" onclick="javascript:history.go()">
 

  </div>
</form>
</div>
</div>

</c:if>

<script>

//학습QnA 자세히보기
function qnaRead(lectureqnano) {
	document.getElementById("qnaList").style.display = 'none';
    document.getElementById("qnaCreate").style.display = 'none';
    document.getElementById("qnaRead").style.display = '';

    var param="lectureqnano="+lectureqnano; // 전달할 데이터
    //alert(param);
    $.ajaxSetup({dataType:"text"});
    $.get("./qnaRead.do",param,qnaReadResponse); // get방식
    
}

function qnaReadResponse(data,status){
    var sw=data.replace(/^\s*|\s*$/g, '');
    //alert(sw);
    var result=sw.split("/"); // 문자를 분할해서 배열값으로 리턴
  	//alert(result[5]);
  	document.getElementById("subject").innerHTML=result[0];
  	document.getElementById("readid").innerHTML=result[1];
  	document.getElementById("regdate").innerHTML=result[2];
  	document.getElementById("content").innerHTML=result[3];
  	document.getElementById("readcnt").innerHTML=result[4];
  	//document.qnaReadForm.updateid.value=result[1];
  	if(result[5]=="true"){
  		document.getElementById("idcheck1").style.display = '';
  		document.getElementById("idcheck2").style.display = 'none';
  	}

}


//수정할 댓글 조회
function updateForm(replyno){
  $("#replyno").val(replyno);
  var param="replyno="+replyno; // 전달할 데이터
  $.ajaxSetup({dataType:"text"});
  $.get("./read.do",param,updateFormResponse); // get방식
}

function updateFormResponse(data,status){
  //alert(data);
  $("#content").val(data.replace(/^\s*|\s*$/g, ''));
  document.frm.btnCreate.style.display='none';
  document.frm.btnUpdate.style.display='';
  document.frm.btnDelete.style.display='none';
  document.frm.btnCancel.style.display='';  
}


//수정 저장
function updateProc() {
  var param=$("#frm").serialize();
  $.ajaxSetup({dataType:"text"});
  $.post("./update.do",param,updateProcResponse);	
}

function updateProcResponse(data,textStatus){
  var sw=data.replace(/^\s*|\s*$/g, ''); // "FAIL/패스워드~~"
  var result=sw.split("/"); // 문자를 분할해서 배열값으로 리턴
  if(result[0]=='FAIL'){
	 alert(result[1]);
  }
  else { // SUCCESS
	 alert(result[1]);
     window.location.reload();
  }
  
}

</script>

<!-- 학습QnA 자세히보기 -->

<div id="qnaRead" align="center" style="display:none">
<form name='qnaReadForm' id="qnaReadForm" method="post" >  <!-- action="insert.do" -->
 	<input type="hidden" name='QnAno' id='QnAno' value='${lectureqnano}'>
	<input type='hidden' name='gwamok' id='gwamok' value='${gwamok}'> 
	<input type='hidden' name='grade' id='grade' value='${grade}'>
 <table border ="0" width="100%" class="table" style="text-align:center">
	<tr bgcolor="#f5f7f9">
		<td style="text-align:center" valign="bottom">제목</td>
		<td bgcolor="#ffffff"><strong><span id="subject"></span></strong></td>	
		<td> </td>
		<td> </td>
		<td> </td>
		<td> </td>
	</tr>
	<tr bgcolor="#f5f7f9">
		<th style="text-align:center" valign="bottom">ID</th>
		<td bgcolor="#ffffff" id="readid"></td>
		<td width="60px">작성일</td>
		<td><span id="regdate"></span>
			${fn:substring(regdate,0,16) }</td>
		<td width="60px">조회수</td>
		<td><span id="readcnt"></span></td>
	</tr>
	<tr bgcolor="#f5f7f9">
		<td bgcolor="#ffffff"><span id="content"></span></td>
	</tr>
</table> 
 <div align="right">
 	<div id="idcheck1" style="display:none">
	<input name="btnMod" type="button" class="btn btn-warning button" value="수정" onclick="qnaApply(this.form)">
 	<input name="btnDelete" type="button" class="btn btn-warning button" value="삭제" onclick="qnaDelete()">
 	<input name="btnList" type="button" class="btn btn-warning button" value="목록" onclick="javascript:history.go()">
 	</div>
 	<div id="idcheck2" >
 	<input name="btnList" type="button" class="btn btn-warning button" value="목록" onclick="javascript:history.go()">
 	</div>
 

  </div>
</form>
</div>
</div>


<!-- 후기 탭 -->
<script>
//후기 등록
function postApply(){
	if($.trim($("#content").val()) == "") {
		alert("후기내용을 입력해주세요");
		$("#content").focus();
		return;
	}
	
	msg = "후기를 등록하시겠습니까?";
    if (confirm(msg)!=0) {
    	$("#postscriptno").remove();
    	var param=$("#postForm").serialize();  //<form id=frm> 전송할 데이터가 있는 폼
    	$.ajaxSetup({datatype: "text"});  //AJAX객체준비
    	//alert(param);
    	//post방식. 응답이 성공하면 실행할 callback함수
    	$.post("./create.do", param, postApplyResponse);
    	
    } else {
        return;
	} 
}
// 후기 삭제
function postDelete(postscriptno) {
	msg = "후기를 삭제하시겠습니까?";
    if (confirm(msg)!=0) {
    	var param="postscriptno="+postscriptno;         //전송 데이터
    	//alert(param);
    	$.ajaxSetup({datatype: "text"});
    	$.get("./delete.do", param, postApplyResponse); //get방식	
    	
    } else {
        return;
	} 
}
//수정할 댓글 조회
function postUpdate(postscriptno){
	$("#postscriptno").val(postscriptno);
	$.ajax({
		cache:false,
		type: "get",	//요청방식
		url: "read.do?postscriptno="+postscriptno,//서버측페이지
		datatype:"text",	//응답페이지 타입 설정
		success:function(data){
			var str =data.replace(/^\s+|\s+$/gm,'');
			//alert(str);
			var result = str.split("/");
			if(result[0]=="SUCCESS"){
			$("#content").val(result[1]);
			//alert(result[1]);
			//alert(result[2]);
			document.getElementById("rating-"+ result[2]).checked='checked';
			document.getElementById("demo").innerHTML = '&nbsp;별점:&nbsp;'+result[2];
			document.getElementById("btnCreate").style.display = 'none';
			document.getElementById("btnUpdate").style.display = '';
			}
			
		},
		error:function(err){	//응답 결과 상태코드가 실패했을때
			alert(err+"오류발생");
		}
	});
}
//수정 저장
function updateProc() {
	$("#grade").remove();
	$("#gwamok").remove();
	alert("후기를 수정하시겠습니까?");
	var param=$("#postForm").serialize();
	//alert(param);
	$.ajaxSetup({dataType:"text"});
	$.post("./update.do",param,postApplyResponse);	
}
</script>
<c:if test="${tabNum == 3}">
<div id="menu3">
총 <span style="color: red;"><strong>${postTotal}</strong></span>개의 후기가 있습니다.
<br/>
<table class="table">
<tr align="center" >
	<th width='60'>순번</th>
	<th>내용</th>
	<th width='60'></th>
	<th width='60'>작성자</th>
	<th width='100'>등록일</th>
	<th width='100'>강의만족도</th>
</tr>

<c:set var="postNo" value="${postNo+1 }" />	
<c:forEach var="postDto" items="${postList }" >
<c:set var="postNo" value="${postNo-1 }" />
<tr align="center">
	<td>${postNo }</td>
	<td>${postDto.content }</td>
	<td><c:if test="${s_id eq postDto.id}">
		<a href="javascript:postUpdate(${postDto.postscriptno })"><span style="color:red;">수정</span></a> | 
		<a href="javascript:postDelete(${postDto.postscriptno })"><span style="color:red;">삭제</span></a></c:if>
	</td>
	<td>${postDto.id }</td>
	<td><c:set var="pregdt" value="${postDto.regdate }"/>${fn:substring(pregdt,0,10) }</td>
	<td><c:if test="${postDto.postgrade==5 }"><img src="img/rating_5.gif"></c:if>
	<c:if test="${postDto.postgrade==4 }"><img src="img/rating_4.gif"></c:if><c:if test="${postDto.postgrade==3 }"><img src="img/rating_3.gif"></c:if>
	<c:if test="${postDto.postgrade==2 }"><img src="img/rating_2.gif"></c:if><c:if test="${postDto.postgrade==1 }"><img src="img/rating_1.gif"></c:if></td>
</tr>
</c:forEach>

<tr>
	<td colspan="6"><div align="center">${postPaging }</div></td>
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
</form>
</div>
</div>
</c:if>
<!-- 후기 탭 끝 -->

</div>
</div>
<!-- page end-->
<%@ include file="../sol_footer.jsp"%>