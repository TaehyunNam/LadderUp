<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	function reSubmit() {	
		console.log('${userInfo.user_exp}')
		if('${userInfo.user_exp}' == 1){
			alert('체험권은 환불이 불가능합니다.');
			return;
		}else{
			if('${userInfo.refund}' == 0){
				alert('결제 후 이용해주세요.');
				return;
			}
			if('${userInfo.refund}' == 2){
				alert('환불요청이 되어있습니다. 관리자에게 문의하세요');
				return;
			}
			if('${userInfo.refund}' == 3){
				alert('이미 환불 받으셨습니다.');
				return;
			}
			if('${userInfo.refund}' == 4){
				alert('환불이 거절되었습니다.(관리자에게 문의하세요.)');
				return;
			}
			if('${userInfo.refund}' == 99){
				alert('체험권은 환불이 불가능합니다.');
				return;
			}
		}
		$("#frm").submit();
	}
</script>
<body>
		<h1>Ladder Up 환불규정</h1>
		<p>안녕하세요 Ladder Up은 의 구매품목은 결제와 동시에 여러 기능을 사용할수 있음으로<br>
			환불 사유를 꼭 확인해 주시고<br>
			환불 여부는 관리자에 의해 결정됨을 알려드립니다.
		</p>
		<h3>동의하시면 환불요청을 진행해주세요.</h3>
		<form name="frm" id="frm" action="refundUpdate.do" method="post">
		<input type="hidden" id="user_no" name="user_no" value="${userInfo.user_no}">
		<input type="hidden" id="user_email" name="user_email" value="${userInfo.user_email}">
		<select name="refund_reason">
		    <option value="1">실수로 잘못 결제함</option>
		    <option value="2">다른 사이트 이용</option>
		    <option value="3">금액이 너무 비쌈</option>
		    <option value="4">단순 변심</option>
		</select>
		<br>
		<br>
		<br>
		</form>
		<input class="refundbtn" type="button" value="환불 요청" onclick="reSubmit();">
		<br>
		<br>		
		<p style="color:red; font-size:6px;"><br>			
			문의사항이나 불편사항이 있을시 010-0000-1234로 연락주시기 바랍니다.
		</p>
</body>
</html>