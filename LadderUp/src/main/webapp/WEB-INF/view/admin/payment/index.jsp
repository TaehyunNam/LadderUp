<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">	
/*
	function cancelPay() {
		  jQuery.ajax({
		    "url": "cancelPay.do", // 예: http://www.myservice.com/payments/cancel
		    "type": "POST",
		    "contentType": "application/json",
		    "data": JSON.stringify({
		      "merchant_uid": "${vo.merchant_id }", // 예: ORD20180131-0000011
		      "cancel_request_amount": "${vo.price }", // 환불금액
		      "reason": "${vo.refund }" // 환불사유
		    }),
		    "dataType": "json"
		    alert('환불되었습니다')
		  });
		}
	
	
			axios({
			    url: "https://api.iamport.kr/users/getToken",
			    method: "post", // POST method
			    headers: { "Content-Type": "application/json" }, // "Content-Type": "application/json"
			    data: {
			      imp_key: "0391923408901621", // REST API키
			      imp_secret: "8b803e28929cfbc3c8fc9f38d38d40cd3e01c5f0b8b05f51f1cce323c08dbc9496fe088c6271b856" // REST API Secret
			    }
			  });
			  axios({
				    url: "https://api.iamport.kr/payments/imp_448280090638",
				    method: "get", // GET method
				    headers: {
				      "Content-Type": "application/json", // "Content-Type": "application/json"
				      "Authorization": "Bearer a9ace025c90c0da2161075da6ddd3492a2fca776" // 발행된 액세스 토큰
				    }
				  });
		 */
		 
		 function cancelPay(){
					$.ajax({
						type : 'GET',
						url : 'cancelPay.do',
						data : {
							user_no : a,
							admin_no : ${adminInfo.admin_no}
						},
						async : false,
						success : function(res) {
							alert("환불되었습니다.")
							document.location.href = document.location.href;
							document.location.reload();
							history.go(0);
					
					}
				})
		}
		 

  	function refundSee(){
  		$("#searchForm").submit();
  	}

</script>
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
</head>
<body> 
<div id="wrap">
<input type="hidden" name="admin_no" value="${adminInfo.admin_no}">

	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>결제 관리</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">					
								<form name="searchForm" id="searchForm" action="pay.do"  method="get" >
									<div class="search" style="float: right;">
									<p><span style="float: left;"><strong>총 ${totCount }개</strong>  |  ${adminVo.page }/${totPage }페이지</span></p>		
										<select name="refund" onchange="refundSee()"style="float: right;">
											<option value="0"<c:if test="${param.refund == '0'}">selected</c:if>>전체 보기</option>
											<option value="99"<c:if test="${param.refund == '99'}">selected</c:if>>체험권</option>
											<option value="1"<c:if test="${param.refund == '1'}">selected</c:if>>사용중</option>
											<option value="100"<c:if test="${param.refund == '100'}">selected</c:if>>사용 만료</option>
											<option value="2"<c:if test="${param.refund == '2'}">selected</c:if>>환불 요청</option>
											<option value="3"<c:if test="${param.refund == '3'}">selected</c:if>>환불 완료</option>
											<option value="4"<c:if test="${param.refund == '4'}">selected</c:if>>환불 거절</option>
										</select>
									</div>
								</form>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="">
								<colgroup>
									<col class="w10" />
									<col class="w18" />
									<col class="w16" />
									<col class="w10" />
							 		<col class="w18" />
									<col class="w17" />									
								</colgroup>
								<thead>
									<tr>
										<th scope="col">이름</th> 
										<th scope="col">이메일</th> 
										<th scope="col">상품명</th>
										<th scope="col">상품 금액</th>		 
										<th scope="col">결제 날짜</th>		 
										<th scope="col">환불 사유</th> 		 
										<th scope="col">환불 	요청</th>		 
									</tr>
								</thead>
								<tbody>
									
										<c:forEach var="vo" items="${data}">                                  
			                            <tr>
			                                
			                                <td>${vo.user_name }</td>
			                                <td>${vo.user_email }</td>
			                                <td>${vo.category }</td>
			                                <td>${vo.price }</td>
			                                <td>${vo.pay_date }</td>
		                              	    <c:if test="${vo.refund_reason eq 0}">
						                    <td>  </td>
						                    </c:if>
						                    <c:if test="${vo.refund_reason eq 1}">
						                    <td>실수로 잘못 결제함</td>
						                    </c:if>
						                    <c:if test="${vo.refund_reason eq 2}">
						                    <td>다른 사이트 이용</td>
						                    </c:if>
						                    <c:if test="${vo.refund_reason eq 3}">
						                    <td>금액이 너무 비쌈</td>
						                    </c:if>
						                    <c:if test="${vo.refund_reason eq 4}">
						                    <td>단순 변심</td>
						                    </c:if>
		                                 	<c:if test="${vo.refund eq 1}">
						                    <td>사용중</td>  
						                    </c:if>
						                    <c:if test="${vo.refund eq 100}">
						                    <td>사용 만료</td> 
						                    </c:if>
						                    <c:if test="${vo.refund eq 2}">
						                 	<td>
						                   <input class="submit" type="submit" value="환불 승인" id="cancelPay" onclick="location.href='cancelPay.do?user_no=${vo.user_no }&admin_no=${adminInfo.admin_no}'">&nbsp&nbsp
						                   <input class="submit" type="submit" value="환불 거절" id="cancelPay2" onclick="location.href='cancelPay2.do?user_no=${vo.user_no }&admin_no=${adminInfo.admin_no}'" >
						                   </td>
						                    </c:if>
						                    <c:if test="${vo.refund eq 3}">
						                    <td>환불 승인</td> 
						                    </c:if>
						                    <c:if test="${vo.refund eq 4}">
						                    <td>환불 거절</td> 
						                    </c:if>
						                    <c:if test="${vo.refund eq 99}">
						                    <td>체험권</td> 
						                    </c:if>
			                           </tr>
			                            </c:forEach>
			                                
								</tbody>
							</table>
							

							<!--//btn-->
							<!-- 페이징 처리 -->
							${pageArea }
						
							<!-- //search --> 
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