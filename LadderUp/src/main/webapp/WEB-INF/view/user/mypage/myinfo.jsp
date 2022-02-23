<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보 수정</title>
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
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
	<script>
    function zipcode() {
        new daum.Postcode({
            oncomplete: function(data) {
            	var cbox = document.getElementById("user_pwdSel");
            	var tmp = $('#user_pwdSel').prop('checked');
            	console.log($("#user_pwdSel").val());
            	console.log(cbox);
            	console.log(tmp);
                var addr = ''; 
                var extraAddr = ''; 

                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    addr += extraAddr; 
                
                }

                document.getElementById('zipcode').value = data.zonecode; 
                document.getElementById("addr1").value = addr; 
                document.getElementById("addr2").focus();
            }
        }).open();
    }
    
    
	function goSave() {
		var hash = CryptoJS.MD5($("#user_pwd").val());
		var reg = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{1,50}).{10,50}$/;
    	if($('[name=user_pwdSel]').prop('checked')){
			if ('${userInfo.user_pwd}' != hash) {
		    		alert("비밀번호를 확인해 주세요.");
		    		$("#user_pwd").focus();
		    		return;
		    	}else if($("#user_rePwd").val() != $("#user_rePwd2").val() || $("#user_rePwd").val() == '' ){
						alert('새 비밀번호를 확인해 주세요.')
						return;
				}else if( !reg.test($("#user_rePwd").val()) ) {
			    	    alert("비밀번호는 숫자,문자,특수문자를 조합으로 10자이상 입력해 주세요.");
			    	    $("#user_rePwd").focus();
			    	    return;
			    	}
				}
			
    	var data = $("#frm").serialize();
    	$("#frm").submit();		
    }
	
     
	function enableTxt() {
		  document.getElementById("user_pwd").readOnly = false;
		  document.frm.user_pwd.focus();
		}

    </script>
</head>
    <body>
    	<input type="hidden" name="user_no" value="${userInfo.user_no}">
            <div class="sub" id="sub">
                <div class="size">
                    <h3 class="sub_title">내 정보 보기</h3>
                    <form name="frm" id="frm" action="myinfoUpdate.do" method="post">     
                    <input type="hidden" id="user_no" name="user_no" value="${userInfo.user_no}">
                  	<input type="hidden" id="user_email" name="user_email" value="${userInfo.user_email}">              
                    <table class="board_write">
                        <caption>내 정보 수정</caption>
                        <colgroup>
                            <col width="20%" />
                            <col width="*" />
                        </colgroup>
                        <tbody>                    
                            <tr>
                                <th>이메일</th>
                                <td>
                                    ${userInfo.user_email }
                                </td>
                            </tr>
                            <tr>
                                <th>현재 비밀번호</th>
                                <td>
                                	<input type="password" name="user_pwd" id="user_pwd" value=""style="float:left;">      
                                	&nbsp비밀번호 변경&nbsp<input type="checkbox" name="user_pwdSel" id="user_pwdSel" value="1" />           
                           		</td>
                           	</tr>
                           	<tr>
                           		<th>새 비밀번호</th>
                                <td>
                                	<input type="password" name="user_rePwd" id="user_rePwd" value=""style="float:left;">                        		
                           		</td>
                            </tr>
                            <tr>
                           		<th>새 비밀번호 확인</th>
                                <td>
                                	<input type="password" name="user_rePwd2" id="user_rePwd2" value=""style="float:left;">                        		
                           		</td>
                            </tr>
                            <tr>
                                <th>*이름</th>
                                <td>${userInfo.user_name } </td>
                            </tr>
                             <tr>
                                <th>*별명</th>
                                <td><input type="text" name="user_nick" id="user_nick" value="${userInfo.user_nick }"style="float:left;"> </td>
                            </tr>
                            <tr>
                                <th>*휴대폰 번호</th>
                                <td>
                                    <input type="text" name="user_tel" id="user_tel" value="${userInfo.user_tel }"  maxlength="15" style="float:left;"><span class="ptxt"> 숫자만 입력해 주세요.</span>
                                </td>
                            </tr>
                            <tr>
                                <th rowspan="3">주소</th>
                                <td> 
                                	<input type="text" name="zipcode" id="zipcode" value="${userInfo.zipcode }" class="inNextBtn" style="float:left;">
                                   <a href="javascript:zipcode();" class="btn bgGray" style="float:left; width:auto; clear:none;">우편번호</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="addr1" id="addr1" value="${userInfo.addr1 }" style="float:left;width:500px;">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="addr2" id="addr2" value="${userInfo.addr2 }" style="float:left;width:500px;">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </form>
                    <div class="btnSet clear">
                        <div><a href="javascript:goSave();" class="btn"><strong>수정</strong></a>                     
                        <a href="mydelchk.do" class="btn">회원탈퇴</a></div>
                    </div>
                </div>
            </div>
    </body>
</html>