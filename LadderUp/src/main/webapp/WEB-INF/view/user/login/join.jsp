<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
        <link rel="stylesheet" href="/question_pool/css/user/userJoin/reset.css"/>
    <link rel="stylesheet" href="/question_pool/css/user/userJoin/common.css"/>
    <link rel="stylesheet" href="/question_pool/css/user/userJoin/contents.css"/>
    <script>
    var code =String(Math.random());
    	$(function(){
    		$("#emailDuplicate").click(function(){
    			if ($("#user_email").val().trim() == '') {
    				alert('이메일을 입력해 주세요');
    				$("#user_email").focus();
    			} else {
    				$.ajax({
    					url : 'emailDuplicate.do',
    					data : {
    						email : $("#user_email").val()
    					},
    					async:false,
    					success:function(aaa) {
    						if (aaa.trim() == '1') {
    							alert('중복된 이메일입니다. 다른 이메일을 입력해 주세요');
    							$("#user_email").val("");
    							$("#user_email").focus();
    						}else {
    							alert("이메일이 발송되었습니다. 최대 1~2분 소요됩니다.");
    							$.ajax({
    		    					url : 'userEmailCheck.do',
    		    					data : {
    		    						email : $("#user_email").val()
    		    					},
    		    					success:function(data){
    		    						code = data;
    		    					}
    							})
    						}
    					}
    				})
    			}
    		});
    	})
        	$(function(){
    		$('#confirmbtm').click(function(){
    			if($('#confirm').val().trim() != code){
    				alert('인증번호를 확인해 주세요');
    				$("#confirm").focus();
    			} else {
    				alert('인증되었습니다.');
    			}
    		});
    	})
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function zipcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    addr += extraAddr; // 하나의 변수에 합치기
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    //document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('zipcode').value = data.zonecode; // 우편번호
	                document.getElementById("addr1").value = addr; // 주소
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("addr2").focus();
	            }
	        }).open();
	    }
	    
	    function goSave() {
	    	if ($("#user_email").val().trim() == "") {
	    		alert('이메일을 입력해 주세요');
	    		$("#user_email").focus();
	    		return;
	    	}
	    	var con = true;
	    	$.ajax({
				url : 'emailCheck.do',
				data : {
					email : $("#user_email").val()
				},
				async:false,
				success:function(aaa) {
					if (aaa.trim() == '1') {
						alert('중복된 이메일입니다. 다른 이메일을 입력해 주세요');
						$("#user_email").val("");
						$("#user_email").focus();
						con = false;
					}
				}
			})
			if($('#confirm').val().trim() != code){
				alert('인증번호를 확인해 주세요');
				$("#confirm").focus();
				con = false;
			}
	    	if (con == false) return;
	    	if ($("#user_pwd").val().trim() == '') {
	    		alert('비밀번호를 입력해 주세요');
	    		$("#user_pwd").focus();
	    		return;
	    	}
	    	var reg = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{1,50}).{10,50}$/;
	    	if( !reg.test($("#user_pwd").val()) ) {
	    	    alert("비밀번호는 숫자,문자,특수문자를 조합으로 10자이상 입력해 주세요.");
	    	    //$("#pwd").val("");
	    	    $("#user_pwd").focus();
	    	    return;
	    	}
	    	if ($("#user_pwd").val() != $("#pw_check").val()) {
	    		alert("비밀번호가 일치하지 않습니다.");
	    		return;
	    	}
	    	if ($("#user_name").val().trim() == '') {
	    		alert('이름을 입력해 주세요');
	    		$("#user_name").focus();
	    		return;
	    	}
	     	if ($("#user_nick").val().trim() == '') {
	    		alert('별명을 입력해 주세요');
	    		$("#user_nick").focus();
	    		return;
	    	}
	     	var telno = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	    	if( !telno.test($("#user_tel").val()) ) {
	    	    alert("올바른 전화번호가 아닙니다.");
	    	    $("#user_tel").focus();
	    	    return;
	    	}
	    	if ($("#user_tel").val().trim() == '') {
	    		alert('휴대폰번호를 입력해 주세요');
	    		$("#user_tel").focus();
	    		return;
	    	}
	    	if ($("#zipcode").val().trim() == '') {
	    		alert('주소를 입력해 주세요');
	    		$("#zipcode").focus();
	    		return;
	    	}
	    	if ($("#addr1").val().trim() == '') {
	    		alert('주소를 입력해 주세요');
	    		$("#addr1").focus();
	    		return;
	    	}
	    	if ($("#addr2").val().trim() == '') {
	    		alert('상세주소를 입력해 주세요');
	    		$("#addr2").focus();
	    		return;
	    	}
	    	$("#frm").submit();
	    }
	    
	    function pwdco() {
	    	var reg = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{1,50}).{10,50}$/;
	    	if( !reg.test($("#user_pwd").val()) ) {
	    	    alert("비밀번호는 숫자,문자,특수문자를 조합으로 10자이상 입력해 주세요.");
	    	    //$("#pwd").val("");
	    	    $("#user_pwd").focus();
	    	    return;
	    	}else{
	    		alert("사용가능한 비밀번호입니다.")
	    	}
	    }
	</script>
	<style>
	</style>
