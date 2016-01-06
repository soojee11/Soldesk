<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../sol_header.jsp"%>
<link href="./css/style.css" rel="stylesheet" type="text/css">
<!-- page start-->
<script>
//댓글추가
function replyCreate() {
	$("#createReplyno").remove();
	if($.trim($("#content").val()) == "") {
		alert("답변을 입력해주세요");
		$("#content").focus();
		return;
	}
	
	msg = "답변을 등록하시겠습니까?";
    if (confirm(msg)!=0) {
    	var param=$("#frm").serialize();
    	//alert(param);
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
    	$("#createReplyno").val(replyno);
    	
    	var param=$("#frm").serialize();
    	//alert(param);
    	$.ajaxSetup({datatype:"text"});
    	$.post("./bbsReplyDelete.do",param,deleteReplyResponse);
    	
    } else {
        return;
	} 
  
}
function deleteReplyResponse(data,status) {
	var str=data.replace(/^\s+|\s+$/gm,'');
	var result=str.split("/");
	//alert(data.replace(/^\s+|\s+$/gm,''));
	if(result[0]=="SUCCESS") {//댓글 삭제 성공
		alert(result[1]);
		window.location.reload();
	}
	else {
		alert(result[1]);
	}
}

//댓글가져오기
function updateReply(replyno){
	$.ajax({
		cache:false,
		type: "get",	//요청방식
		url: "bbsReplyUpdate.do?replyno="+replyno,//서버측페이지
		datatype:"text",	//응답페이지 타입 설정
		success:function(data){
			var str =data.replace(/^\s+|\s+$/gm,'');
			//alert(str);
			var result = str.split("/");
			if(result[0]=="SUCCESS"){
				
				document.getElementById("content"+ result[2]).style.display = "none";
				document.getElementById("updateReply" + result[2]).style.display = "";
				document.getElementById("cancel"+ result[2]).style.display = "";
				document.getElementById("update" + result[2]).style.display = "none";
				document.getElementById("updateReply" +result[2]).updateContent.value = result[1];
				//alert(result[1]);
				//alert(result[2]);


			}
		},
		error:function(err){	//응답 결과 상태코드가 실패했을때
			alert(err+"오류발생");
		}
	});
}

//댓글수정
function updateReplyProc(replyno){
	msg = "답변을 수정하시겠습니까?";
    if (confirm(msg)!=0) {
    	document.getElementById('updateReply'+replyno).replyno.value = replyno;
    	
    	var param=$('#updateReply'+replyno).serialize();
    	//alert(param);
    	$.ajaxSetup({datatype:"text"});
    	$.post("./bbsReplyUpdateProc.do",param,updateProcReplyResponse);
    	
    } else {
        return;
	}
}
function updateProcReplyResponse(data,status){
	var str =data.replace(/^\s+|\s+$/gm,'');
	var result = str.split("/");
	if(result[0]=="SUCCESS"){
		//alert(result[1]);
		window.location.reload();
	}else{	
		alert(result[1]);
	}
} 

function cancel(replyno) {
	document.getElementById("content"+ replyno).style.display = "";
	document.getElementById("updateReply" + replyno).style.display = "none";
	document.getElementById("cancel"+ replyno).style.display = "none";
	document.getElementById("update" + replyno).style.display = "";
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
<table class="table" style="color: #000000;">
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
		<input type="button" class="btn btn-warning button" name="insert" value="수정"
			onclick="location.href='bbsupdate.do?bbsno=${dto.bbsno }&nowPage=${nowPage }'">
		<input type="button" class="btn btn-warning button" name="reset" value="삭제"
			onclick="location.href='bbsdelete.do?bbsno=${dto.bbsno }&nowPage=${nowPage }'">
		<input type="button" class="btn btn-warning button" name="list" value="목록"
			onclick="location.href='bbslist.do?nowPage=${nowPage }'">
	</div>
</c:if>
<c:if test="${dto.passwd != s_id }">
	<div align="right">
		<input type="button" class="btn btn-warning button" name="list" value="목록"
			onclick="location.href='bbslist.do?nowPage=${nowPage }'">
	</div>
</c:if>
<div style="color: #000000;">
총 <strong>${replycnt }</strong> 개의 등록된 댓글이 있습니다.
</div>
<div style="background-color: #f8f8f8; padding: 25px; color: #000000;">
	<c:forEach var="rdto" items="${list }">
		<table style="border: 0; width:100%;">
		<tr>
			<td>
			<img src="../sol_img/answer.png" width="15">&nbsp;&nbsp;<strong>${rdto.passwd }님</strong>
			<c:set var="regdt2" value="${rdto.rdate }" />&nbsp;<sup>${fn:substring(regdt2,0,16) }</sup>
			</td>
			<c:if test="${s_id eq rdto.passwd}">
			<td style="text-align:right;">
				<div id="update${rdto.replyno }" style="display: ;">
				<a href="javascript:updateReply(${rdto.replyno });">수정</a> | 
				<a href="javascript:deleteReply(${rdto.replyno });">삭제</a>
				</div>
 				<div id="cancel${rdto.replyno }" style="display: none;">
				<a href="javascript:cancel(${rdto.replyno });">수정취소</a>
				</div>
			</td>
			</c:if>
		</tr>
		<tr>
			<td colspan="2">
			<div id="content${rdto.replyno }">
			${rdto.content }
			</div>
				
				<form name="updatefrm" id="updateReply${rdto.replyno }" method="post" style="display:none">
				<input type="hidden" name="replyno" id="replyno" />
				<textarea name="updateContent" id="updateContent" rows="5" cols="50" style="width: 89%; height:53px;"></textarea>
				<img src="img/btn_submit.png" onclick="updateReplyProc(${rdto.replyno})"/>
				</form>

			</td>
		</tr>
		</table>
		
		<hr>
	</c:forEach>

	<form name="frm" id="frm" method="post">
		<input type="hidden" name="tableno" id="tableno" value="${param.bbsno }"> 
		<input type="hidden" name="passwd" id="passwd" value="${s_id }">
		<input type="hidden" name="replyno" id="createReplyno" />
		<div>
			<c:if test="${s_id ne null}">
			<textarea onkeyup='displayLeng(140,"content");' name="content" id="content" rows="5" cols="50" style="width: 89%; height:53px;" placeholder="최대 140자까지 입력이 가능합니다."></textarea>
			<img src="img/btn_submit.png" onclick="replyCreate()"/>
			<p style="color: #999; margin-top: -10px;"><em id='content_bytes' style="color:black;">0</em>/140</p>
			</c:if>
		</div>
	</form>
</div>
<script>
function displayLeng(sz, id) {
	var form = document.frm;
	if (form[id].value.length > sz) {
		if (event.keyCode != '8') {//백스페이스는 지우기작업시 바이트 체크하지 않기 위해서
			alert(sz + '자까지 입력이 가능합니다.');
		}
			form[id].value = form[id].value.substring(0, sz);
		}
	document.getElementById(id + '_bytes').innerHTML = form[id].value.length;
}
</script>
<!-- page end-->
<%@ include file="../sol_footer.jsp"%>