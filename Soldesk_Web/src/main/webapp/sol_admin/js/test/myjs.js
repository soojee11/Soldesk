function testFormCheck(frm) {
	var testtitle = frm.testtitle.value;
	testtitle = testtitle.replace(/^\s*|\s*$/g, '');
	
	if (testtitle.length < 2) {
		alert("문제지 제목을 2글자 이상 입력해주세요. ");
		frm.testtitle.focus();
		return;
	}
	frm.submit();
}

function questionFormCheck(frm){
	var qtype = frm.qtype.value;
	
	if(qtype=='') {
		var qtitle = frm.qtitle.value;
		alert("문제 유형을 입력해주세요.");
	}
		
	if(qtype=='G') {
		var qtitle = frm.qtitle.value;
		var comment = frm.comment.value;
		var posterMF = frm.posterMF.value;
		var example1 = frm.example1.value;
		var example2 = frm.example2.value;
		var example3 = frm.example3.value;
		var example4 = frm.example4.value;
		var example5 = frm.example5.value;
		
		qtitle = qtitle.replace(/^\s*|\s*$/g, '');
		comment = comment.replace(/^\s*|\s*$/g, '');
		posterMF = posterMF.replace(/^\s*|\s*$/g, '');
		example1 = example1.replace(/^\s*|\s*$/g, '');
		example2 = example2.replace(/^\s*|\s*$/g, '');
		example3 = example3.replace(/^\s*|\s*$/g, '');
		example4 = example4.replace(/^\s*|\s*$/g, '');
		example5 = example5.replace(/^\s*|\s*$/g, '');
		
		if(qtitle.length==0){
			alert("문제 제목을 입력해주세요.");
			frm.qtitle.focus();
			return;
		}
		if(example1.length==0){
			alert("1번 보기를 입력해주세요.");
			frm.example1.focus();
			return;
		}
		if(example2.length==0){
			alert("2번 보기를 입력해주세요.");
			frm.example2.focus();
			return;
		}
		if(example3.length==0){
			alert("3번 보기를 입력해주세요.");
			frm.example2.focus();
			return;
		}
		if(example4.length==0){
			alert("4번 보기를 입력해주세요.");
			frm.example4.focus();
			return;
		}
		if(example5.length==0){
			alert("5번 보기를 입력해주세요.");
			frm.example5.focus();
			return;
		}
		if(comment.length==0){
			alert("해설을 입력해주세요.");
			frm.comment.focus();
			return;
		}
		
		// 파일명을 소문자로 변환
	    var ext = posterMF.toLowerCase();
	    if (ext.lastIndexOf(".jsp") > 0){
	        alert('JSP파일 전송불가');
	        return false;
	    }
	    if (ext.lastIndexOf(".html") > 0){
	        alert('HTML파일 전송불가');
	        return false;
	    }
	    if (ext.lastIndexOf(".exe") > 0){
	        alert('exe파일 전송불가');
	        return false;
	    }
		frm.submit();
	}
	if(qtype=='J') {
		var qtitle = frm.qtitle.value;
		var answer = frm.answer.value;
		var comment = frm.comment.value;
		var posterMF=frm.posterMF.value;
		

		qtitle = qtitle.replace(/^\s*|\s*$/g, '');
		answer = answer.replace(/^\s*|\s*$/g, '');
		comment = comment.replace(/^\s*|\s*$/g, '');
		posterMF = posterMF.replace(/^\s*|\s*$/g, '');
		
		if(qtitle.length==0){
			alert("문제 제목을 입력해주세요.");
			frm.qtitle.focus();
			return;
		}
		if(answer.length==0){
			alert("답을 입력해주세요.");
			frm.answer.focus();
			return;
		}
		if(comment.length==0){
			alert("해설을 입력해주세요.");
			frm.comment.focus();
			return;
		}
		
		// 파일명을 소문자로 변환
	    var ext = posterMF.toLowerCase();
	    if (ext.lastIndexOf(".jsp") > 0){
	        alert('JSP파일 전송불가');
	        return false;
	    }
	    if (ext.lastIndexOf(".html") > 0){
	        alert('HTML파일 전송불가');
	        return false;
	    }
	    if (ext.lastIndexOf(".exe") > 0){
	        alert('exe파일 전송불가');
	        return false;
	    }
		frm.submit();
	}
	if(qtype=='OX') {
		var qtitle = frm.qtitle.value;
		var comment = frm.comment.value;
		var posterMF=frm.posterMF.value;
		
		qtitle = qtitle.replace(/^\s*|\s*$/g, '');
		comment = comment.replace(/^\s*|\s*$/g, '');
		posterMF = posterMF.replace(/^\s*|\s*$/g, '');
		
		if(qtitle.length==0){
			alert("문제 제목을 입력해주세요.");
			frm.qtitle.focus();
			return;
		}
		if(comment.length==0){
			alert("해설을 입력해주세요.");
			frm.comment.focus();
			return;
		}
		
		// 파일명을 소문자로 변환
	    var ext = posterMF.toLowerCase();
	    if (ext.lastIndexOf(".jsp") > 0){
	        alert('JSP파일 전송불가');
	        return false;
	    }
	    if (ext.lastIndexOf(".html") > 0){
	        alert('HTML파일 전송불가');
	        return false;
	    }
	    if (ext.lastIndexOf(".exe") > 0){
	        alert('exe파일 전송불가');
	        return false;
	    }
		frm.submit();
	}
}