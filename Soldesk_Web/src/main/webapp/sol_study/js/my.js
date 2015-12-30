function checkLogin(frm, s_id){
	//alert(s_id);
	if(s_id=="" || s_id=="guest"){
		alert("로그인 후 사용 가능합니다.");
		return;
	}
	frm.submit();
}//end

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

function goRead(qnano,recNo,s_id){
	//alert(recNo);
	//alert(s_id);
	
	if(s_id=="" || s_id=="guest"){
		alert("로그인 후 사용 가능합니다.");
		return history.go();
	}
	
	location.href="read.do?qnano="+qnano+"&recNo="+recNo;
}//end

function validate(frm){
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

	  msg="등록 하시겠습니까? ";
	  if(confirm(msg)!=0){
	  frm.submit();
	  }else{
		  return;
	  }
}//end