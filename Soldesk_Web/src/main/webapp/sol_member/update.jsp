<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../sol_header.jsp"%>
<!-- page start-->
<script>
function pwcheck(frm){//UPDATE
	
	var passwd = frm.passwd.value;
	passwd = passwd.replace(/^\s*|\s*$/g,'');
	if(passwd.length < 4){
		alert('비밀번호를 입력해주세요.');
		frm.passwd.focus();
		return;
	}

	var mess="수정 하시겠습니까?";
	if(confirm(mess)){
		frm.submit();
	}
}//end
</script>

<form name="updatefrm" method="post" action="updateproc.do">
<input type="hidden" name="id" value="${id }"/>
<br/><br/>
<div align="center">
       비밀번호
        <input type='password' name='passwd'>
        <input type= "button"  class="btn btn-primary" value="확인" onclick="pwcheck(this.form)">
</div>
</form>


<!-- page end-->
<%@ include file="../sol_footer.jsp"%>