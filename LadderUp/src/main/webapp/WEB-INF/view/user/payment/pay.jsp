<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type=	"text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<script>
function product(pname ,pay, product_no){
	if(${userInfo.user_grade} == 1 ){
		alert("남은기간을 모두 이용하고 결제해주세요. 감사합니다")
	}else {
		//가맹점 식별코드 due_date
		IMP.init('imp01855034');
		IMP.request_pay({
		    pg : 'nice',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : pname, //결제창에서 보여질 이름
		    amount : pay, //실제 결제되는 가격
		    buyer_email : '${data.user_email}',
		    buyer_name : '${data.user_name}', 
		    buyer_tel : '${data.user_tel}',
		}, function(rsp) {
	   		 var msg = '';
		    if ( rsp.success ) {
			    	$.ajax({
			    		 type: 'POST',
						url : 'payInsert.do',
						data : {
							pay_id : rsp.imp_uid,
							merchant_id : rsp.merchant_uid,
							user_no : ${data.user_no},
							product_no : product_no, 
							user_email : "${userInfo.user_email}",
							refund : 1
						},
			    	})
					msg += pname+' 결제되었습니다 감사합니다.'
		    } else {
		         msg += rsp.error_msg+ '  다시 시도해주세요.';
		    }
	        alert(msg); 
		});
	}
}

function Expr(product_no){
			if(${userInfo.user_exp} == 1){
				alert('체험권을 사용하고 있습니다.')
			}else if(${userInfo.user_exp} == 2){
				alert('이미 체험권을 사용하셨습니다. 결제 후 이용해주세요.')
			}
			else{
				console.log(${data.product_no})
				var msg = '';
				if (confirm("일일 체험권을 사용하시겠습니까??") == true) {
			    	$.ajax({
			    		 type: 'POST',
						url : 'payInsert.do',
						data : {
							user_no : ${data.user_no},
							product_no : product_no, 
							user_email : "${userInfo.user_email}",
							refund : 99
							},
						success:function(data){
							document.location.href = document.location.href;
							document.location.reload();
							history.go(0);
						}
			    	})
			    	msg += '체험권 사용이 시작되었습니다.'
			    } else {
			         msg += '취소되었습니다.';
			    }
		        alert(msg);	
			}
		}

</script>

<style>
#pro{
  float: left;
  margin-right: 60px;
  background-color: #fffafa;
}
p, h3, h1{
	font-family:굴림체;
}
</style>
<body> 
<div>
<div>
		<h1 style="color:#808080">안녕하세요 저희 Ladder Up를 이용해주셔서 감사합니다.</h1>
		<h3 style="color:#808080">저희 사이트는 편입을 준비하는 대학생 여러분들을 위해 조금이라도 도움을 드리고자 개설하게 되었습니다.
		감사합니다.</h3>
		<br><br><br>
</div>
	<div id="pro" align="center" style="width:30%; height: 250px; border: 1px solid orange; border-radius: 2em;">
		<h2>One Month Product</h2>
		<p> 한달동안 메모장, 사전, <br>오답노트, 랜덤모의고사 등의 <br>추가 기능들을 사용할수 있습니다.
		</p>
		<br>
		<input type="button" value="One Month Product 구매하기" onclick="product('One Month',100, 1)" style="background-color: #ffe6e6;"/>
	</div>
	
	<div id="pro" align="center" style="width:30%; height: 250px; border: 1px solid orange; border-radius: 2em;">
	<h2>three Month Product</h2>
	<p> 3달동안 메모장, 사전, <br>오답노트, 랜덤모의고사 등의 <br>추가 기능들을 사용할수 있습니다.
	</p>
	<br>
	<input type="button" value="three Month Product 구매하기" onclick="product('three Month',200, 2)" style="background-color: #ffe6e6;"/>
	</div>
	<br><br><br><br><br>
</div> 
	<div id="pro" align="center" style="width:13%; height: 130px; border: 1px solid orange; border-radius: 2em;">
		<p> 무료1일권
		</p>
		<input type="button" value="Daily Experience" onclick="Expr(99)" style="background-color: #ffe6e6;" />
		</div>
	<br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br>
	<p style="color:red">정기결제 특성상 환불은 특별한 사유가 있을시 관리자 확인후 관리자에 의해 환불됨을 알려드립니다.</p>
	

</body>
</html>
