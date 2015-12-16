<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>
	<div align="center">
		<h3>카테고리 삭제</h3><br/>
		<h4>${dto.grade } 학년 
		<c:choose><c:when  test="${dto.gwamok eq 'kor' }" >국어 </c:when></c:choose>
		<c:choose><c:when  test="${dto.gwamok eq 'mat' }" >수학 </c:when></c:choose>
		<c:choose><c:when  test="${dto.gwamok eq 'eng' }" >영어 </c:when></c:choose>
		<br/>
		</h4>
		강좌설명 | ${dto.categoryInfo }
		<h5>
			<strong>카테고리에 담긴 모든 동영상 정보가 삭제됩니다. </strong><br/>
			삭제를 진행하시겠습니까?
		</h5>
		
		<button type="button" class="btn btn-info btn-sm"  onclick="location.href='./cateDelProc.do?categoryno=${param.categoryno}'" >삭제진행</button>
		<button type="button" class="btn btn-info btn-sm"  onclick="javascript:history.go(-1)">취소</button>
		
	</div>


<%@ include file="../footer.jsp"%>