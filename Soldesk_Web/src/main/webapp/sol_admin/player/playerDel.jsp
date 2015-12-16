<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>
	<div align="center">
		<h3>동영상 삭제</h3><br/>
		<h4>${dto2.grade } 학년 
		<c:choose><c:when  test="${dto2.gwamok eq '국어' }" >국어 </c:when></c:choose>
		<c:choose><c:when  test="${dto2.gwamok eq '수학' }" >수학 </c:when></c:choose>
		<c:choose><c:when  test="${dto2.gwamok eq '영어' }" >영어 </c:when></c:choose> - ${dto.subject }</h4>
		
		<h5>영구히 삭제하시겠습니까?</h5>
		
		<button type="button" class="btn btn-info btn-sm"  onclick="location.href='./lecDelProc.do?categoryno=${param.categoryno}&lectureno=${param.lectureno }'" >삭제진행</button>
		<button type="button" class="btn btn-info btn-sm"  onclick="javascript:history.go(-1)">취소</button>
		
	</div>


<%@ include file="../footer.jsp"%>