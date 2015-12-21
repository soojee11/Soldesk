<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>
	
<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-file-text-o"></i> Test
		</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="adminIndex.do">Home</a></li>
			<li>문제풀기 게시판 관리 페이지</li>
		</ol>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<section class="panel">
			<header class="panel-heading"> 시험 문제지 수정 </header>
			<div class="panel-body">
			
				<form class="form-horizontal " method="post" action="questionUpdateProc.do">
				<input type="hidden" name="testno" value="${dto.testno }">
				<input type="hidden" name="questno" value="${dto.questno }">
				<input type="hidden" name="testtitle" value="${param.testtitle }">
				<div class="form-group">
					<label class="col-sm-2 control-label">문제제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="qtitle" value="${dto.qtitle }">							
					</div>
				</div>
				
				<div class="form-group">
				<label class="col-sm-2 control-label">문제종류</label>
				<div class="col-sm-10">
				<c:if test="${dto.qtype eq 'G'}"><p class="form-control-static">
				<input type="hidden" name="qtype" value="G" />객관식</p></c:if>
				<c:if test="${dto.qtype eq 'J'}"><p class="form-control-static">
				<input type="hidden" name="qtype" value="J" />주관식</p></c:if>
				<c:if test="${dto.qtype eq 'OX'}"><p class="form-control-static">
				<input type="hidden" name="qtype" value="OX" />OX</p></c:if>
				</div>
				</div>

				<c:if test="${dto.qtype eq 'G'}">
				<div class="form-group" id="G">
				
				<c:set var="example" value="${dto.example }" />
			 	<%
			 	String example = (String)pageContext.getAttribute("example");
			 	String[] number=new String[5];
				String[] str=example.split("/");
				for (int idx = 0; idx < str.length; idx++) {
					number[idx]=str[idx];
					//System.out.print(number[idx]);
				}
				
				for (int idx = 0; idx < str.length; idx++) {
					pageContext.setAttribute("number"+idx, number[idx]) ;
				}
				%>
				
				<div class="form-inline">
					<span class="help-block" style="padding-left: 250px;color: red;">* 보기 중 답을 체크하세요 *</span>	
					<label class="col-sm-2 control-label">보기 1
					<input type="radio" name="exampleCheck" value="example1" <c:if test="${number0 eq dto.answer}">checked</c:if>>
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="example1" value="${number0 }">							
					</div>				
				</div>
				<div class="form-inline">
					<label class="col-sm-2 control-label">보기2
					<input type="radio" name="exampleCheck" value="example2" <c:if test="${number1 eq dto.answer}">checked</c:if>>
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="example2" value="${number1 }">							
					</div>				
				</div>
				<div class="form-inline">
					<label class="col-sm-2 control-label">보기3
					<input type="radio" name="exampleCheck" value="example3" <c:if test="${number2 eq dto.answer}">checked</c:if>>
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="example3" value="${number2 }">							
					</div>				
				</div>
				<div class="form-inline">
					<label class="col-sm-2 control-label">보기4
					<input type="radio" name="exampleCheck" value="example4" <c:if test="${number3 eq dto.answer}">checked</c:if>>
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="example4" value="${number3 }">							
					</div>				
				</div>
				<div class="form-inline">
					<label class="col-sm-2 control-label">보기5
					<input type="radio" name="exampleCheck" value="example5" <c:if test="${number4 eq dto.answer}">checked</c:if>>
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="example5" value="${number4 }">							
					</div>				
				</div>	
				</div>
				</c:if>
				<c:if test="${dto.qtype eq 'J'}">
				<div class="form-group" id="answer">
					<label class="col-sm-2 control-label">답</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="answer" value="${dto.answer }">							
					</div>
				</div>
				</c:if>
				<c:if test="${dto.qtype eq 'OX'}">
				<div class="form-group" id="OX">
					<label class="col-sm-2 control-label">답</label>
					<div class="col-lg-10">
						<label class="checkbox-inline">
							<input type="radio" name="OXAnswer" value="O" <c:if test="${dto.answer eq 'O'}">checked</c:if>>O
						</label>
						<label class="checkbox-inline">
							<input type="radio" name="OXAnswer" value="X" <c:if test="${dto.answer eq 'X'}">checked</c:if>>X
						</label>
					</div>
				</div>
				</c:if>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">해설</label>
					<div class="col-sm-10">
						<textarea class="form-control ckeditor" name="comment" rows="6">${dto.comment }</textarea>
					</div>
				</div>

				<div align="center">
					<button type="button" class="btn btn-danger btn-sm" onclick="javascript:history.back();">취소</button>
					<button type="button" class="btn btn-danger btn-sm" onclick="questionFormCheck(this.form)">문제수정</button>
				</div>
				</form>
				
			</div>
		</section>
	</div>
</div>

<%@ include file="../footer.jsp"%>