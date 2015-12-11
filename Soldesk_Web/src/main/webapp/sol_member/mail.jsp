<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form name="mailfrm" 
      method="post" 
      action="mail.do">    
      <input type="hidden" name="from" value="${from }" />
      <input type="hidden" name="id" value="${id }" />
      <input type="hidden" name="passwd" value="${passwd }" />
      <input type="hidden" name="email" value="${email }" />


메일페이지
${id }
${email}
${passwd }
${from }

</form>
