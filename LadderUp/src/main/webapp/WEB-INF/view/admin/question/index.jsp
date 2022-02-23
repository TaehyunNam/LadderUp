<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
</head>
<body> 
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>문제목록-[${school.school_name} ${exam.year}년도 ${exam.semester}학기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<c:forEach var="qv" items="${qlist}" varStatus="status">
							<input type="hidden" value="${qv.question_no}">
										<p>${qv.passage}</p><br>
										<c:set var="string" value="${qv.question_content}"/>
										<c:set var="string1" value="${fn:replace(string,'#','<u>')}"/>
										<c:set var="string2" value="${fn:replace(string1,'$','</u>')}"/>
										<h1 style="width:500px;">${status.count}. ${string2}</h1>
										<c:forEach var="ev" items="${qv.ex}">
												(${ev.example}) ${ev.example_content}<br>
										</c:forEach>
										<br>
										<p style="width:600px;">[해설] : ${qv.explanation}</p>
										<br>
										<p>[정답] : (${qv.answer})</p>
										<a href="edit.do?exam_no=${exam.exam_no}&question_no=${qv.question_no}"><input type="button" value="문제수정"></a>
										<a href="delete.do?exam_no=${exam.exam_no}&question_no=${qv.question_no}"><input type="button" value="문제삭제"></a>
										<br><br>
							</c:forEach>
							<!--//btn-->
						</div>
						<!-- //bread -->
					</div>
					<!-- //bbs --> 
					<!-- 내용 : e -->
				</div>
				<!--//con -->
			</div>
			<!--//content -->
		</div>
		<!--//container --> 
		<!-- E N D :: containerArea-->
	</div>
	<!--//canvas -->
</div>
<!--//wrap -->

</body>
</html>