</head>
<body>
    <div class="wrap">
        <div class="sub">
            <div class="size">
         	   <div id = "imgdiv" style="text-align: center; font-size:33px;"><a href="/question_pool/user/index.do"><img src="../img/user/mainLogo.png"  height="10%" width="10%" style="margin-left: auto; margin-right: auto;">
                Ladder Up 회원가입</a></div>  
                <form name="frm" id="frm" action="insert.do" method="post"> 
                <table class="board_write">
                    <caption>회원가입</caption>
                    <colgroup>
                        <col width="20%" />
                        <col width="*" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>๑이메일๑</th>
                            <td>
                                <input type="text" name="user_email" id="user_email" class="inNextBtn" style="float:left;">
                                <span class="emailDuplicate"><a href="javascript:;" id="emailDuplicate" class="btn bgGray" style="float:left; width:auto; clear:none;">메일인증</a></span>
                            </td>
                        </tr>
                         <tr>
                            <th>๑인증번호๑</th>
                            <td>
                                <input type="text" name="confirm" id="confirm" class="inNextBtn" style="float:left;">
                                <span class="confirmbtm"><a href="javascript:;" id="confirmbtm" class="btn bgGray" style="float:left; width:auto; clear:none;"	>확인</a></span>
                            </td>
                        </tr>
                        <tr>
                            <th>๑비밀번호๑</th>
                            <td><input type="password" name="user_pwd" id="user_pwd" style="float:left;"> <span class="ptxt"></span> 
                            <span class="pwdco"><a href="javascript:pwdco();" id="pwdco" class="btn bgGray" style="float:left; width:auto; clear:none;">비밀번호 확인</a></span>
                            </td>
                        </tr>
                        <tr>
                            <th>๑비밀번호<span>확인๑</span></th>
                            <td><input type="password" name="pw_check" id="pw_check" style="float:left;"></td>
                        </tr>
                        <tr>
                            <th>๑이름๑</th>
                            <td><input type="text" name="user_name" id="user_name" style="float:left;"> </td>
                        </tr>
                         <tr>
                            <th>๑별명๑</th>
                            <td><input type="text" name="user_nick" id="user_nick" style="float:left;"> </td>
                        </tr>
                        <tr>
                            <th>๑휴대폰 번호๑</th>
                            <td>
                                <input type="text" name="user_tel" id="user_tel" value=""  maxlength="15" style="float:left;"><span class="ptxt"></span>
                            </td>
                        </tr>
                        <tr>
                        	<th rowspan="3">๑주소๑</th>
                        	<td>
                        		<input type="text" name="zipcode" id="zipcode" class="inNextBtn" style="float:left;">
                                <span class="email_check"><a href="javascript:zipcode();" class="btn bgGray" style="float:left; width:auto; clear:none;">우편번호</a></span>
                        	</td>
                        </tr>
                        <tr>
                        	<td>
                        		<input type="text" name="addr1" id="addr1" style="float:left;width:500px;">
                        	</td>
                        </tr>
                        <tr>
                        	<td>
                        		<input type="text" name="addr2" id="addr2" style="float:left;width:500px;">
                        	</td>
                        </tr>
                    </tbody>
                </table>
                        <input type="hidden" name="cmd" value="write.do"/>
                        <input type="hidden" name="checkEmail" id="checkEmail" value="0"/>
                </form>
                <!-- //write--->
                <div class="btnSet clear">
                    <div><a href="javascript:;" class="btn" onclick="goSave();">가입</a> <a href="javascript:;" class="btn" onclick="history.back();">취소</a></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>