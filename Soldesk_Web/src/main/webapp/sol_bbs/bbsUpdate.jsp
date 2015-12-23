<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../sol_header.jsp"%>
<!-- page start-->
<link rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="./js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
  $(function(){
      //전역변수
      var obj = [];               
      //스마트에디터 프레임생성
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: obj,
          elPlaceHolder: "content",
          sSkinURI: "./SmartEditor2Skin.html", 
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : false,
          }
      });
      
      //전송버튼
      $("#savebutton").click(function(){
           if($("#subject").val() == ""){
             alert("제목을 입력해 주세요.");
             $("#subject").focus();
             return;
           }
           
          //id가 smarteditor인 textarea에 에디터에서 대입
          obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
          //폼 submit
          $("#frm").submit();
      })
  })
</script>
<br/>
<c:if test="${msg != null}">
	<script type="text/javascript">
	 alert("게시물 수정 성공");
	 location.href="bbsread.do?bbsno=${dto.bbsno}&nowPage=${nowPage }";
	</script>
</c:if>
<br />
<h3>
	<img src="../sol_img/go_right.png" width="20px" /> 자유게시판&nbsp;&nbsp;<span
		style="font-size: 12px;">| 자유롭게 말해보세요 </span>
</h3>
<hr>
<div align="center">
	<form method="post" action="./bbsupdate.do" name="frm" id="frm">
  	<input type="hidden"  name="nowPage" value="${nowPage }">
  	<input type="hidden" name="bbsno" value="${dto.bbsno }">
		<table class="table" style="text-align: center">
			<tr bgcolor="#f5f7f9">
				<th style="text-align: center" valign="bottom">제목</th>
				<td bgcolor="#ffffff"><input type="text" name="subject"
					id="subject" value="${dto.subject }"></td>
			</tr>
			<tr bgcolor="#f5f7f9">
				<th style="text-align: center" valign="bottom">아이디</th>
				<td bgcolor="#ffffff">${s_id }</td>
			</tr>
			<tr bgcolor="#f5f7f9">
				<th style="text-align: center" valign="bottom">내용</th>
				<td bgcolor="#ffffff"><textarea name="content" id="content"
						style="width: 100%; height: 412px;">${dto.content }</textarea></td>
			</tr>
		</table>
		<div align="right">
	      <input type="button" class="btn btn-default" name="list" value="목록" onclick="location.href='bbslist.do?nowPage=${nowPage }'">
	      <input type="button" class="btn btn-default" id="savebutton" value="수정"> 
		</div>
	</form>
</div>

<!-- page end-->
<%@ include file="../sol_footer.jsp"%>