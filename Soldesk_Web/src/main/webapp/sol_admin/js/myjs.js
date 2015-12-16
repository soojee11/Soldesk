function checkForm(frm){
	var qtitle = frm.qtitle.value;
	var answer = frm.answer.value;
	var comment = frm.comment.value;

	qtitle = qtitle.replace(/^\s*|\s*$/g, '');
	answer = answer.replace(/^\s*|\s*$/g, '');
	comment = comment.replace(/^\s*|\s*$/g, '');
	
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
	
	frm.submit();
	
	
}

function player_validate(frm){
	  var subject = frm.subject.value;
	  var teacher = frm.teacher.value;
	  var posterMF = frm.posterMF.value;
	  var filenameMF = frm.filenameMF.value;
	  var lecturetime = frm.lecturetime.value;
	  
	  subject = subject.replace(/^\s*|\s*$/g, '');
	  teacher = teacher.replace(/^\s*|\s*$/g, '');
	  lecturetime = lecturetime.replace(/^\s*|\s*$/g, '');
	  posterMF = posterMF.replace(/^\s*|\s*$/g, '');
	  filenameMF = filenameMF.replace(/^\s*|\s*$/g, '');
	  
	  if(subject.length == 0){
	    alert("제목을 입력해 주세요.");
	    frm.subject.focus();
	    return;
	  }
	  
	  if(teacher.length == 0){
	    alert("선생님 이름을 입력해 주세요.");
	    frm.teacher.focus();
	    return;
	  }

	  if(posterMF.length == 0){
	    alert("포스터를 등록하세요");
	    frm.posterMF.focus();
	    return;
	  }

	  if(filenameMF.length == 0){
	    alert("파일을 등록하세요");
	    frm.filenameMF.focus();
	    return;
	  }
	  
	  if(lecturetime.length == 0){
	    alert("동영상 시간을 등록하세요");
	    frm.lecturetime.focus();
	    return;
	  }
	  
	  alert("동영상을 등록 하시겠습니까? ");
	  
	  frm.submit();
}

function player_validate2(frm){
	  var subject = frm.subject.value;
	  var teacher = frm.teacher.value;
	  var posterMF = frm.posterMF.value;
	  var filenameMF = frm.filenameMF.value;
	  var lecturetime = frm.lecturetime.value;
	  
	  subject = subject.replace(/^\s*|\s*$/g, '');
	  teacher = teacher.replace(/^\s*|\s*$/g, '');
	  lecturetime = lecturetime.replace(/^\s*|\s*$/g, '');
	  posterMF = posterMF.replace(/^\s*|\s*$/g, '');
	  filenameMF = filenameMF.replace(/^\s*|\s*$/g, '');
	  
	  if(subject.length == 0){
	    alert("제목을 입력해 주세요.");
	    frm.subject.focus();
	    return;
	  }
	  
	  if(teacher.length == 0){
	    alert("선생님 이름을 입력해 주세요.");
	    frm.teacher.focus();
	    return;
	  }

	  if(posterMF.length == 0){
	    alert("포스터를 등록하세요");
	    frm.posterMF.focus();
	    return;
	  }

	  if(filenameMF.length == 0){
	    alert("파일을 등록하세요");
	    frm.filenameMF.focus();
	    return;
	  }
	  
	  if(lecturetime.length == 0){
	    alert("동영상 시간을 등록하세요");
	    frm.lecturetime.focus();
	    return;
	  }

	  alert("수정하시겠습니까? ");
	  
	  frm.submit();
}

function playCheck2(frm) {
	var flag=false;
	var check = document.getElementsByName('check2');
	
	for (var i = 0; i < check.length; i++) {
		if (check[i].checked) flag=true;
	}
	
	if(flag==false) {
		alert('삭제할 동영상을 선택해주세요. ');
		return false;
	}
	if(flag==true) {
		frm.submit();
	}
}

function checkLevelForm(frm){
	  
	var mess="회원 등급 변경 하시겠습니까?"
		
	if(confirm(mess)){ frm.submit(); }
}
function memCheck2(frm) {
	var flag=false;
	var check = document.getElementsByName('check2');
	
	for (var i = 0; i < check.length; i++) {
		if (check[i].checked) flag=true;
	}
	
	if(flag==false) {
		alert('삭제할 회원을 선택해주세요. ');
		return false;
	}
	if(flag==true) {
		frm.submit();
	}
}

function cateInsert_validate(frm){
	  var categoryInfo = frm.categoryInfo.value;
	  
	  categoryInfo = categoryInfo.replace(/^\s*|\s*$/g, '');
	  
	  if(categoryInfo.length == 0){
	    alert("강좌설명을 입력해 주세요.");
	    frm.subject.focus();
	    return;
	  }
	  
	  alert("강좌정보를 수정 하시겠습니까? ---");
	  
	  frm.submit();
}