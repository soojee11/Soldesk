function questionList(s_id,testno,testtitle) 
{
	//http://a3040.com/bbs/board.php?bo_table=javascript&wr_id=9&page=2
	
	if(isNull(s_id)) {
		alert("로그인 후 사용 가능합니다.");
		return;
	}

	alert('"채점하기"를 완료해야 성적현황과 오답을 확인할 수 있습니다. ');
/*	userwidth = (screen.width-500); 
	userheight = (screen.height-150); */
	userwidth = (screen.width-400); 
	userheight = (screen.height-150);
	
	var tops = Number(((screen.height/2)-(userheight/2))-50);
	var left = Number((screen.width/2)-(userwidth/2));
	
	window.open('questionList.do?testno='+testno+"&testtitle="+testtitle,'test_window',
			'scrollbars=yes,resizable=yes,width='+userwidth+',height='+userheight+',top='+tops+', left='+left);

} 
function isNull(obj) {
	return(typeof obj!="undefined" && obj!=null && obj!="")? false:true;
}

var Timmer=new Date();                                        
var Login=Timmer.getTime();
var timer, timer2;

function showtime() {
	var stop=new Date();
	var SumTime=((stop.getTime()-Login)/1000); // 접속시간 총계
	var LoadH=Math.floor(SumTime/3600);      // 시간
	var LoadM=Math.floor((SumTime%3600)/60); // 분
	var LoadS=Math.floor(SumTime%60);        // 초
	
	var ctime = LoadH+"시간 "+LoadM+"분 "+LoadS+ "초"
	document.getElementById("clock").innerHTML = ctime;
	
	
	// 1초후 showtime()호출
	timer2 = window.setTimeout("showtime()", 1000);
}

function killtime(frm,gtotal) {
	//alert(gtotal);
	obj=frm.answer;
	var cnt=0;
	for(var i=0; i<obj.length; i++) {
		if(obj[i].checked==true){
			//alert(obj[i].value);
			cnt++;
		}
		if(obj[i].value==''){
			//alert(obj[i].value);
			alert("문제를 모두 풀어야 점수확인이 가능합니다.");
			return;
		}
	}

	if(cnt<gtotal) {
		alert("문제를 모두 풀어야 점수확인이 가능합니다.");
		//alert(cnt);
		return;
	}
	
	msg = "점수확인을 하시겠습니까?";
    if (confirm(msg)!=0) {
    	window.clearTimeout(timer);
    	window.clearTimeout(timer2);
    	
    	var clock=document.getElementById("clock").innerHTML;
    	frm.clock.value=clock;

    	frm.submit();
    } else {
        return;
	} 
}

function check_only(chk,num){
	//alert(num);
	var obj = document.getElementsByName("answer");
	//alert(obj.length);
	for(var i=0; i<obj.length; i++) {
		if(obj[i].value.indexOf(num) > -1){
		if(obj[i] != chk){
			obj[i].checked = false;
		}
		}
	}
}