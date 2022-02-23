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
<style>
h1{font-size:250%;}
h2{font-size:150%;}
.score{
	text-align:center;
	line-height:100px;
	border: solid;
	border-style:double;
	background-color: #F6F6F6;
	height: 100px;
}
.score img{
	vertical-align: middle;
}
</style>
<body> 
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<!-- E N D :: headerArea--> 
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
						<div class="score">
							<h1><img src="/question_pool/img/user/pencil.png" height="40px;">
							[SCORE] : 맞은 문제 ${cnt}개</h1>
						</div>
							<br><br>
							<h2>[해설보기]</h2>
							<c:forEach var="qv" items="${qlist}" varStatus="status">
							<div style="width:800px; padding:10px;">
							<input type="hidden" value="${qv.question_no}">
										<p>${qv.passage }</p><br>
										
										<c:set var="string" value="${qv.question_content}"/>
										<c:set var="string1" value="${fn:replace(string,'#','<u>')}"/>
										<c:set var="string2" value="${fn:replace(string1,'$','</u>')}"/>
										
										<c:if test="${qv.score eq 0}">
											<div style="color:red;">
												<p>${status.count}. ${string2}</p>
												<c:forEach var="ev" items="${qv.ex}">
													(${ev.example}) ${ev.example_content}<br>
												</c:forEach>
											</div>
										</c:if>
										<c:if test="${qv.score eq 1}">
											<div>
												<p>${status.count}. ${string2}</p>
												<c:forEach var="ev" items="${qv.ex}">
													(${ev.example}) ${ev.example_content}<br>
												</c:forEach>
											</div>
										</c:if>
											<p>[해설] ${qv.explanation}</p>
											<p>내가 고른 답 : (${qv.user_answer})</p>
											<p>정답 : (${qv.answer})</p>
							</div>
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