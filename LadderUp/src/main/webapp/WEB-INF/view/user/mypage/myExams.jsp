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
table.type10 {
  border-collapse: collapse;
  width: 70%;
  text-align:center;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  margin-left: auto; margin-right: auto;
}
table.type10 thead th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
  background: #e7708d;
  margin: 20px 10px;
}
table.type10 tbody th {
  width: 150px;
  padding: 10px;
}
table.type10 td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
}
table.type10 .even {
  background: #fdf3f5;
}
tr:hover { background-color: #F5F5F5; } 
</style>
<body> 
<div id="wrap">
	<div id="canvas">
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>내가 푼 문제 조회하기</h2>
					<input type="hidden" value="${userInfo.user_no}">
				</div>
				<div class="con">
					<ul class="list">
					<table border="1" width="70%" class="type10">
				      	<thead>
							<tr>
								<th>내가 푼 문제</th>
							</tr>
						</thead>
						<tbody>									
							<c:if test="${empty elist}">
								 <tr>
						            <td>푼 문제가 없습니다.</td>
						        </tr>
							</c:if>
							<c:if test="${!empty elist}">
								<c:forEach var="ev" items="${elist}">
									<tr>
										<td><a href="/question_pool/user/question/score.do?exam_no=${ev.exam_no}">
										<li><img src="/question_pool/img/user/pencil.png" width="30px;">${ev.school_name} ${ev.year}년도 ${ev.semester}학기</li>
										</a></td>
									</tr>
								</c:forEach>
								<c:forEach var="sv" items="${slist}">
									<tr>
										<td><a href="/question_pool/user/question/scoreRandom.do?school_no=${sv.school_no}&user_no=${userInfo.user_no}">
										<li><img src="/question_pool/img/user/pencil.png" width="30px;">${sv.school_name} 랜덤 모의고사</li>
										</a></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>