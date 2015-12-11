function questionList(testno,testtitle) 
{
	//http://a3040.com/bbs/board.php?bo_table=javascript&wr_id=9&page=2
	
	alert('"채점"을 완료해야 성적현황 및 오답노트에 시험지가 저장됩니다 ');
	userwidth = (screen.width-550); 
	userheight = (screen.height-200); 
	
	var tops = Number(((screen.height/2)-(userheight/2))-50);
	var left = Number((screen.width/2)-(userwidth/2));
	
	window.open('questionList.do?testno='+testno+"&testtitle="+testtitle,'test_window',
			'scrollbars=yes,resizable=yes,width='+userwidth+',height='+userheight+',top='+tops+', left='+left);

} 