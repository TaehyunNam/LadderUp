<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">	
function goSave() {
	if ($("#admin_email").val() == '') {
		alert("아이디을 입력하세요");
		$("#admin_email").focus();
		return;
	}
	var data = $("#frm").serialize();
	$("#frm").submit();		
}
$(function(){
	$("#frm").ajaxForm({
		url:'update.do',
		success:function(res) {
			alert('정상적으로 수정되었습니다.');
			location.href='view.do?admin_no=${data.admin_no}';
		}
	});
});
</script>
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
</head>
<body> 
<div id="wrap">
<input type="hidden" name="admin_no" value="${data.admin_no}">

	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>관리자 정보 [수정]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${totCount }개</strong>  |  ${adminVo.page }/${totPage }페이지</span></p>
							<form name="frm" id="frm" action="update.do" method="post">
							<input type="hidden" name=admin_no value="${data.admin_no }">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w4" />
									<col class="w10" />
									<col class="w10" />
									<col class="w10" />
									<col class="w10" />									
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">*아이디</th> 
										<th scope="col">*비밀번호</th> 
										<th scope="col">*이름</th>
										<th scope="col">등록일</th>		 
									</tr>
								</thead>
								<tbody>
			                            <tr>			                                
			                                <td>${data.admin_no }</td>
											<td>
												<input type="text" style="border: none; background: transparent; text-align:center; width:200px;" id="admin_email" name="admin_email" title="${data.admin_email }" value="${data.admin_email }">	
											</td>
											<td class="txt_l">
												<input type="text" style="border: none; background: transparent; text-align:center; width:200px;" id="admin_pwd" name="admin_pwd" title="${data.admin_pwd }" value="${data.admin_pwd }">	
											</td>	
											<td>
												<input type="text" style="border: none; background: transparent; text-align:center; width:200px;" id="admin_name" name="admin_name" title="${data.admin_name }" value="${data.admin_name }">	
											</td>					       
			                                <td class="date"><fmt:formatDate value="${data.admin_regdate }" pattern="yyyy-MM-dd"/></td>			                                                              
			                           </tr>
								</tbody>
							</table>
							</form>
							<input type="hidden" name="cmd" value="write" />							
							<div class="btn">
								<div class="btnRight">
									<a class="btns" href="javascript:goSave();"><strong>저장</strong></a>
								</div>
							</div>
							<!--//btn-->
						</div>
						<!-- //blist -->
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