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
	<h4 style="font-size: 30px;">학기선택</h4>
	<select name="exam_no" id="exam_no" style="width: 200px; height: 40px; font-size:20px">
		<c:forEach var="plist" items="${dList}">
			<option value="${plist.exam_no}">${plist.semester}</option>
		</c:forEach>
	</select>
</body>
</html>