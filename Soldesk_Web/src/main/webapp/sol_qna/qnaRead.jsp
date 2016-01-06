<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../sol_header.jsp"%>
<script src="js/my.js"></script>
<link href="./css/style.css" rel="stylesheet" type="text/css">
<!-- page start-->
<style>
.replydiv{
	background-color : #f8f8f8;
	padding-top: 0px;
    padding-right: 30px;
    padding-bottom: 30px;
    padding-left: 50px;
}
</style>
<script>
function replyForm(){
	//$("#replyno").val(0);
	$("#replyno").remove();
	if($.trim($("#content").val()) == "") {
		alert("답변을 입력해주세요");
		$("#content").focus();
		return;
	}
	var param = $("#frm").serialize();
	msg="답변을 등록하시겠습니까? ";
	if(confirm(msg)!=0){
		$.ajaxSetup({datatype:"text"});
		$.post("./create.do", param, createPrcoResponse);
	}else{
		return;
	}
}

function createPrcoResponse(data,status){	
	window.location.reload();			
}

function deleteReply(replyno,qnano){
	msg="답변을 삭제하시겠습니까? ";
	if(confirm(msg)!=0){
		$("#replyno").val(replyno);
		var param = "replyno="+replyno+"&tableno="+qnano;
		$.post("./replyDel.do", param, deletePrcoResponse);
	}else{
		return;
	}
}

function deletePrcoResponse(data,status){
	var str =data.replace(/^\s+|\s+$/gm,'');
	var result = str.split("/");
	if(result[0]=="success"){
			alert(result[1]);
			window.location.reload();
	}else if(result[0]=="fail1"){	
		alert(result[1]);
	}else{
		alert(result[1]);
	}
}

function updateReply(replyno,qnano){
	$("#replyno").val(replyno);
	$.ajax({
		cache:false,
		type: "get",	//요청방식
		url: "replyUpdate.do?replyno="+replyno+"&tableno="+qnano,//서버측페이지
		datatype:"text",	//응답페이지 타입 설정
		success:function(data){
			var str =data.replace(/^\s+|\s+$/gm,'');
			var result = str.split("|");
			if(result[0]=="success"){
					//alert(result[1]);
				document.getElementById("demo").innerHTML = "";
				document.getElementById("demo").innerHTML = result[1];
				document.getElementById("update").style.display = "none";
				document.getElementById("cancel").style.display = "";
			}else{	
				alert(result[1]);
			}
		},
		error:function(err){	//응답 결과 상태코드가 실패했을때
			alert(err+"오류발생");
		}
	});
}

function updateResponse(data,status){
	var str =data.replace(/^\s+|\s+$/gm,'');
	var result = str.split("|");
	if(result[0]=="success"){
		document.getElementById("demo").innerHTML = "";
		document.getElementById("demo").innerHTML = result[1];
	}else{	
		alert(result[1]);
	}
} 


function replyUpdateProc(replyno){
	var param = $("#frm").serialize();
	msg = "답변글을 수정하시겠습니까?";
	if (confirm(msg)!=0) {
		$.ajaxSetup({datatype:"text"});
		$.get("./replyUpdateProc.do", param, updatePrcoResponse);
	}else{
		return;
	}
}

function updatePrcoResponse(data,status){
	var str =data.replace(/^\s+|\s+$/gm,'');
	var result = str.split("|");
	if(result[0]=="success"){
			window.location.reload();		
	}else{	
		alert(result[1]);
	}
} 

function deleteQna(qnano){
	msg="게시글을 삭제하시겠습니까? \n ( 답변글이 존재할 경우 답변글도 모두 삭제됩니다. )";
	if (confirm(msg)!=0) {
		location.href="delete.do?qnano="+qnano;
	}else{
		return;
	}
}


function updateQna(qnano,recNo){
	msg="게시글을 수정하시겠습니까?";
	if(confirm(msg)!=0){
		location.href="update.do?qnano="+qnano+"&recNo="+recNo;
	}else{
		return;
	}
}
function cancel(){
	document.getElementById("demo").innerHTML = "";
	document.getElementById("demo").innerHTML = "${rdto.content }";
	document.getElementById("update").style.display = "";
	document.getElementById("cancel").style.display = "none";
}

</script>

<c:if test="${msg==2 }">
	<script>
		alert("답변글이 존재하여 수정이 불가능합니다. ");
		location.href="read.do?qnano="+${qnano}+"&recNo="+${recNo};
	</script>
