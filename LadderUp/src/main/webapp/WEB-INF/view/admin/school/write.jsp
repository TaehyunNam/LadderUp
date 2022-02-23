<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
function goSaveSchool(){
	if($("#school_name").val()==''){
		alert("학교입력");
		$("#school_name").focus();
		return;
	}
	$("#frm").submit();
}
function goSaveExam(){
	if($("#year").val()==''){
		alert("년도입력");
		$("#year").focus();
		return;
	}
	if($("#number_of_questions").val()==''){
		alert("문항수입력");
		$("#number_of_questions").focus();
		return;
	}
	if($("#exam_time").val()==''){
		alert("시험시간입력");
		$("#exam_time").focus();
		return;
	}
	if($("#semester").val()==''){
		alert("학기 입력");
		$("#semester").focus();
		return;
	}
	$("#frm1").submit();
}
</script>
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
					<h2>학교등록</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="insertschool.do" enctype="multipart/form-data">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="15%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">학교명</label></th>
										<td colspan="10">
											<input type="text" id="school_name" name="school_name" class="w100" />	
										</td>
									</tr>
									</tbody>
									</table>
									</form>
										<div class="btn">
										<div class="btnRight">
										<a class="btns" style="cursor:pointer;" href="javascript:goSaveSchool();"><strong>저장</strong></a>
										</div>
										</div>
                                
									<form method="post" name="frm1" id="frm1" action="insertexam.do" enctype="multipart/form-data">
								<c:forEach var="vo" items="${list}">
                                <label><input type="radio" name="school_no" value="${vo.school_no}">
                                 ${vo.school_name}</label>
                                </c:forEach>
								<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="15%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">년도</label></th>
										<td colspan="10">
											<input type="text" id="year" name="year" class="w100" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">문항 수</label></th>
										<td colspan="10">
											<input type="text" id="number_of_questions" name="number_of_questions" class="w100"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">시험 시간</label></th>
										<td colspan="10">
											<input type="text" id="exam_time" name="exam_time" class="w100"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">학기</label></th>
										<td colspan="10">
											<input type="text" id="semester" name="semester" class="w100"/>	
										</td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="write" />
							<div class="btn">
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" href="javascript:goSaveExam();"><strong>저장</strong></a>
									
								</div>
							</div>
							</form>
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