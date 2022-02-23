<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	alert('${msg}');
	<c:if test="${empty url}">history.back();</c:if>
	<c:if test="${!empty url}">location.href='${url}';</c:if>
</script>