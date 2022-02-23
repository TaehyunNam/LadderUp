<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">	
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
					<h2>관리자 정보 [상세]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${totCount }개</strong>  |  ${adminVo.page }/${totPage }페이지</span></p>							
							<form name="frm" id="frm" action="process.do" method="post">
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
										<th scope="col">아이디</th> 
										<th scope="col">비밀번호</th> 
										<th scope="col">이름</th>
										<th scope="col">등록일</th>		 
									</tr>
								</thead>
								<tbody>
			                            <tr>			                                
			                                <td>${data.admin_no }</td>
			                                <td class="txt_l">
			                                   ${data.admin_email }
			                                </td>
			                                <td>${data.admin_pwd } </td>
			                                <td class="writer">
			                                    ${data.admin_name }
			                                </td>			       
			                                <td class="date"><fmt:formatDate value="${data.admin_regdate }" pattern="yyyy-MM-dd"/></td>			                                                              
			                           </tr>
			                             
								</tbody>
							</table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="index.do"><strong>목록</strong></a> 
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" href="edit.do?admin_no=${data.admin_no }"><strong>수정</strong></a>
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