<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 탈퇴</title>
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

	function del(){
		if ($("#user_pwd").val() == '') {
			alert("비밀번호를 입력하세요");
			$("#user_pwd").focus();
			return;
		}
		if ($("#user_pwd").val() != $("#pw_check").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			return;
		} else{
			var chk = confirm("정말 탈퇴하시겠습니까?");				 
			$.ajax({
			    url : "myinfoDelete.do",                    
			    data: {user_no : ${userInfo.user_no}}, 	    
	            success: function(data){
					if (data == '1') {
	                   	alert("탈퇴 완료");
	                    location.href='index.do';
	                }
	                else{
	                    alert("탈퇴 실패");
	                }
	            }
			});
		}
	}
	
</script>
</head>
<body>
    <body>
    	<input type="hidden" name="user_no" value="${userInfo.user_no}">
            <div class="sub">
                <div class="size">
                    <h3 class="sub_title">회원 탈퇴</h3>
                    <form name="frm" id="frm" action="" method="post">                   
                    <table class="board_write">
                        <caption>회원 탈퇴</caption>
                        <colgroup>
                            <col width="20%" />
                            <col width="*" />
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>*비밀번호</th>
                            <td><input type="password" name="user_pwd" id="user_pwd" style="float:left;"></td>
                        </tr>
                        <tr>
                            <th>*비밀번호<span>확인</span></th>
                            <td><input type="password" name="pw_check" id="pw_check" style="float:left;"></td>
                        </tr>
                        </tbody>
                    </table>
                    </form>
                    <div class="btnSet clear">
                    <div><a href="javascript:del();" class="btn"><strong>확인</strong></a> <a href="javascript:;" class="btn" onclick="history.back();">취소</a></div>                    
                    </div>
                </div>
            </div>
    </body>
</body>
</html>