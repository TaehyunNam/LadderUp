<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
</head>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<script>
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
<style>
      *{
          margin: 0 auto;
          padding: 0;
          box-sizing: border-box;
        }
      .container1{
      width: 1500px;
      higth:100%;	
      text-align: center;
      margin: 0 auto;
      padding: 100px 0px 0px 0px;
      border: 0ch ;
      }
      .pay>ul>li>ul>li{
        float: left;
        list-style: none;
        border: 1px solid #000;
        text-align: center;
        width: 14.280%;
        height: 40px;
        line-height: 40px;
        background-color: #cccccc;
        color: #000;
      }
       .payUser>ul>li>ul>li{
        float: left;
        list-style: none;
        border: 1px solid #000;
        text-align: center;
        width: 14.280%;
        height: 40px; 
        line-height: 40px;
      }

      
</style>
<body>
<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
<div class="container1">

	<form name="searchForm" id="searchForm" action="pay.do"  method="get" >
			<div class="search" style="float: right;")>
				<select name="refund" onchange="refundSee()">
					<option value="0"<c:if test="${param.refund == '0'}">selected</c:if>>전체보기</option>
					<option value="1"<c:if test="${param.refund == '1'}">selected</c:if>>결제</option>
					<option value="99"<c:if test="${param.refund == '99'}">selected</c:if>>체험권</option>
					<option value="2"<c:if test="${param.refund == '2'}">selected</c:if>>환불요청</option>
					<option value="3"<c:if test="${param.refund == '3'}">selected</c:if>>환불완료</option>
					<option value="4"<c:if test="${param.refund == '4'}">selected</c:if>>환불거절</option>
				</select>
			</div>
		</form>
		<br>
   <div class="pay">  
                       
        <ul class="">
            <li>
                <ul class="">
            	    <li>이름</li>
                    <li>계정</li>
                    <li>상품</li>
                    <li>금액</li>
                    <li>결제 날짜</li>
                    <li>환불사유</li>
                    <li>환불요청</li>
                </ul>
            </li>
        </ul>
    </div>
      <div class="payUser">
        <ul class="">  
            <li>
                <ul class="">
                	<c:forEach var="vo" items="${data}">
                	<li>${vo.user_name }</li>
                    <li>${vo.user_email }</li>
                    <li>${vo.category }</li>
                    <li>${vo.price }</li>
                    <li>${vo.pay_date }</li>
                    <c:if test="${vo.refund_reason eq 0}">
                    <li>  </li>
                    </c:if>
                    <c:if test="${vo.refund_reason eq 1}">
                    <li>실수로 잘못 결제함</li>
                    </c:if>
                    <c:if test="${vo.refund_reason eq 2}">
                    <li>다른 사이트 이용</li>
                    </c:if>
                    <c:if test="${vo.refund_reason eq 3}">
                    <li>금액이 너무 비쌈</li>
                    </c:if>
                    <c:if test="${vo.refund_reason eq 4}">
                    <li>단순 변심</li>
                    </c:if>
                    <c:if test="${vo.refund eq 1}">
                    <li>사용중</li> 
                    </c:if>
                    <c:if test="${vo.refund eq 2}">
                    <li>
                    <input class="submit" type="submit" value="환불 승인" id="cancelPay" onclick="location.href='cancelPay.do?user_no=${vo.user_no }&admin_no=${adminInfo.admin_no}'" >&nbsp&nbsp
                    <input class="submit" type="submit" value="환불 거절" id="cancelPay2" onclick="location.href='cancelPay2.do?user_no=${vo.user_no }&admin_no=${adminInfo.admin_no}'" >
                    </li>
                    </c:if>
                    <c:if test="${vo.refund eq 3}">
                    <li>환불 승인</li> 
                    </c:if>
                    <c:if test="${vo.refund eq 4}">
                    <li>환불 거절</li> 
                    </c:if>
                    <c:if test="${vo.refund eq 99}">
                    <li>체험권</li> 
                    </c:if>
                    </c:forEach>
                </ul>  
                ${pageArea }
            </li>
        </ul>
    </div>
    </div>
</body>
</html>