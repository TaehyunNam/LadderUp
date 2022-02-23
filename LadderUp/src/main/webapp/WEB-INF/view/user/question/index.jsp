<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<style>

.grade{
	text-align:center;
	line-height:100px;
	border: solid;
	border-style:double;
	background-color: #F6F6F6;
	height: 100px;
}

.submit {
  width: 180px;
  height: 55px;
  font-family: 'Roboto', sans-serif;
  font-size: 13px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 800;
  color: #000;
  background-color: #fff;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.3);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  margin: auto;
  display: block;
  }

.submit:hover {
  background-color: #ff0000;
  box-shadow: 0px 15px 20px rgba(255, 216, 216, 1);
  color: #fff;
  transform: translateY(-7px);
}

.subcon{
  padding: 10px;
}

.examples:hover{
	color: #ff9900;
	font-weight: bold;
}

.qcon{
	padding-bottom: 10px;
	font-size: 15px;
	font-weight: bold;
	width: 700px;
}
</style>
<script>
	function conf(){
		if($('.example:checked').length != ${num}){
			alert('모든 답안을 체크해주세요.');
			return false;
		}else{
			if(confirm('제출하시겠습니까?')){
				return true;
			}else return false;
		}
	}
</script>
<script>
	$(function() {
		$(".example").click(function() {
			if ($(this).prop("checked")) {
				var idx = $(this).parent().parent().find(".example").index(this);
				$(this).parent().parent().find(".example").prop("checked",false);
				$(this).parent().parent().find(".example").eq(idx).prop("checked",true);
				
				$(this).parent().parent().find(".examples").css("color","");
				$(this).parent().css("color","#ff9900");
			}
		})
	})
</script>
</head>
<body> 
<div id="wrap">
	<div id="canvas">
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>[${school.school_name} ${exam.year}년도 ${exam.semester}학기] - 총 ${exam.number_of_questions}문항/${exam.exam_time}분</h2>
					<input type="hidden" value="${userInfo.user_no}">
				</div>
				<div class="con">
					<div id="bbs">
					<c:if test="${userInfo.user_grade != 1}">
					<div class="grade">
						<h1 style="font-size:20px;]">결제 또는 일일체험권 이용 고객에게만 채점기능이 제공됩니다.</h1>
					</div>
					</c:if>
						<div id="question">
						<c:set var="idx" value="0"/>
							<form method="post" name="frm" id="frm" action="insert.do?exam_no=${exam.exam_no}" enctype="multipart/form-data" onsubmit="return conf();">
								<c:forEach var="qv" items="${qlist}" varStatus="status">
								<input type="hidden" value="${qv.question_no}">
									<div class="passage">${qv.passage }</div>
									
									<c:set var="string" value="${qv.question_content}"/>
									<c:set var="string1" value="${fn:replace(string,'#','<u>')}"/>
									<c:set var="string2" value="${fn:replace(string1,'$','</u>')}"/>
									
									<div class="subcon">
										<div class="qcon" style="width:800px">${status.count}. ${string2}</div>
											<c:forEach var="ev" items="${qv.ex}" varStatus="status">
												<div class="examples">
													<input type="checkbox" id="chk${idx}" class="example" name="example" value="${ex[status.index]}">&nbsp;
														<label for="chk${idx}">(${ev.example}) ${ev.example_content}</label>
												</div>
												<c:set var="idx" value="${idx+1 }"/>
											</c:forEach>
									</div>
								<br><br>
								</c:forEach>
								<c:if test="${userInfo.user_grade == 1}">
									<input type="submit" class="submit" value="제출하기">
								</c:if>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>