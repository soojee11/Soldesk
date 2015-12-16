<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-file-text-o"></i> Member
		</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="adminindex.do">Home</a></li>
			<li>회원 정보 관리자페이지</li>
		</ol>
	</div>
</div>

<div class="row">
	<div class="col-lg-12" align="right">
		<form class="form-inline" action="memdelete.do">
			<div class="form-group">
				<select class="form-control input-sm m-bot15" name="col">
					<option value="" >--회원전체--</option>
					<option value="mdate" >가입일순</option>
					<option value="id">ID순</option>
					<option value="name">이름순</option>
				</select>
			</div>
			<button class="btn btn-success btn-sm">검색</button>
		</form>
	</div>
</div>

<form method="post" action="memdelete.do">
<table border="0" cellspacing="0" cellpadding="0" align="center" class="table">
	<tr>
		<td colspan="9" align="left"> 
			<input type="checkbox" name="allck2" id="allck2" onclick="checkboxEnable2()"/>
			<strong><span style="font-size:12px; color:#1717ff;">모두체크</span></strong>
			<button type="button" class="btn btn-danger btn-sm" onclick="memCheck2(this.form)">선택 삭제</button>
		</td>
	</tr>
	<tr align ="center">
		<th><div align="center">선택</div></th>
		<th><div align="center">ID</div></th>
		<th><div align="center">이름</div></th>
		<th><div align="center">email</div></th>
		<th><div align="center">전화번호</div></th>
		<th><div align="center">등록일</div></th>
		<th><div align="center">등급</div></th>
	</tr>
	<c:if test="${total ==0 }">
		<tr>
			<td colspan="7" align="center">등록된 회원정보가 존재하지 않습니다. </td>
		</tr>
	</c:if>
	<c:set var ="recNo" value="${recNo }"/>
	<c:forEach var ="dto" items="${list }">
		<c:set var ="recNo" value="${recNo-1 }"/>
			<tr align ="center">
				<td><input type="checkbox" name="check2" value="${dto.id }"  /></td>
				<td>${dto.id }</td>
				<td>${dto.name }</td>
				<td>${dto.email }</td>
				<td>${dto.tel }</td>
				<td>${dto.mdate }</td>
				<td>${dto.mlevel }</td>
				<td>${dto.promise }</td>
			</tr>
	</c:forEach>
	<tr>
		<td colspan="8" align="right" ><strong>total:</strong>${total }</td>
	</tr>
	<tr>
		<td colspan="8"><div align="center">${paging }</div></td>
	</tr>
</table>
</form>



<%@ include file="../footer.jsp"%>