</c:if>

<h4>
<img src="../sol_img/go_right.png" width="20px"/>
<img src="../sol_img/logos/qna_desc.png" width="120px" height="50px"><span style="font-size: 12px;">| 무엇이든 물어보세요</span>
</h4>
<hr>
<br />
<table class="table" style="color: #000000;">
	<tr bgcolor="#f8f8f8">
		<td width="60px">제목</td>
		<td ><strong>${dto.subject }</strong></td>
		<td></td>
		<td></td>
		<td colspan="2">
			<c:if test="${dto.replyok=='N' }">미답변</c:if>
			<c:if test="${dto.replyok=='Y' }">답변완료</c:if>
	
		</td>
	</tr>
	<tr>
		<td width="60px">ID</td>
		<td>${dto.passwd }</td>
		<td width="60px">작성일</td>
		<td><c:set var="regdt" value="${dto.regdt }" />
			${fn:substring(regdt,0,16) }</td>
		<td width="60px">조회수</td>
		<td>${dto.readcnt }</td>
	</tr>

	<tr>
		<td colspan="6">
		<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");									
		pageContext.setAttribute("crlf", "\r\n");									
		</jsp:scriptlet>
		${fn:replace(dto.content,crlf,'<br/>') }</td>
	</tr>

</table>
<br/><br/>

<c:if test="${dto.id == s_id }">
	<div align="right">	
		<input type="button" class="btn btn-warning button" value="수정" onclick="updateQna(${param.qnano },${param.recNo })">
		<input type="button" class="btn btn-warning button" value="삭제" onclick="deleteQna(${param.qnano })">
		<input type="button" class="btn btn-warning button" value="목록" onclick="location.href='./list.do'">
	</div>
</c:if>

<c:if test="${dto.id != s_id }">
	<div align="right">	
		<input type="button" class="btn btn-warning button" value="목록" onclick="location.href='./list.do'">
	</div>
</c:if>
<br/>
<div align="left" style="background-color: #f8f8f8; padding: 25px;">
	
	<c:if test="${dto.replyok=='Y' }">
		<table style="border: 0; width:100%; color: #000000;">
			<tr>
 				<td>
 					<img src="../sol_img/answer.png" width="15">&nbsp;&nbsp;<strong>답변 입니다.</strong>
 					<c:set var="regdt2" value="${rdto.rdate }" />&nbsp;<sup>${fn:substring(regdt2,0,16) }</sup>
 				</td>
 				<c:if test="${mlevel=='A'  }">
				<td style="text-align:right;">
				
						<div id="update" style="display: ;">
							<a href="javascript:updateReply(${rdto.replyno },${param.qnano },'Y');">수정</a> | 
							<a href="javascript:deleteReply(${rdto.replyno },${param.qnano });">삭제</a> 
						</div>
 						<div id="cancel" style="display: none;">
							<a href="javascript:cancel(${rdto.replyno });">수정취소</a>
						</div>
				</td>
				</c:if>
 			</tr>
		</table>
		<div id ="demo" style="color: #000000;">
				<jsp:scriptlet>
				pageContext.setAttribute("cr", "\r");
				pageContext.setAttribute("lf", "\n");									
				pageContext.setAttribute("crlf", "\r\n");									
				</jsp:scriptlet>
				${fn:replace(rdto.content,crlf,'<br/>') }
		</div>
	</c:if>

	<form name="frm" id ="frm" method="post"  style="color: #000000;">
		<input type="hidden" name="tableno" id="tableno" value="${param.qnano }">
		<input type="hidden" name="passwd" id="passwd" value="${s_id }">
		<input type="hidden" name="replyno" id="replyno">
			<c:if test="${mlevel=='A' and replyok=='N'}">
				※ 답변을 달아주세요. ※
				<textarea name="content" id="content" rows="5" cols="70" style="width: 89%; height:53px;"></textarea>
				<img src="img/btn_submit.png" onclick="replyForm()"/>
			</c:if>
	</form>

	<c:if test="${mlevel!='A' and replyok=='N'}">
		<div align="center"  style="color: #000000;">
			<img src="img/sad.png" width="20">
			<strong>아직 등록된 답변이 없습니다. </strong>
		</div>
	</c:if>

</div>

<!-- page end-->
<%@ include file="../sol_footer.jsp"%>