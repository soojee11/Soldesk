<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../sol_header.jsp"%>
<%@page import="net.utility.Utility"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- page start-->
<script src="js/my.js"></script>
<link href="./css/style.css" rel="stylesheet" type="text/css">
<link rel='stylesheet' type='text/css' href='css/star.css'>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<h4>
	<!-- <img src="img/cont.JPG"> -->
	<img src="../sol_img/go_right.png" width="20px"/>
	<img src="img/study.png" width="150px" height="50px"><span style="font-size: 12px;">| 학습해 보세요 </span> 
</h4>

<div class="column">
	 <div class="menu1">
			<!-- 학년별 카테고리 -->
			<ul>				
				<li style="background-color: #99cc66">학년</li>
				<li><a href="./lectureInfo.do?grade=1&gwamok=${gwamok}">1학년</a></li>
				<li><a href="./lectureInfo.do?grade=2&gwamok=${gwamok}">2학년</a></li>
				<li><a href="./lectureInfo.do?grade=3&gwamok=${gwamok}">3학년</a></li>
				<li><a href="./lectureInfo.do?grade=4&gwamok=${gwamok}">4학년</a></li>
				<li><a href="./lectureInfo.do?grade=5&gwamok=${gwamok}">5학년</a></li>
				<li><a href="./lectureInfo.do?grade=6&gwamok=${gwamok}">6학년</a></li>
			</ul>		
	</div>
	
	<div class="menu2">
			<!-- 과목 카테고리 -->
			<ul>				
				<li style="background-color: #99cc66">과목</li>
				<li><a href="lectureInfo.do?grade=${grade }&gwamok=국어">국어</a></li>
				<li><a href="lectureInfo.do?grade=${grade }&gwamok=수학">수학</a></li>
				<li><a href="lectureInfo.do?grade=${grade }&gwamok=사회">사회</a></li>
				<li><a href="lectureInfo.do?grade=${grade }&gwamok=과학">과학</a></li>
			</ul>		
	</div>
	<hr>
	 <div class="view">
	 <table border="0" width="100%">
		 <tr style="height: auto;">
				 <td>
				     <!-- teacherPhoto -->
						<div style="font-size: 20px; text-align: center;">
						   <img src='../sol_admin/player/cateStorage/${cateDto.teacherPhoto }' 
						        width="300px" height="200px" style="margin: 20px; border-radius: 8px; border: 1px solid; "/>
						   <br/>${cateDto.teacherName }<br/><br/>
						</div>
			   </td>
			   <td>
			        <!-- teacherCareer & 평점 avg(postGrade) -->
			        <div style="text-align: left; margin: 20px; padding: 10px; font-size: 12px;">
			           <font style="font-size: 20px">< 선생님 이력 ></font><br/><br/>${cateDto.teacherCareer }
	            </div>
			   </td>
	   </tr>
   </table>
   </div>
   <table border="0" width="100%">
   <tr height="10px"></tr>
   <tr><td><div style="font-size: 18px">< 강좌 설명 ></div></td></tr>
   <tr height="10px"></tr>
   <tr>
      <td >			
					<div class="view" style="text-align: left; padding-top: 5px; ">
					   <!-- categoryInfo -->
					   ${cateDto.categoryinfo }<br/><br/>
					</div>
		  </td>
		</tr>
		<tr height="10px"></tr>
    <tr><td><div style="font-size: 18px">< 교재 설명 ></div></td></tr>
    <tr height="10px"></tr>
		</table>
		  <div style="border : 5px solid #99cc66; width: 98%">
				<table border="0" width="100%">
					 <tr>
					  <td width="30%">
					     <div align="left"><img src='../sol_admin/player/cateStorage/${cateDto.bookPhoto }' style="margin: 20px"></div>
					  </td>
				    <td width="40%">
				       <div style="text-align: left; padding-top: 5px;">
					       <!-- bookInfo -->
					       ${cateDto.bookInfo }
				       </div>
				    </td>
				    <td align="left">
				       <!-- 강좌보러가기 -->
				       <a href="lectureList.do?gwamok=${gwamok }&grade=${grade }&tabNum=1">
				       <div align="center">
					       <font color="green">강좌보러가기</font>
					       <br/><i class="fa fa-play-circle" style="font-size:48px; color:green"></i></a>
			        </div>
				     </td>
					 </tr>
			</table>
	 </div>
</div>
<!-- page end-->
<%@ include file="../sol_footer.jsp"%>