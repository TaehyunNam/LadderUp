<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
.btn{
	opacity:0;
}
.btn>value{
padding:5px 10px; border:1px solid #ccc; border-radius:3px;}
input[type=radio]:checked+value
{
background:#ccc;
color:white;}
</style>
<script>
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<form action="/question_pool/user/question/index.do">
	<h4 style="font-size: 35px; padding:0 0 0 152px"> 시험 </h4>
		<c:forEach var="plist" items="${dList}">
	<label style="font-size:25px"><img src="../../img/user/exam.png" style="width:150px; padding:0 0 0 125px;"><br><input type="submit" class="btn" name="exam_no" value="${plist.exam_no}">${plist.school_name}  ${plist.year}년도  ${plist.semester}학기</label>
		</c:forEach>
		</form>
	
</body>
</html>