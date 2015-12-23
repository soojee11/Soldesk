<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../sol_header.jsp"%>
<!-- page start-->
<script>
//댓글추가
function replyCreate() {
	$("#replyno").remove();
	if($.trim($("#content").val()) == "") {
		alert("답변을 입력해주세요");
		$("#content").focus();
		return;
	}
	
	msg = "답변을 등록하시겠습니까?";
    if (confirm(msg)!=0) {
    	var param=$("#frm").serialize();
    	
    	$.ajaxSetup({datatype:"text"});
    	$.post("./bbsReplyCreate.do",param,replyCreateResponse);
    	
    } else {
        return;
	} 
    
}
function replyCreateResponse(data, status) {//callback
	//alert(data.replace(/^\s+|\s+$/gm,''));
	window.location.reload();
}
//댓글삭제
function deleteReply(replyno){
	msg = "답변을 삭제하시겠습니까?";
    if (confirm(msg)!=0) {
    	$("#replyno").val(replyno);
    	
    	var param=$("#frm").serialize();
    	alert(param);
    	$.ajaxSetup({datatype:"text"});
    	$.post("./bbsReplyDelete.do",param,deleteReplyResponse);
    	
    } else {
        return;
	} 
  
}
function deleteReplyResponse(data,status) {
	var str=data.replace(/^\s+|\s+$/gm,'');
	var result=str.split("/");
	alert(data.replace(/^\s+|\s+$/gm,''));
	if(result[0]=="SUCCESS") {//댓글 삭제 성공
		alert(result[1]);
		window.location.reload();
	}
	else {
		alert(result[1]);
	}
}
//댓글가져오기
function updateReply(replyno,bbsno){
	$("#replyno").val(replyno);
	var param = "replyno="+replyno;
	alert(param);
	
	$.get("./bbsReplyUpdate.do", param, updateReplyResponse);
	
}

function updateReplyResponse(data,status){
	var str =data.replace(/^\s+|\s+$/gm,'');

	var result = str.split("/");
	if(result[0]=="SUCCESS"){
		document.getElementById("content1").style.display = "none";
		document.getElementById("content2").style.display = "";

		$("#updateContent").val(result[1]);
		alert(result[1]);
		alert(result[2]);

	}else{	
		alert(result[1]);
	}
}

</script>
<style>
.replydiv {
	background-color: #f8f8f8;
	padding-top: 0px;
	padding-right: 30px;
	padding-bottom: 30px;
	padding-left: 50px;
}
</style>
<h4>
<img src="../sol_img/go_right.png" width="20px"/>
<img src="../sol_img/logos/bbs_desc.png" width="190px" height="50px"><span style="font-size: 12px;">| 자유롭게 말해보세요 </span>
</h4>
<hr>
<br />
<table class="table">
	<tr bgcolor="#f8f8f8">
		<td width="60px">제목</td>
		<td colspan="5"><strong>${dto.subject }</strong></td>
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
		<td colspan="6">${dto.content }</td>
	</tr>

</table>
<br />
<br />
<c:if test="${dto.passwd == s_id }">
	<div align="right">
		<input type="button" class="btn btn-default" name="insert" value="수정"
			onclick="location.href='bbsupdate.do?bbsno=${dto.bbsno }&nowPage=${nowPage }'">
		<input type="button" class="btn btn-default" name="reset" value="삭제"
			onclick="location.href='bbsdelete.do?bbsno=${dto.bbsno }&nowPage=${nowPage }'">
		<input type="button" class="btn btn-default" name="list" value="목록"
			onclick="location.href='bbslist.do?nowPage=${nowPage }'">
	</div>
</c:if>
<c:if test="${dto.passwd != s_id }">
	<div align="right">
		<input type="button" class="btn btn-default" name="list" value="목록"
			onclick="location.href='bbslist.do?nowPage=${nowPage }'">
	</div>
</c:if>

총 <strong>${replycnt }</strong> 개의 등록된 댓글이 있습니다.
<div style="background-color: #f8f8f8; padding: 25px;">
	<c:forEach var="rdto" items="${list }">
		<table style="border: 0; width:100%;">
		
		<tr>
			<td>
			<img src="../sol_img/answer.png" width="15">&nbsp;&nbsp;<strong>${rdto.passwd }님</strong>
			<c:set var="regdt2" value="${rdto.rdate }" />&nbsp;<sup>${fn:substring(regdt2,0,16) }</sup>
			</td>
			<c:if test="${s_id eq rdto.passwd}">
			<td style="text-align:right;">
			<span onclick="updateReply(${rdto.replyno },${param.bbsno })">수정</span> | 
			<span onclick="deleteReply(${rdto.replyno })">삭제</span>
			</td>
			</c:if>
		</tr>
		<tr>
			<td colspan="2"><span id="content1" style="display: ;">${rdto.content }</span>
			<div id="content2" style="display: none;">
			<textarea name="content" id="updateContent" rows="5" cols="50" style="width: 89%; height:53px;"></textarea>
			</div></td>
		</tr>
		</table>
		
		<hr>
	</c:forEach>

	<form name="frm" id="frm" method="post">
		<input type="hidden" name="tableno" id="tableno" value="${param.bbsno }"> 
		<input type="hidden" name="passwd" id="passwd" value="${s_id }">
		<input type="hidden" name="replyno" id="replyno" />
		<div>
			<c:if test="${s_id ne null}">
			<textarea name="content" id="content" rows="5" cols="50" style="width: 89%; height:53px;"></textarea>
			<img src="img/btn.gif" onclick="replyCreate()"/>
			</c:if>
		</div>
	</form>
</div>

<!-- page end-->
<%@ include file="../sol_footer.jsp"%>