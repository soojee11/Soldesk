function testFormCheck(frm) {
	var testtitle = frm.testtitle.value;
	testtitle = testtitle.replace(/^\s*|\s*$/g, '');

	if (testtitle.length < 2) {
		alert("문제지 제목 2글자 이상 입력해주세요. ");
		frm.testtitle.focus();
		return;
	}
	frm.submit();
}

function questionFormCheck(frm) {
	var qtype = frm.qtype.value;

	if (qtype == '') {
		var qtitle = frm.qtitle.value;
		alert("문제 유형을 입력해주세요.");
	}

	if (qtype == 'G') {
		var qtitle = frm.qtitle.value;
		var comment = frm.comment.value;
		/*var posterMF = frm.posterMF.value;*/
		var example1 = frm.example1.value;
		var example2 = frm.example2.value;
		var example3 = frm.example3.value;
		var example4 = frm.example4.value;
		var example5 = frm.example5.value;

		qtitle = qtitle.replace(/^\s*|\s*$/g, '');
		comment = comment.replace(/^\s*|\s*$/g, '');
		/*posterMF = posterMF.replace(/^\s*|\s*$/g, '');*/
		example1 = example1.replace(/^\s*|\s*$/g, '');
		example2 = example2.replace(/^\s*|\s*$/g, '');
		example3 = example3.replace(/^\s*|\s*$/g, '');
		example4 = example4.replace(/^\s*|\s*$/g, '');
		example5 = example5.replace(/^\s*|\s*$/g, '');

		if (qtitle.length == 0) {
			alert("문제 제목을 입력해주세요.");
			frm.qtitle.focus();
			return;
		}
		if (example1.length == 0) {
			alert("1번 보기를 입력해주세요.");
			frm.example1.focus();
			return;
		}
		if (example2.length == 0) {
			alert("2번 보기를 입력해주세요.");
			frm.example2.focus();
			return;
		}
		if (example3.length == 0) {
			alert("3번 보기를 입력해주세요.");
			frm.example3.focus();
			return;
		}
		if (example4.length == 0) {
			alert("4번 보기를 입력해주세요.");
			frm.example4.focus();
			return;
		}
		if (example5.length == 0) {
			alert("5번 보기를 입력해주세요.");
			frm.example5.focus();
			return;
		}
		if (comment.length == 0) {
			alert("해설을 입력해주세요.");
			frm.comment.focus();
			return;
		}
/*
		// 파일명을 소문자로 변환
		var ext = posterMF.toLowerCase();
		if (ext.lastIndexOf(".jsp") > 0) {
			alert('JSP파일 전송불가');
			return false;
		}
		if (ext.lastIndexOf(".html") > 0) {
			alert('HTML파일 전송불가');
			return false;
		}
		if (ext.lastIndexOf(".exe") > 0) {
			alert('exe파일 전송불가');
			return false;
		}
*/
		frm.submit();
	}
	if (qtype == 'J') {
		var qtitle = frm.qtitle.value;
		var answer = frm.answer.value;
		var comment = frm.comment.value;
		/*var posterMF = frm.posterMF.value;*/

		qtitle = qtitle.replace(/^\s*|\s*$/g, '');
		answer = answer.replace(/^\s*|\s*$/g, '');
		comment = comment.replace(/^\s*|\s*$/g, '');
		/*posterMF = posterMF.replace(/^\s*|\s*$/g, '');*/

		if (qtitle.length == 0) {
			alert("문제 제목을 입력해주세요.");
			frm.qtitle.focus();
			return;
		}
		if (answer.length == 0) {
			alert("답을 입력해주세요.");
			frm.answer.focus();
			return;
		}
		if (comment.length == 0) {
			alert("해설을 입력해주세요.");
			frm.comment.focus();
			return;
		}
/*
		// 파일명을 소문자로 변환
		var ext = posterMF.toLowerCase();
		if (ext.lastIndexOf(".jsp") > 0) {
			alert('JSP파일 전송불가');
			return false;
		}
		if (ext.lastIndexOf(".html") > 0) {
			alert('HTML파일 전송불가');
			return false;
		}
		if (ext.lastIndexOf(".exe") > 0) {
			alert('exe파일 전송불가');
			return false;
		}
*/
		frm.submit();
	}
	if (qtype == 'OX') {
		var qtitle = frm.qtitle.value;
		var comment = frm.comment.value;
		/*var posterMF = frm.posterMF.value;*/

		qtitle = qtitle.replace(/^\s*|\s*$/g, '');
		comment = comment.replace(/^\s*|\s*$/g, '');
		/*posterMF = posterMF.replace(/^\s*|\s*$/g, '');*/

		if (qtitle.length == 0) {
			alert("문제 제목을 입력해주세요.");
			frm.qtitle.focus();
			return;
		}
		if (comment.length == 0) {
			alert("해설을 입력해주세요.");
			frm.comment.focus();
			return;
		}
/*
		// 파일명을 소문자로 변환
		var ext = posterMF.toLowerCase();
		if (ext.lastIndexOf(".jsp") > 0) {
			alert('JSP파일 전송불가');
			return false;
		}
		if (ext.lastIndexOf(".html") > 0) {
			alert('HTML파일 전송불가');
			return false;
		}
		if (ext.lastIndexOf(".exe") > 0) {
			alert('exe파일 전송불가');
			return false;
		}
*/
		frm.submit();
	}
}

