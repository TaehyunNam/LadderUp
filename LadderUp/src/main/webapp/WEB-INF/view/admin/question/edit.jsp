<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script type="text/javascript" src="/question_pool/smarteditor/js/HuskyEZCreator.js"></script>
<script src="/question_pool/js/common.js"></script>

<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
	var oEditors;
	$(function(){
		oEditors = setEditor("passage");
	});
	
	function goSave(){
		oEditors.getById['passage'].exec("UPDATE_CONTENTS_FIELD",[]);
		$("#frm").submit();
	}
</script>
<style>

</style>
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
					<h2>문제수정-[${school.school_name}대학교 ${exam.year}년도 ${exam.semester}학기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="update.do?exam_no=${exam.exam_no}&question_no=${qv.question_no}" enctype="multipart/form-data">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
							<input type="hidden" value="${qv.question_no}">
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
										<th scope="row"><label for="">문제</label></th>
										<td colspan="10">
											<textarea id="question_content" name="question_content" class="w100" rows="3" title="문제를 입력해주세요">${qv.question_content}</textarea>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">지문</label></th>
										<td colspan="10">
											<textarea id="passage" name="passage" rows="10" style="width:100%;">${qv.passage}</textarea>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">보기</label></th>
										<td colspan="10">
											<c:forEach var="ev" items="${elist}" varStatus="status">
												<input type="hidden" name="example_no" value="${ev.example_no}">
												<c:if test="${qv.answer eq ex[status.index]}">
													<input type="checkbox" name="example" value="${ex[status.index]}" checked>&nbsp; 
												</c:if>
												<c:if test="${qv.answer ne ex[status.index]}">
													<input type="checkbox" name="example" value="${ex[status.index]}">&nbsp; 
												</c:if>
												(${ev.example})
												<input type="text" name="example_content" value="${ev.example_content}">
												<br>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">해설</label></th>
										<td colspan="10">
											<textarea id="explanation" name="explanation" rows="10" style="width:100%;">${qv.explanation}</textarea>	
										</td>
									</tr>
								</tbody>
							</table>
							<div class="btn">
								<div class="btnRight">
									<input type="submit" onclick="javascript:goSave();" class="btns" value="수정" style="width:250px;height:50px;">
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