<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../sol_header.jsp"%>
<!-- page start-->
<c:if test="${msg != null}">
	<script type="text/javascript">
	 alert("게시물 등록 성공");
	 location.href="bbslist.do";
	</script>
</c:if>
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
<h5>
	<img src="bbs_img/cont.JPG"><img src="bbs_img/pna.JPG">| 무엇이든 물어보세요
</h5>
<hr>
<div align="center"><h3>Q & A</h3></div><hr/>
	<form method="post" action="create.do" name="frm" id="frm">
	 <table width="100%">
	  <tr>
		   <td>제목</td>
		   <td><input type="text" name="subject" id="subject"></td>
		</tr>
		<tr>
		<td>내용</td>
			<td>
        <textarea name="content" id="content" style="width:766px; height:412px;"></textarea>
			</td></tr>
			<tr><td colspan="2" align="center">
		     <input type="button" class="btn btn-default" name="list" value="목록" onclick="location.href='bbslist.do'">
		     <input type="button" class="btn btn-default" id="savebutton" value="등록" >
		     <input type="reset" class="btn btn-default" name="reset" value="취소">
		  </td>
	  </tr>
	 </table>
	</form>
<!-- page end-->
<%@ include file="../sol_footer.jsp"%>