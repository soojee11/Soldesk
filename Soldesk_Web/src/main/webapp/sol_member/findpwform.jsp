<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../sol_header.jsp" %>

<script type="text/javascript">

function forgetidcheck(frm){
	var frm = document.findidfrm;
	name= frm.name.value;
	name=name.replace(/^\s*|\s*$/g,'');
	if(name.length<3){
		alert("가입된 이름을 입력하세요.");
	    frm.name.focus();
	    return;
	}
	email=frm.email.value;
	email=email.replace(/^\s*|\s*$/g,'');
	var regemail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	if(regemail.test(email) === false){
	    alert("올바른 이메일 형식으로\n가입된 이메일을 입력하세요.");
	    frm.email.focus();
	    return;
	}
	var mess="아이디찾기를 하시겠습니까?";
	if(confirm(mess)){
		frm.submit(); //type=submit과 동일 기능
	}
}//end


function forgetpwcheck(frm){
	var frm = document.findpwfrm;
	id= frm.id.value;
	id=id.replace(/^\s*|\s*$/g,'');
	if(id.length<3){
		alert("가입된 아이디를 입력하세요.");
	    frm.id.focus();
	    return;
	}
	email=frm.email.value;
	email=email.replace(/^\s*|\s*$/g,'');
	var regemail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	if(regemail.test(email) === false){
	    alert("올바른 이메일 형식으로\n가입된 이메일을 입력하세요.");
	    frm.email.focus();
	    return;
	}
	var mess="비밀번호찾기를 하시겠습니까?";
	if(confirm(mess)){
		frm.submit(); //type=submit과 동일 기능
	}
}//end
</script>


<br/><Br/>


<div style="text-align: center">
비밀번호는 ${pes }입니다.
<br/><Br/>
<form method='get'>
   
      <input class="btn btn-primary" type="button" value="홈으로" onclick="move(this.form, 'login.do') " /> 
        <script>
           function move(frm, file){
            frm.action = file; 
            frm.submit();
           }    
        </script>
        </form>
</div>	


<!-- 본문 끝 -->

<%@ include file="../sol_footer.jsp" %>				