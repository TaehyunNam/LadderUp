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
		alert("아이디를 입력하세요");
		$("#admin_email").focus();
		return;
	}
	var con = true;
	$.ajax({
		url : 'adminEmailCheck.do',
		data : {
			email : $("#admin_email").val()
		},
		async:false,
		success:function(aaa) {
			if (aaa.trim() == '1') {
				alert('중복된 아이디입니다. 다른 아이디를 입력해 주세요');
				$("#admin_email").val("");
				$("#admin_email").focus();
				con = false;
			}
		}
	})
	if (con == false) return;
	    	if ($("#admin_pwd").val().trim() == '') {
	    		alert('비밀번호를 입력해 주세요');
	    		$("#admin_pwd").focus();
	    		return;
	    	}
	    	var reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
	    	if( !reg.test($("#admin_pwd").val()) ) {
	    	    alert("비밀번호는 문자+숫자 조합으로 8자이상 입력해 주세요.");
	    	    //$("#pwd").val("");
	    	    $("#admin_pwd").focus();
	    	    return;
	    	}	
	    	if ($("#admin_name").val().trim() == '') {
	    		alert('이름을 입력해 주세요');
	    		$("#admin_name").focus();
	    		return;
	    	}
			$("#frm").submit();		
}

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
					<h2>관리자 등록</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${totCount }개</strong>  |  ${adminVo.page }/${totPage }페이지</span></p>
							<form name="frm" id="frm" action="insert.do" method="post">
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
			                    	<tr class="none">
				                    	<td>${data.admin_no }</td>
    									<td>
											<input type="text" style="border: none; width:200px; border:1px solid #c6cdd8;" id="admin_email" name="admin_email" value="${data.admin_email }">	
										
										</td>
										<td class="txt_l">
											<input type="password" style="border: none; width:200px; border:1px solid #c6cdd8;" id="admin_pwd" name="admin_pwd" value="${data.admin_pwd }">	
										</td>	
										<td>
    										<input type="text" style="border: none; width:200px; border:1px solid #c6cdd8;" id="admin_name" name="admin_name" value="${data.admin_name }">	
										</td>					       
			                           <td class="date"><fmt:formatDate value="${data.admin_regdate }" pattern="yyyy-MM-dd"/></td>			                                                              
			                           </tr>
								</tbody>
							</table>
								<input type="hidden" name="cmd" value="write.do"/>
								<input type="hidden" name="checkEmail" id="checkEmail" value="0"/>
							
							</form>
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