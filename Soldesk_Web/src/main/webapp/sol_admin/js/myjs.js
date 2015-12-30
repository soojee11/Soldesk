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

function checkLevelForm(id,mlevel){
	id = id.replace(/^\s*|\s*$/g, '');
	mlevel = mlevel.replace(/^\s*|\s*$/g, '');
	
	var mess="회원 등급 변경 하시겠습니까?"
		
	if(confirm(mess)){ 
		location.href="memmlevel.do?id="+id+"&mlevel="+mlevel;
	}else{
		location.href ="memlist.do";
	}
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
		var mess="선택하신 회원을 삭제하시겠습니까?"
		if(confirm(mess)){ 
			frm.submit();
		}
	}
}

function cateInsert(frm){
	  var categoryinfo = frm.categoryinfo.value;
	  
	  categoryinfo = categoryinfo.replace(/^\s*|\s*$/g, '');
	  
	  if(categoryinfo.length == 0){
	    alert("강좌설명을 입력해 주세요.");
	    frm.subject.focus();
	    return;
	  }
	  
	  alert("강좌정보를 등록 하시겠습니까? ");
	  
	  frm.submit();
}

function cateInsert_validate(frm){
	  var categoryinfo = frm.categoryinfo.value;
	  
	  categoryinfo = categoryinfo.replace(/^\s*|\s*$/g, '');
	  
	  if(categoryinfo.length == 0){
	    alert("강좌설명을 입력해 주세요.");
	    frm.subject.focus();
	    return;
	  }
	  
	  alert("강좌정보를 수정 하시겠습니까? ");
	  
	  frm.submit();
}

function bbsCheck(frm) {
	var flag=false;
	var check = document.getElementsByName('check2');
	
	for (var i = 0; i < check.length; i++) {
		if (check[i].checked) flag=true;
	}
	
	if(flag==false) {
		alert('삭제할 게시물을 선택해주세요. ');
		return false;
	}
	if(flag==true) {
		var mess="선택한 게시물을 삭제하시겠습니까?\n  (댓글이 있을 경우 댓글도 모두 지워집니다.)"
		if(confirm(mess)){ 
			frm.submit();
		}
	}
}

function qnaCheck(frm) {
	var flag=false;
	var check = document.getElementsByName('check2');
	
	for (var i = 0; i < check.length; i++) {
		if (check[i].checked) flag=true;
	}
	
	if(flag==false) {
		alert('삭제할 게시물을 선택해주세요. ');
		return false;
	}
	if(flag==true) {
		var mess="선택한 게시물을 삭제하시겠습니까?\n  (답변글이 있을 경우 답변글도 모두 지워집니다.)"
		if(confirm(mess)){ 
			frm.submit();
		}
	}
}

function checkSearch(frm){
	var col1 = frm.col1.value;
	var col2 = frm.col2.value;

	col1 = col1.replace(/^\s*|\s*$/g, '');
	col2 = col2.replace(/^\s*|\s*$/g, '');
	
	if(col1.length==0){
		alert("검색조건을 선택하세요.");
		frm.col1.focus();
		return;
	}
	if(col2.length==0){
		alert("검색어를 입력하세요.");
		frm.col2.focus();
		return;
	}
	frm.submit();
}//end

function notice_validate(frm){
	  var subject = frm.subject.value;
	  var content = frm.content.value;
	  
	  subject = subject.replace(/^\s*|\s*$/g, '');
	  content = content.replace(/^\s*|\s*$/g, '');
	  
	  if(subject.length == 0){
	    alert("제목을 입력해 주세요.");
	    frm.subject.focus();
	    return;
	  }
	  
	  if(content.length == 0){
	    alert("내용을 입력해 주세요.");
	    frm.content.focus();
	    return;
	  }

	  alert("등록 하시겠습니까? ");
	  
	  frm.submit();
}
