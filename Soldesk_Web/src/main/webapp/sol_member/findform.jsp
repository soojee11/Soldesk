<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../sol_header.jsp"%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8" />
<link href='http://fonts.googleapis.com/css?family=Raleway'
	rel='stylesheet' type='text/css'>

<style>
.seaTabs * {
	box-sizing: border-box;
}

.seaTabs_switch {
	overflow: hidden;
}

.seaTabs_tab {
	float: left;
	cursor: pointer;
	width: 50%
}

.seaTabs_switch_active {
	cursor: default;
}

.seaTabs_item {
	display: none;
}

.seaTabs_content_active {
	display: block;
}

.seaTabs_switch {
	
}

.seaTabs_tab {
	padding: 10px 20px;
	border-width: 1px 1px 1px 0;
	border-style: solid;
	border-color: #ccc;
	background: #fff;
}

.seaTabs_tab:first-child {
	border-left: 1px solid #ccc;
	border-top-left-radius: 5px;
}

.seaTabs_tab:last-child {
	border-top-right-radius: 5px;
}

.seaTabs_content {
	margin-top: -1px;
}

.seaTabs_item {
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 0 0 5px 5px;
}

.seaTabs_switch_active {
	border-bottom: 1px solid #ffefe6;
	background: #ffefe6;
}
</style>

<script type="text/javascript">
	function forgetidcheck(frm) {
		var frm = document.findidfrm;
		name = frm.name.value;
		name = name.replace(/^\s*|\s*$/g, '');
		if (name.length < 3) {
			alert("가입된 이름을 입력하세요.");
			frm.name.focus();
			return;
		}
		email = frm.email.value;
		email = email.replace(/^\s*|\s*$/g, '');
		var regemail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		if (regemail.test(email) === false) {
			alert("올바른 이메일 형식으로\n가입된 이메일을 입력하세요.");
			frm.email.focus();
			return;
		}
		var mess = "아이디찾기를 하시겠습니까?";
		if (confirm(mess)) {
			frm.submit(); //type=submit과 동일 기능
		}
	}//end

	function forgetpwcheck(frm) {
		var frm = document.findpwfrm;
		id = frm.id.value;
		id = id.replace(/^\s*|\s*$/g, '');
		if (id.length < 3) {
			alert("가입된 아이디를 입력하세요.");
			frm.id.focus();
			return;
		}
		email = frm.email.value;
		email = email.replace(/^\s*|\s*$/g, '');
		var regemail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		if (regemail.test(email) === false) {
			alert("올바른 이메일 형식으로\n가입된 이메일을 입력하세요.");
			frm.email.focus();
			return;
		}
		var mess = "비밀번호찾기를 하시겠습니까?";
		if (confirm(mess)) {
			frm.submit(); //type=submit과 동일 기능
		}
	}//end
</script>
<script type="text/javascript">
	function forgetidcheck(frm) {
		var frm = document.findidfrm;
		name = frm.name.value;
		name = name.replace(/^\s*|\s*$/g, '');
		if (name.length < 3) {
			alert("가입된 이름을 입력하세요.");
			frm.name.focus();
			return;
		}
		email = frm.email.value;
		email = email.replace(/^\s*|\s*$/g, '');
		var regemail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		if (regemail.test(email) === false) {
			alert("올바른 이메일 형식으로\n가입된 이메일을 입력하세요.");
			frm.email.focus();
			return;
		}
		var mess = "아이디찾기를 하시겠습니까?";
		if (confirm(mess)) {
			frm.submit(); //type=submit과 동일 기능
		}
	}//end

	function forgetpwcheck(frm) {
		var frm = document.findpwfrm;
		id = frm.id.value;
		id = id.replace(/^\s*|\s*$/g, '');
		if (id.length < 3) {
			alert("가입된 아이디를 입력하세요.");
			frm.id.focus();
			return;
		}
		email = frm.email.value;
		email = email.replace(/^\s*|\s*$/g, '');
		var regemail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		if (regemail.test(email) === false) {
			alert("올바른 이메일 형식으로\n가입된 이메일을 입력하세요.");
			frm.email.focus();
			return;
		}
		var mess = "비밀번호찾기를 하시겠습니까?";
		if (confirm(mess)) {
			frm.submit(); //type=submit과 동일 기능
		}
	}//end
</script>

<br />
<Br /><Br />
<div class="seaTabs" >
	<div class="seaTabs_switch">
		<div class="seaTabs_tab seaTabs_switch_active"><font color="#000">아이디찾기</font></div>
		<div class="seaTabs_tab"><font color="#000">비밀번호찾기</font></div>
	</div>
	<div class="seaTabs_content">
		<div class="seaTabs_item seaTabs_content_active" style="background-color: #ffefe6">

			<form name="findidfrm" method="post" action="findidform.do">
				<input type="hidden" name="from" value="soldesk" />

				<table border="0" align="center">
					<tr>
						<td width="100px" height="20px" align="right">이름</td>
						<td align="left" valign="middle">&nbsp; <input type="text"
							name="name" style="width: 180px; background-color: #ffffff;" />
						</td>
					</tr>
					<tr>
						<td width="90px" height="20px" align="right">이메일</td>
						<td align="left" valign="middle">&nbsp; <input type="text"
							name="email" style="width: 180px; background-color: #ffffff;" />
						</td>
					</tr>
				</table>
				<br />
				<div align="center">
					<input class="btn btn-warning button" type="button" value="아이디찾기"
						onclick="forgetidcheck(this.form)">
				</div>
			</form>
		</div>

		<div class="seaTabs_item" style="background-color: #ffefe6">
			<form name="findpwfrm" method="post" action="findpwform.do">
				<input type="hidden" name="from" value="soldesk" />
				<table border="0" align="center">
					<tr>
						<td width="100px" height="20px" align="right">아이디</td>
						<td align="left" valign="middle">&nbsp; <input type="text"
							name="id" style="width: 180px; background-color: #ffffff;" />
						</td>
					</tr>
					<tr>
						<td width="90px" height="20px" align="right">이메일</td>
						<td align="left" valign="middle">&nbsp; <input type="text"
							name="email" style="width: 180px; background-color: #ffffff;" />
						</td>
					</tr>
				</table>
				<br />
				<div align="center">
					<input class="btn btn-warning button" type="button" value="비밀번호찾기"
						onclick="forgetpwcheck(this.form)">
				</div>
			</form>

		</div>
	</div>
</div>


<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
	$(function() {
		$('.seaTabs_tab').each(
				function(item) {
					$(this).click(
							function() {
								$(this).addClass('seaTabs_switch_active')
										.siblings().removeClass(
												'seaTabs_switch_active');
								$($('.seaTabs_item')[item]).addClass(
										'seaTabs_content_active').siblings()
										.removeClass('seaTabs_content_active');
							});
				});
	});
</script>
<Br />
<Br />

<%@ include file="../sol_footer.jsp"%>