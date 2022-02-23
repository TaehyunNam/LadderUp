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
<input type="hidden" name="user_no" value="${data.user_no}">

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
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${totCount }개</strong>  |  ${adminVo.page }/${totPage }페이지</span></p>							
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
                    <colgroup>
                        <col width="20%" />
                        <col width="*" />
                    </colgroup>
                    <tbody>
                    	<tr>
                            <td>번호</td>
                            <td>${data.user_no }
                            </td>
                        </tr>
                        <tr>
                            <td>아이디</td>
                            <td>${data.user_email }
                            </td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td>${data.user_pwd }
                        </tr>

                        <tr>
                            <td>이름</td>
                            <td>${data.user_name}
                        </tr>
                        <tr>
                            <td>닉네임</td>
                            <td>${data.user_nick }
                        </tr>
                        <tr>
                            <td>전화번호</td>
                            <td>${data.user_tel }
                            </td>
                        </tr>
                        <tr>
                        	<td>가입일</td>
			                <td class="date"><fmt:formatDate value="${data.user_regdate }" pattern="yyyy-MM-dd"/></td>			                                                              
						</tr>
                        <tr>
                        	<td>우편번호</td>
                        	<td>${data.zipcode}
                        	</td>
                        </tr>
                        <tr>
                        	<td>주소1</td>
                        	<td>${data.addr1 }
                        	</td>
                        </tr>
                        <tr>
	                        <td>주소2</td>
                        	<td>${data.addr2 }
                        	</td>
                        </tr>
                    </tbody>
                </table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="index.do"><strong>목록</strong></a> 
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" href="edit.do?user_no=${data.user_no }"><strong>수정</strong></a>
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