function checkboxEnable() {
	var ck = document.getElementById('allck');
	if (ck.checked) {
		var check = document.getElementsByName('check');
		for (var i = 0; i < check.length; i++) {
			check[i].checked = true;
		}
	} else {
		var check = document.getElementsByName('check');
		for (var i = 0; i < check.length; i++) {
			check[i].checked = false;
		}
	}
}
function checkboxEnable2() {
	var ck = document.getElementById('allck2');
	if (ck.checked) {
		var check = document.getElementsByName('check2');
		for (var i = 0; i < check.length; i++) {
			check[i].checked = true;
		}
	} else {
		var check = document.getElementsByName('check2');
		for (var i = 0; i < check.length; i++) {
			check[i].checked = false;
		}
	}
}
function checkboxEnable3() {
	var ck = document.getElementById('allck3');
	if (ck.checked) {
		var check = document.getElementsByName('check3');
		for (var i = 0; i < check.length; i++) {
			check[i].checked = true;
		}
	} else {
		var check = document.getElementsByName('check3');
		for (var i = 0; i < check.length; i++) {
			check[i].checked = false;
		}
	}
}

function testDeleteCheck(frm) {
	var flag=false;
	var check = document.getElementsByName('check3');
	for (var i = 0; i < check.length; i++) {
		if (check[i].checked) flag=true;
	}
	
	if(flag==false) {
		alert('삭제할 문제지를 체크해주세요');
		return false;
	}
	if(flag==true) {
		msg = "문제지를 삭제하시겠습니까?\n삭제를 하시면 문제지에 포함된 문제가 모두 삭제됩니다.\n삭제한 문제는 되돌릴 수 없습니다.\n원치 않으시면 취소를 눌러주세요";
	    if (confirm(msg)!=0) {
	         frm.submit();
	    } else {
	        return;
		} 
	}
    
}

function checkboxEnable4() {
	var ck = document.getElementById('allck4');
	if (ck.checked) {
		var check = document.getElementsByName('check4');
		for (var i = 0; i < check.length; i++) {
			check[i].checked = true;
		}
	} else {
		var check = document.getElementsByName('check4');
		for (var i = 0; i < check.length; i++) {
			check[i].checked = false;
		}
	}
}

function questionDeleteCheck(frm) {
	
	var flag=false;
	var check = document.getElementsByName('check4');
	for (var i = 0; i < check.length; i++) {
		if (check[i].checked) flag=true;
	}
	
	if(flag==false) {
		alert('삭제할 문제지를 체크해주세요');
		return false;
	}
	if(flag==true) {
		msg = "문제를 삭제하시겠습니까?\n삭제한 문제는 되돌릴 수 없습니다.\n원치 않으시면 취소를 눌러주세요";
	    if (confirm(msg)!=0) {
	         frm.submit();
	    } else {
	        return;
		} 
	}
    
}
function questionCheck(frm) {
	var flag=false;
	var check = document.getElementsByName('check');
	for (var i = 0; i < check.length; i++) {
		if (check[i].checked) flag=true;
	}
	
	if(flag==false) {
		alert('문제를 체크해주세요');
		return false;
	}
	if(flag==true) {
		frm.submit();
	}
}
function questionCheck2(frm) {
	var flag=false;
	var check = document.getElementsByName('check2');
	for (var i = 0; i < check.length; i++) {
		if (check[i].checked) flag=true;
	}
	
	if(flag==false) {
		alert('문제를 체크해주세요');
		return false;
	}
	if(flag==true) {
		frm.submit();
	}
}

