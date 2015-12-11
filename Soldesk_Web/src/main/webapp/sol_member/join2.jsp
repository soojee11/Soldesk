<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../sol_header.jsp"%>
<script>
	function idCheck() {//아이디중복확인
		var sx = parseInt(screen.width);//팝업창 나타내는 위치
		var sy = parseInt(screen.height);
		var x = (sx / 2) - 100;
		var y = (sy / 2) - 300;
		//var win = window.open("sol_member/idcheckForm.jsp","idwin","width=300, height=300");
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

	function inputCheck(frm) {//회원가입유효성검사
		id = frm.id.value;
		id = id.replace(/^\s*|\s*$/g, '');
		if (id.length<5 || id.length> = 11) {
			alert("아이디는 5~10글자 이내로 입력하세요.");
			frm.id.value = "";
			frm.id.focus();
			return;
		}
		passwd = frm.passwd.value;
		passwd = passwd.replace(/^\s*|\s*$/g, '');
		if (passwd.length<4 || passwd.length> = 11) {
			alert("비밀번호는 4~10글자 이내로 입력하세요.");
			frm.passwd.value = "";
			frm.passwd.focus();
			return;
		}
		repasswd = frm.repasswd.value;
		repasswd = repasswd.replace(/^\s*|\s*$/g, '');
		if (passwd != repasswd) {
			alert("비밀번호가 동일하지 않습니다.\n다시 확인해주세요!");
			frm.repasswd.value = "";
			frm.repasswd.focus();
			return;
		}
		name = frm.name.value;
		name = name.replace(/^\s*|\s*$/g, '');
		if (name.length<2 || name.length> = 11) {
			alert("이름은 2글자 이상 입력하세요.");
			frm.name.value = "";
			frm.name.focus();
			return;
		}
		email = frm.email.value;
		email = email.replace(/^\s*|\s*$/g, '');
		var regemail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		if (regemail.test(email) === false) {
			alert("이메일 형식이 올바르지 않습니다.\n다시 확인해주세요!");
			frm.email.focus();
			return;
		}
		frm.submit();
	}//end
</script>

<br />
<Br />


<div class="joinForm" style="text-align: center">

	<form name="joinForm" method="post" action="join.do">
		<div style="text-align: center;">(*필수 입력)</div>

		<table align="center" width=50% border="1" cellpadding="0"
			cellspacing="0" style="font-size: 14px">
			<tr align="left">
				<th>ID*</th>
				<td><input type="text" name="id" size="15" readonly="readonly"
					style="background-color: #f7f4f5;"> <input type="button"
					value="ID중복확인" onclick="idCheck()"></td>
			</tr>
			<tr align="left">
				<th>PW*</th>
				<td><input type="password" name="passwd" size="15"
					style="background-color: #f7f4f5;">
			</tr>
			<tr align="left">
				<th>PW확인*</th>
				<td><input type="password" name="repasswd" size="15"
					style="background-color: #f7f4f5;">
			</tr>
			<tr align="left">
				<th>NAME*</th>
				<td><input type="text" name="name" size="15"
					style="background-color: #f7f4f5;">
			</tr>
			<tr align="left">
				<th>EMAIL*</th>
				<td><input type="text" name="email" size="27"
					readonly="readonly" style="background-color: #f7f4f5;"> <input
					type="button" value="Email중복확인" onclick="emailCheck()"></td>
			</tr>
			<tr align="left">
				<th>PHONE</th>
				<td><input type="text" name="tel"
					style="background-color: #f7f4f5;"></td>
			</tr>
			<tr align="left">
				<th>ZIPCODE</th>
				<td><input type="text" name="zipcode" size="7"
					readonly="readonly" style="background-color: #f7f4f5;"> <input
					type="button" value="우편번호찾기" onclick="zipCheck()"></td>
			</tr>
			<tr align="left">
				<th>ADDRESS</th>
				<td><input type="text" name="address1" size="30"
					readonly="readonly" style="background-color: #f7f4f5;"></td>
			</tr>
			<tr align="left">
				<th>ADDRESS</th>
				<td><input type="text" name="address2" size="30"
					style="background-color: #f7f4f5;"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="가입하기"
					onclick="inputCheck(this.form)"> <input type="reset"
					value="취소"></td>
			</tr>
		</table>
	</form>

	<form method='get'>
		<input type="button" value="홈으로"
			onclick="move(this.form, '/solproject/index.do') " />
		<script>
			function move(frm, file) {
				frm.action = file;
				frm.submit();
			}
		</script>
	</form>
</div>

<%@ include file="../sol_footer.jsp"%>