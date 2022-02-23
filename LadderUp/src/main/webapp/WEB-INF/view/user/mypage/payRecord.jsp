<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 비밀번호 변경</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <link rel="stylesheet" href="/question_pool/css/user/userJoin/reset.css"/>
    <link rel="stylesheet" href="/question_pool/css/user/userJoin/common.css"/>
    <link rel="stylesheet" href="/question_pool/css/user/userJoin/contents.css"/>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	$(function(){
		$('#sub').ready(function(){
			if('${userInfo.product_no}'== 0){
				alert('첫 결제 후 이용해주세요.')
				history.back();
			}
		})
	})
 	function rePay(a){
		if(a == 1 && '${userInfo.user_grade}' == 1){
			var aaa = 30 - '${userInfo.due_date}'
			 document.write(aaa+'일 남았습니다.' + '(남은기간 모두 소비시. 자동해지됩니다.)')
			return
		}else if(a == 2 && '${userInfo.user_grade}' == 1) {
			var aaa = 90 - '${userInfo.due_date}'
			 document.write(aaa+'일 남았습니다.' + '(남은기간 모두 소비시. 자동해지됩니다.)')
			return
		}
		else if(a == 99 && '${userInfo.user_grade}' == 1) {
			document.write('체험권을 사용중입니다. 사용을 원하시면 정기권을 구매해주세요.')
			return
		}else if(a == 99 && '${userInfo.user_grade}' == 2) {
			document.write('체험권 사용이 만료되었습니다.(결제 후 이용해주세요)')
			return
		}else if('${userInfo.user_grade}' == 0) {
			document.write('결제 후 확인해주세요.')
			return
		}else if('${userInfo.user_grade}' == 2) {
			document.write('사용기간이 만료되었습니다.')
			return
		}
 		alert('결제기간 오류입니다. 관리자에게 문의해주세요.')
		return false
 	}
	
    </script>
</head>
    <body>
    	<input type="hidden" name="user_no" value="${userInfo.user_no}">
            <div class="sub" id='sub'>
            	<c:if test="${userInfo.product_no ne 0}">
	                <div class="size">
	                    <h3 class="sub_title">환영합니다. ${userInfo.user_name} 님</h3>
	                    <form name="frm" id="frm" action="myinfoUpdate.do" method="post">                   
	                    <table class="board_write">
	                        <caption>My결제기록</caption>
	                        <colgroup>
	                            <col width="20%" />
	                            <col width="*" />
	                        </colgroup>
	                        <tbody>
	                        	<tr>
	                                <th>이용 기간</th>
	                                <c:if test="${userInfo.user_grade eq 1}">
	                                <td> 
	                                ${userInfo.due_date}일 이용하셨습니다.
	                           		</td>
	                           		</c:if>
	                           		<c:if test="${userInfo.user_grade eq 2}">
	                                <td> 
	                                사용기간이 만료되었습니다.
	                           		</td>
	                           		</c:if>
	                           		<c:if test="${userInfo.user_grade ne 1} || ${userInfo.user_grade ne 2}">
	                                <td> 
	                                결제 후 이용해주세요.
	                           		</td>
	                           		</c:if>
	                            </tr>
	                            <tr>
	                                <th>남은 기간</th>
	                                 <c:if test="${userInfo.product_no eq 1}">
	                                 <td>
	                                 <script>
	                           	     rePay(1);
	                           		 </script>
	                           		 </td>
	                           		</c:if>
	                           		<c:if test="${userInfo.product_no eq 2}">
	                                 <td>
	                                 <script>
	                           	     rePay(2);
	                           		 </script>
	                           		 </td>
	                           		</c:if>
	                           		<c:if test="${userInfo.product_no eq 99}">
	                                 <td>
	                                 <script>
	                           	     rePay(99);
	                           		 </script>
	                           		 </td>
	                           		</c:if>
	                            </tr>
		                        <tr>
		                            <th>사용 날짜</th>
		                            <td>
		                            <fmt:formatDate value="${userInfo.pay_date}" pattern="yyyy-MM-dd"/>
		                            </td>
		                        </tr>
		                         <tr>
		                            <th>환불요청</th>
		                            <c:if test="${userInfo.refund eq 0}">
	                                 <td>
										결제정보 없음.
	                           		 </td>
	                           		</c:if>
		                            <c:if test="${userInfo.refund eq 1}">
	                                 <td>
										없음
	                           		 </td>
	                           		</c:if>
	                           	    <c:if test="${userInfo.refund eq 2}">
	                                 <td>
										환불 처리중.
	                           		 </td>
	                           		</c:if>
	                           		<c:if test="${userInfo.refund eq 3}">
	                                 <td>
										환불 완료.
	                           		 </td>
	                           		</c:if>
	                           		<c:if test="${userInfo.refund eq 4}">
	                                 <td>
										환불이 거절되었습니다. (관리자에게 문의해주세요.)
	                           		 </td>
	                           		</c:if>
	                           		
		                        </tr>
	                        </tbody>
	                    </table>
	                    </form>
	                </div>
                </c:if>
            </div>
    </body>
</html>