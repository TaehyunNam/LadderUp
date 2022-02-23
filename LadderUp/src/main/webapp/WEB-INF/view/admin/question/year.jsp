<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4 style="font-size: 20px;">년도선택</h4>
	<select name="year" id="year" style="width: 100px; height: 30px;" onclick="getsemester()">
		<c:forEach var="vo" items="${cList}">
			<option value="${vo.year}">${vo.year}</option>
		</c:forEach>
	</select>
</body>
</html>