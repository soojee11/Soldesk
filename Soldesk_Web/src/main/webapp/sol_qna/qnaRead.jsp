<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../sol_header.jsp"%>
<script src="js/my.js"></script>
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
	alert("답변을 등록하시겠습니까? ");
	$.ajaxSetup({datatype:"text"});
	
	$.post("./create.do", param, createPrcoResponse);
}
function createPrcoResponse(data,status){	
	alert(data.replace(/^\s+|\s+$/gm,'')); 
	window.location.reload();			
}
function deleteReply(replyno,qnano){
	$("#replyno").val(replyno);
	
	var param = "replyno="+replyno+"&tableno="+qnano;
	
	$.post("./replyDel.do", param, deletePrcoResponse);
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
	var param = "replyno="+replyno+"&tableno="+qnano;
	$.get("./replyUpdate.do", param, updateResponse);
}
function updateResponse(data,status){
	var str =data.replace(/^\s+|\s+$/gm,'');
	var result = str.split("|");
	if(result[0]=="success"){
			//alert(result[1]);
		document.getElementById("demo").innerHTML = "";
		document.getElementById("demo").innerHTML = result[1];
	}else{	
		alert(result[1]);
	}
} 

function replyUpdateProc(replyno){
	var param = $("#frm").serialize();
	alert("답변글을 수정하시겠습니까? ");
	$.ajaxSetup({datatype:"text"});
	$.get("./replyUpdateProc.do", param, updatePrcoResponse);
}

function updatePrcoResponse(data,status){
	var str =data.replace(/^\s+|\s+$/gm,'');
	var result = str.split("|");
	if(result[0]=="success"){
			alert(result[1]);
			window.location.reload();		
	}else{	
		alert(result[1]);
	}
} 


function deleteQna(qnano){
	
	alert("게시글을 삭제하시겠습니까? ( 답변글이 있을경우 답변글도 모두 삭제됩니다. )");
	location.href="delete.do?qnano="+qnano;
}
function updateQna(qnano,recNo){
	
	alert("게시글을 수정하시겠습니까? ( 답변글이 있을경우 수정은 불가합니다. )");
	location.href="update.do?qnano="+qnano+"&recNo="+recNo;
}
</script>
<c:if test="${msg==2 }">
	<script>
		alert("답변글 존재! 수정불가 ");
	</script>
</c:if>
<br />
<h3><img src="../sol_img/go_right.png" width="20px"/>
Q&A&nbsp;&nbsp;<span style="font-size: 12px;">| 무엇이든 물어보세요. </span></h3>
<hr>
<br />
<table class="table">
	<tr bgcolor="#f8f8f8">
		<td>${recNo }</td>
		<td><img src="../sol_img/question.png" width="15">&nbsp;&nbsp;<strong>${dto.subject }</strong></td>
		<td>
			<c:if test="${dto.replyok=='N' }">미답변</c:if>
			<c:if test="${dto.replyok=='Y' }">답변완료</c:if>
		</td>
		<td>${dto.id }</td>
	</tr>
	<tr>
		<td>작성일</td>
		<td>
			<c:set var="regdt" value="${dto.regdt }"/> ${fn:substring(regdt,0,10) }
		</td>
		<td>조회수</td>
		<td>${dto.readcnt }</td>
	</tr>
	<tr>
		<td colspan="4">${dto.subject }</td>
	</tr>
</table>
<br/><br/>
<c:if test="${dto.id == s_id }">
	<div align="right">	
		<input type="button" value="수정" onclick="updateQna(${param.qnano },${param.recNo })">
		<input type="button" value="삭제" onclick="deleteQna(${param.qnano })">
		<input type="button" value="목록" onclick="location.href='./list.do'">
	</div>
</c:if>
<c:if test="${dto.replyok=='Y' }">
	<div align="left" class="replydiv">
		<table class="table">
			<tr bgcolor="#f8f8f8">
 				<td>${recNo }</td>
 				<td><img src="../sol_img/answer.png" width="15">&nbsp;&nbsp;<strong>답변 입니다.</strong></td>
 				<td>작성일</td>
 				<td><c:set var="regdt2" value="${rdto.rdate }"/> ${fn:substring(regdt2,0,10) }</td>
 			</tr>
		</table>
		${rdto.content }
	<c:if test="${mlevel=='A'  }">
	<div align="right">	
	<br><br>
		<input type="button" value="수정" onclick="updateReply(${rdto.replyno },${param.qnano })">
		<input type="button" value="삭제" onclick="deleteReply(${rdto.replyno },${param.qnano })">
		<input type="button" value="목록" onclick="location.href='./list.do'">
	</div>
	</c:if>	
	</div>
</c:if>
<hr>
<div align="center">
<form name="frm" id ="frm" method="post">
<input type="hidden" name="tableno" id="tableno" value="${param.qnano }">
<input type="hidden" name="passwd" id="passwd" value="${s_id }">
<input type="hidden" name="replyno" id="replyno">
	<div id ="demo">
		<c:if test="${mlevel=='A' and replyok=='N'}">
			※ 답변을 달아주세요. ※
			<textarea name="content" id="content" rows="5" cols="70"></textarea>
			<input type="button" value="답변" onclick="replyForm()">
			<input type="button" value="목록" onclick="location.href='./list.do'">
		</c:if>
	</div>
</form>
</div>
<div align="center">
	<c:if test="${mlevel!='A' and dto.replyok=='Y'}">
		<input type="button" value="목록" onclick="location.href='./list.do'">
	</c:if>
</div>

<!-- page end-->
<%@ include file="../sol_footer.jsp"%>