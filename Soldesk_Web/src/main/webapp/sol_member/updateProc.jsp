<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../sol_header.jsp"%>
<!-- 정렬금지!!!!!! -->

<!--  한글 웹 폰트 적용-->
    <style type="text/css">
    th, .must{
      font-family:'Jeju Gothic', sans-serif;
      font-size:10pt;
    }
    .h3{
      font-family:'Jeju Gothic', sans-serif;
      font-size:16pt;
    }
    .button, input{
        font-family:'Jeju Gothic', sans-serif;
        font-size:11pt;
    }
    </style>
<!-- 한글 웹 폰트 적용 끝 -->

<script>
	function idCheck() {//아이디중복확인
		var sx = parseInt(screen.width);//팝업창 나타내는 위치
		var sy = parseInt(screen.height);
		var x = (sx / 2) - 100;
		var y = (sy / 2) - 300;

		var win = window.open("checkid.do", "idwin", "width=300, height=300");
		win.moveTo(x, y);//화면이동

	}//end

	function emailCheck() {//이메일중복확인
		var sx = parseInt(screen.width);//팝업창 나타내는 위치
		var sy = parseInt(screen.height);
		var x = (sx / 2) - 100;
		var y = (sy / 2) - 300;

		var win = window.open("checkemail.do", "emailwin",
				"width=350, height=300");
		win.moveTo(x, y);//화면이동

	}//end

	function zipCheck() {//우편번호중복확인
		var sx = parseInt(screen.width);//팝업창 나타내는 위치
		var sy = parseInt(screen.height);
		var x = (sx / 2) - 100;
		var y = (sy / 2) - 300;

		var win = window.open("checkzip.do", "zipwin",
				"width=500, height=600, scrollbars=yes");
		win.moveTo(x, y);//화면이동
	}//end

	function inputCheck(frm){//회원가입유효성검사
		id=frm.id.value;
		id=id.replace(/^\s*|\s*$/g,'');
		if(id.length<5 || id.length>=11){
			alert("공백없이, 아이디는 5~10글자 이내로 입력하세요.");
			frm.id.value="";
			frm.id.focus();
			return;
		}
		passwd=frm.passwd.value;
		passwd=passwd.replace(/^\s*|\s*$/g,'');
		if(passwd.length<4 || passwd.length>=11){
			alert("비밀번호는 4~10글자 이내로 입력하세요.");
			frm.passwd.value="";
			frm.passwd.focus();
			return;
		}
		repasswd=frm.repasswd.value;
		repasswd=repasswd.replace(/^\s*|\s*$/g,'');
		if(passwd != repasswd){
			alert("동일한 비밀번호를 입력하세요.");
			frm.repasswd.value="";
			frm.repasswd.focus();
			return;
		}
		name=frm.name.value;
		name=name.replace(/^\s*|\s*$/g,'');
		if(name.length<2 || name.length>=11){
			alert("이름은 2글자 이상 입력하세요.");
			frm.name.value="";
			frm.name.focus();
			return;
		}
	
		email=frm.email.value;
		email=email.replace(/^\s*|\s*$/g,'');
		var regemail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		if(regemail.test(email) === false){
		    alert("공백없이, 올바른 이메일 형식으로 입력하세요.");
		    frm.email.focus();
		    return;
		}
		frm.submit();
	}//end
		

</script>
<br/><Br/>
<div class="title" style="text-align: center">
<div class="h3">회원 정보 수정</div>
<form name="joinForm" 
      method="post"
      action="updatego.do"><!--name=> register form -->
<br/><div style="text-align:center;" class="must">(*필수 입력)</div>

<table align="center" border="0" >
<tr align="left"> 
  <th width="100px">아이디</th>
  <td> 
     <input type="text" value="${id }" name="id" size="15" readonly="readonly" style="background-color:#f7f4f5;">
  </td>
</tr>
<tr align="left"> 
  <th  >비밀번호</th>
  <td> <input type="password" name="passwd" size="15" style="background-color:#f7f4f5;">
</tr>
<tr  align="left" > 
  <th>비밀번호 확인</th>
  <td> <input type="password" name="repasswd" size="15" style="background-color:#f7f4f5;" >
</tr>
<tr  align="left" > 
  <th >이름</th>
  <td> <input type="text" value="${name }" readonly="readonly" name="name" size="15" style="background-color:#f7f4f5;">
</tr>	
<tr align="left" > 
  <th>이메일</th>
  <td>
      <input type="text" name="email" value="${email }" size="27" readonly="readonly" style="background-color:#f7f4f5;">
  </td>
</tr>         
<tr align="left" >  
  <th>전화번호</th>
  <td>
      <input type="text" name="tel" value="${tel }" style="background-color:#f7f4f5;">
  </td>
</tr>
<tr align="left" >  
  <th >우편번호</th>
  <td>
      <input type="text" value="${zipcode }" name="zipcode" size="7" readonly="readonly" style="background-color:#f7f4f5;">
      &nbsp;&nbsp;&nbsp;&nbsp;<input  class="btn btn-primary"    type="button" value="우편번호찾기" 
             onclick="zipCheck()">
  </td>
</tr>
<tr align="left" >  
  <th >주소</th>
  <td><input type="text" value="${address1 }" name="address1" size="30" readonly="readonly" style="background-color:#f7f4f5;"></td>
</tr>
<tr align="left" >  
  <th >상세주소</th>
  <td><input type="text" value="${address2 }"  name="address2" size="30" style="background-color:#f7f4f5;"></td>
</tr>
<tr align="left" >  
  <th >한줄다짐</th>
  <td><input type="text" name="promise"  value="${promise }"  size="30" style="background-color:#f7f4f5;"></td>
</tr>
</table>
<br/>
<div style="text-align: center">
  <input    type="button" value="수정하기"
         onclick="inputCheck(this.form)" class="btn btn-primary" > 
  <input    type="reset" class="btn btn-primary"  value="취소">
  
   <input type="button" class="btn btn-primary"  value="탈퇴하기" onclick="move2(this.form, 'delete.do') " /> 
        <script>
						function move2(frm, file) {
							frm.action = file;
							frm.submit();
						}
				</script>
</div>	
</form>	
 <form method='get'>
      <input type="button" class="btn btn-primary"  value="홈으로" onclick="move(this.form, '../sol_index.do')" /> 
        <script>
						function move(frm, file) {
							frm.action = file;
							frm.submit();
						}
				</script>
    </form> 
   

</div>
<%@ include file="../sol_footer.jsp" %>
