<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../adminheader.jsp" %>
		<!-- page start-->
		<!--  동영상 등록 header랑 footer 나눠야 함. -->
		<div align="center"><h3>동영상 등록</h3></div>
		<form action="./playerInsert.do" method="post" enctype='multipart/form-data'>
		  <table align="center">
		    <tr>
		      <td colspan="2">
		        <select class="form-control" name="grade">
		          <option value="1">1학년</option>
		          <option value="2">2학년</option>
		          <option value="3">3학년</option>
		          <option value="4">4학년</option>
		          <option value="5">5학년</option>
		          <option value="6">6학년</option>
		        </select>
		        <select class="form-control" name="gwamok">
		          <option value="국어">국어</option>
		          <option value="영어">영어</option>
		          <option value="수학">수학</option>
		        </select>
		      </td>
		    </tr>
		    <tr>
		      <td style="width: 100px">제목</td> 
		      <td><input type="text" name="subject" placeholder="1-1 국어 (1)"></td>
		    </tr>
		    <tr>
          <td>선생님</td> 
          <td><input type="text" name="teacher" placeholder="신윤경 선생님"></td>
        </tr>
        <tr>
          <th>포스터</th>
          <td><input type="file" name="posterMF" size='50'></td>
        </tr>
        <tr>
          <th>동영상 파일</th>
          <td><input type="file" name="filenameMF" size='50'></td>
        </tr>
        <tr>
          <th>동영상 시간</th>
          <td><input type="text" name="lecturetime" placeholder="1020(초)"></td>
        </tr>
		    <tr>
          <td align="center" colspan="2">
          <input type="button" class="btn btn-default" value="등록" onclick="javascript:player_validate(this.form)"/></td>
        </tr>
		  </table>
		</form>
<!-- page end-->
<%@ include file="../adminfooter.jsp" %>		