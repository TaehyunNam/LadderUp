<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<div>
<c:forEach var="list" items="list">	
	${list.randomNo }
</c:forEach>
</div>
</body>
</html>