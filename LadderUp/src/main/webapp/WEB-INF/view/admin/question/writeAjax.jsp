<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="/question_pool/js/common.js"></script>
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
	$(function() {
		$(".example").click(function() {
			if ($(this).prop("checked")) {
				var idx = $(this).parent().parent().find(".example").index(this);
				$(this).parent().parent().find(".example").prop("checked",false);
				$(this).parent().parent().find(".example").eq(idx).prop("checked",true);
			}
		})
	})
</script>
</head>
<body> 
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
			<th scope="row"><label for="">참조문제</label></th>
			<td colspan="10">
				<textarea id="question_content" name="question_content" rows="3" class="w100" title="문제를 입력해주세요"></textarea>
			</td>
		</tr>
		<div id="writeArea"></div>
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
	</tbody>
</table>
</body>
</html>