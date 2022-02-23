<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script type="text/javascript" src="/question_pool/smarteditor/js/HuskyEZCreator.js"></script>
<script src="/question_pool/js/common.js"></script>

<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
	var oEditors;
	$(function(){
		oEditors = setEditor("passage");
		
		$(".example").click(function() {
			if ($(this).prop("checked")) {
				var idx = $(this).parent().parent().find(".example").index(this);
				$(this).parent().parent().find(".example").prop("checked",false);
				$(this).parent().parent().find(".example").eq(idx).prop("checked",true);
			}
		})
	});
	
	function goSave(){
		oEditors.getById['passage'].exec("UPDATE_CONTENTS_FIELD",[]);
		$("#frm").submit();
	}
</script>
<script>
	function add(){
		$.ajax({
			url : '/question_pool/admin/question/writeAjax.do',
			data : $("#frm").serialize(),
			success : function(res){
   				$("#writeArea").append(res);
   			}
		});
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
		<input type="hidden" id="exam_no" name="exam_no" value="${exam.exam_no}">
		<input type="hidden" id="school_no" name="school_no" value="${exam.school_no}">
		<input type="hidden" id="admin_no" name="admin_no" value="${adminInfo.admin_no}">
			<div id="content">
				<div class="con_tit">
					<h2>문제등록-[${school.school_name} ${exam.year}년도 ${exam.semester}학기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="insert.do?exam_no=${exam.exam_no}" enctype="multipart/form-data">
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
										<th scope="row"><label for="">문제</label></th>
										<td colspan="10">
											<textarea id="question_content" name="question_content" class="w100" rows="3" title="문제를 입력해주세요"></textarea>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">지문</label></th>
										<td colspan="10">
											<textarea id="passage" name="passage" title="지문을 입력해주세요" rows="10" style="width:100%;"></textarea>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">보기</label></th>
										<td colspan="10">
										<div class="examples">
											<input type="checkbox" class="example" name="example" value="A">&nbsp; 
											(A) <input type="text" name="example_content" style="width:500px;"><br><br>
											<input type="checkbox" class="example" name="example" value="B">&nbsp; 
											(B) <input type="text" name="example_content" style="width:500px;"><br><br>
											<input type="checkbox" class="example" name="example" value="C">&nbsp; 
											(C) <input type="text" name="example_content" style="width:500px;"><br><br>
											<input type="checkbox" class="example" name="example" value="D">&nbsp; 
											(D) <input type="text" name="example_content" style="width:500px;"><br><br>
											<input type="checkbox" class="example" name="example" value="E">&nbsp; 
											(E) <input type="text" name="example_content" style="width:500px;">
										</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">해설</label></th>
										<td colspan="10">
											<textarea id="explanation" name="explanation" title="해설을 입력해주세요" rows="10" style="width:100%;"></textarea>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">참조문제&nbsp;</label></th>
										<td colspan="10">
											<div id="writeArea"></div>
											<input type="button" onclick="javascript:add();" value="참조문제추가">
										</td>
									</tr>
								</tbody>
							</table>
							<div class="btn" style="height:150px;">
								<div class="btnRight" style="height:100px;">
									<input type="submit" onclick="javascript:goSave();" class="btns" value="등록" style="width:250px;height:50px;">
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