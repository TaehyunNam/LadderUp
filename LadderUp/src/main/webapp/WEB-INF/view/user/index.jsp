<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="userUtil.*" %>
<!doctype html>
<html lang="ko">
<head>
<title>Ladder Up</title>
<%@ include file="/WEB-INF/view/user/include/headHtml.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">

$(function(){
	$('#wrap').ready(function(){
		if('${userInfo.user_grade}'== 2){
			alert('사용기간이 만료되었습니다. 다시 결제후 이용해주세요')
		}
	})
})

function directionTop() {
	$('html, body').animate({scrollTop: 0 }, 'slow');
}
var tabWidth = 120;		// 탭넓이

// iframe height 자동 조절
function calcHeight(id){
	//find the height of the internal page
	
	var the_height=
	document.getElementById(id).contentWindow.
	document.body.scrollHeight;
	
	//change the height of the iframe
	document.getElementById(id).height=
	the_height+100;
	//document.getElementById('the_iframe').scrolling = "no";
	document.getElementById(id).style.overflow = "hidden";
}

//iframe height 자동 조절(수동)
function calcHeightManual(id, m_height){
	
	//change the height of the iframe
	document.getElementById(id).height=m_height;
	
	//document.getElementById('the_iframe').scrolling = "no";
	document.getElementById(id).style.overflow = "hidden";
}

//iframe height 자동 조절(Row추가)
function calcHeightAddRow(id){
	
	var the_height=
	document.getElementById(id).contentWindow.
	document.body.scrollHeight;
	
	//change the height of the iframe
	document.getElementById(id).height=
	the_height+100;
	
	//document.getElementById('the_iframe').scrolling = "no";
	document.getElementById(id).style.overflow = "hidden";
}


$(document).ready(function(){
    $(".gnb_menu").click(function(){
    	//alert($(this).next(".gnb_submenu").css("display"));
    	if ($(this).next(".gnb_submenu").css("display") == "none") {
    		$(".gnb_submenu").slideUp();
    	}
    	$(this).addClass("imgActive");
        $(this).next(".gnb_submenu").slideToggle();
    });
    
    clickMenu('main1', 'Main', '/user/main/index.do', true);
    
    $("#pass").bind("keydown", function(e) {
		if (e.keyCode == 13) { // enter key
			login();
			return false
		}
	});
    
});

// 즐겨찾기 메뉴 toggle
function favoriteToggle() {
	$('#favoriteList').slideToggle();
}

// 메뉴클릭 tab+iframe 추가
function clickMenu(id, title, url, reload) {
	url = '<%=userUtil.Property.contextPath%>'+url;
	var nl = "";
	if (title.indexOf("<br>") < 0) {
		nl = "class=\"line1\"";
	}
	if ($("#"+id+"_tab").length == 0) {
		$(".tab > ul:last").append("<li style='width:"+tabWidth+"px;' id=\""+id+"_tab\" onclick=\"activeTab('"+id+"');\" "+nl+">"+title+"<span><img id=\""+id+"_closeImg\" src=\"/img/tab_close_on.png\" onclick=\"delTab(event,'"+id+"')\"/></span></li>");
		$(".contents:last").append("<iframe src="+url+" id=\""+id+"_ifrm\" onload=\"calcHeight('"+id+"_ifrm');\" name=\"WrittenPublic\" title=\"\" frameborder=\"0\" scrolling=\"yes\" style=\"overflow-x:hidden; width:100%; min-height:500px; \"></iframe>");
	} else {
		if (reload) $("#"+id+"_ifrm").attr("src",url);
	}
	
	activeTab(id);
}

// tab+iframe 삭제
function delTab(e, id) {
	e.stopPropagation();
	var isCurTab = $("#"+id+"_tab").hasClass("on");	// 삭제한탭이 현재활성화된 탭인지여부 확인
	var idx = $("#"+id+"_tab").index();
	$("#"+id+"_tab").remove();	// tab 삭제
	$("#"+id+"_ifrm").remove();	// iframe 삭제
	
	$(".tab > ul").css("width",($(".tab > ul > li").length*tabWidth)+"px");
	
	// 현재탭이 한개이상 존재하고, 해당id탭이 현재활성화된탭인 경우 마지막탭 활성화
	if ($(".tab > ul > li").length >= 1 && isCurTab) {
		//var tId = $(".tab > ul > li:last").attr("id");
		var tId = "";
		if (idx == 0) {
			tId = $(".tab > ul > li").eq(0).attr("id");
		} else {
			tId = $(".tab > ul > li").eq(idx-1).attr("id");
		}
		tId = tId.substr(0, tId.indexOf("_"));
		activeTab(tId);
	} 
}

//tab+iframe 삭제 자식 iframe에서 호출될때 사용
function delTabForChild(id) {
	var isCurTab = $("#"+id+"_tab").hasClass("on");	// 삭제한탭이 현재활성화된 탭인지여부 확인
	var idx = $("#"+id+"_tab").index();
	$("#"+id+"_tab").remove();	// tab 삭제
	$("#"+id+"_ifrm").remove();	// iframe 삭제
	
	$(".tab > ul").css("width",($(".tab > ul > li").length*tabWidth)+"px");
	
	// 현재탭이 한개이상 존재하고, 해당id탭이 현재활성화된탭인 경우 마지막탭 활성화
	if ($(".tab > ul > li").length >= 1 && isCurTab) {
		//var tId = $(".tab > ul > li:last").attr("id");
		var tId = "";
		if (idx == 0) {
			tId = $(".tab > ul > li").eq(0).attr("id");
		} else {
			tId = $(".tab > ul > li").eq(idx-1).attr("id");
		}
		tId = tId.substr(0, tId.indexOf("_"));
		activeTab(tId);
	} 
}

//현재탭 삭제
function delTabCur() {
	var curTabIdx;	// 현재활성화된 탭
	$(".tab > ul > li").each(function(idx, item) {
		if ($(".tab > ul > li").eq(idx).hasClass("on")) {
			curTabIdx = idx;
		}
	});
	
	var curTabId = $(".tab > ul > li").eq(curTabIdx).attr("id");
	curTabId = curTabId.substr(0, curTabId.indexOf("_"));
	delTabForChild(curTabId);
	
}

// tab 활성화(iframe 노출)
function activeTab(id) {
	$(".tab > ul > li").removeClass("on");
	$(".tab > ul > li > span > img").attr("src", "<%=userUtil.Property.contextPath%>/img/tab_close_off.png");	// tab close img 전체 off
	$(".contents > iframe").hide();
	
	$("#"+id+"_tab").addClass("on");							// tab 활성화
	$("#"+id+"_closeImg").attr("src", "<%=userUtil.Property.contextPath%>/img/tab_close_on.png");	// tab close img on
	$("#"+id+"_ifrm").show();									// iframe 노출

	$(".gnb_menu").removeClass("on");
	$(".gnb_submenu ul > li").removeClass("on");
	$("#"+id.substr(0, id.length-1)).addClass("on");	// 대메뉴 활성화
	$("#"+id+"_submenu").addClass("on");				// 소메뉴 활성화
	
	// ul 넓이를 탭갯수만큼 넓힘(좁으면 2줄로 떨어지는 문제)
	$(".tab > ul").css("width",($(".tab > ul > li").length*tabWidth)+"px");
	tabWidthCon();	// 탭영역 조절
}

// left메뉴 노출/미노출
function menuToggle() {
	var obj = $("#menuWrap").offset();
	var time = 0;	// 효과동작에 문제가 있어 0으로 고정
	if (obj.left == 0) {
		$("#menuWrap").animate({"margin-left":"-220"}, time);
		$("#contentsWrap").animate({"width":1200},time);
		$(".tabWrap").animate({"width":1200},time);
		$(".tab").animate({"width":1120},time);
	} else {
		$("#menuWrap").animate({"margin-left":"0"}, time);		
		$("#contentsWrap").animate({"width":980},time);
		$(".tabWrap").animate({"width":980},time);
		$(".tab").animate({"width":900},time);
	}
}

// 이전탭 활성화
function goPrevTab() {
	var tabLength = $(".tab > ul > li").length;
	
	if (tabLength > 1) {
		var curTabIdx;	// 현재활성화된 탭
		$(".tab > ul > li").each(function(idx, item) {
			if ($(".tab > ul > li").eq(idx).hasClass("on")) {
				curTabIdx = idx;
			}
		});
		var prevTabIdx = 0;
		if (curTabIdx == 0) {
			prevTabIdx = tabLength-1;	// 첫번째탭이라면 마지막탭idx로 설정
		} else {
			prevTabIdx = curTabIdx-1;
		}
		
		// 이전탭 id구해서 활성화
		var tabId = $(".tab > ul > li").eq(prevTabIdx).attr("id");
		tabId = tabId = tabId.substr(0, tabId.indexOf("_"));
		activeTab(tabId);
	}
}

// 다음탭 활성화
function goNextTab() {
	var tabLength = $(".tab > ul > li").length;
	
	if (tabLength > 1) {
		var curTabIdx;	// 현재활성화된 탭
		$(".tab > ul > li").each(function(idx, item) {
			if ($(".tab > ul > li").eq(idx).hasClass("on")) {
				curTabIdx = idx;
			}
		});
		var nextTabIdx = 0;
		if (curTabIdx == tabLength-1) {
			nextTabIdx = 0;	// 마지막탭이라면 첫번째탭idx로 설정
		} else {
			nextTabIdx = curTabIdx+1;
		}
		
		// 다음탭id구해서 활성화
		var tabId = $(".tab > ul > li").eq(nextTabIdx).attr("id");
		tabId = tabId = tabId.substr(0, tabId.indexOf("_"));
		activeTab(tabId);
	}
}

// 영역밖으로 벗어난 탭을 현재 화면에 맞추어 이동
function tabWidthCon() {
	var tLength = $(".tab").width();						// 전체영역 넓이
	var tabLength = $(".tab > ul > li").length*tabWidth;	// 실제탭영역 넓이
	
	//if (tabLength > tLength) {	// 실제탭영역이 전체영역보다 클경우
		var curTabIdx;	// 현재활성화된 탭
		$(".tab > ul > li").each(function(idx, item) {
			if ($(".tab > ul > li").eq(idx).hasClass("on")) {
				curTabIdx = idx;
			}
		});
		
		var obj1 = $(".tab").offset();			// 전체영역
		var obj2 = $(".tab > ul").offset();		// 실제탭영역
		var direction = "";
		var moveVal = 0;
		var curPosition = (curTabIdx*tabWidth)+parseInt(tabWidth)+parseInt(obj2.left);
		var curLeft = parseInt(obj2.left);
		
		// 현재탭*탭넓이 + 실제탭left < 전체탭left
		if ((curPosition-tabWidth) < obj1.left) {
			if (curTabIdx == 0) {
				moveVal = obj1.left;
			} else {
				moveVal = (curPosition - tabWidth);
			}
			$(".tab > ul").offset({left:moveVal});
		}
		if (curPosition > (obj1.left+tLength)) {
			moveVal = parseFloat(obj2.left) - (curPosition - (obj1.left+tLength));
			$(".tab > ul").offset({left:moveVal});
		}
		
	//}
}

function test() {
	$("#myinfo1_submenu").trigger("click");
	$("#myinfo2_submenu").trigger("click");
	$("#myinfo3_submenu").trigger("click");
	$("#myinfo4_submenu").trigger("click");
	$("#myinfo5_submenu").trigger("click");
	$("#export1_submenu").trigger("click");
	$("#export2_submenu").trigger("click");
	$("#export3_submenu").trigger("click");
	$("#export4_submenu").trigger("click");
	$("#export5_submenu").trigger("click");
}
$(document).ready(function(){ 
	var currentPosition = parseInt($(".quickmenu").css("top")); 
	$(window).scroll(function() { 
		var position = $(window).scrollTop(); 
		$(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000); 
		});
    $(".goTop").click(function(){
        $("html").animate({scrollTop:0},300);
    });
});


//쿠키(아이디저 장)
function loginProcess(){ 
	if ($("#user_email").val() == '') {
		alert('이메일을 입력해 주세요');
		$("#user_email").focus();
		return false;
	}
	if ($("#user_pwd").val() == '') {
		alert('비밀번호를 입력해 주세요');
		$("#user_pwd").focus();
		return false;
	}
	 var id = $("#user_email").val();
	 var pwd = $("#user_pwd").val();
	 var idChk = $("#saveBtn").is(":checked");
	 
	if(idChk){
		 setCookie("Cookie_mail", id, 7);
	 }else{
		 deleteCookie("Cookie_mail");
	 }
	$.ajax({
	      type : 'POST',
	      url : 'login.do',
	      data : {
	         user_email : $("#user_email").val(),
	         user_pwd : $("#user_pwd").val()
	      },
	      async : false,
	      success : function(res) {
	    	if (res.trim() == 'true') {   			 
    	  		$.ajax({
   				url : 'logoutView.do',
   				async : false,
   				success : function(res) {
   					$(".topmenu").html(res);
   					$(".mainLogin").hide();
   					$(".loginTitle").hide();
   					}
  				})
	    	} else {
	    		alert("오류")
	    	}
	    	
		   }	      
	   })
	   return false;
};  
$(function(){  
	var mail = getCookie("Cookie_mail");
if(mail){
	$("#user_email").val(mail);
	$("#saveBtn").attr("checked", true);
	} 
});
function setCookie(cookieName, value, exdays){
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	document.cookie = cookieName + "=" + cookieValue; 
	} 
function getCookie(cookieName) {
	cookieName = cookieName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';
	if(start != -1){
		start += cookieName.length;
		var end = cookieData.indexOf(';', start);
	if(end == -1)end = cookieData.length;
	cookieValue = cookieData.substring(start, end); 
	} 
	return unescape(cookieValue);
}
function deleteCookie(cookieName){
	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate() - 1);
	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString(); 
}





</script>
<style>
.sns_area {
	margin-left: 20px;
}
.sns_area a {
	margin-left: 5px;
}	
.sns_area img{
	height: 20px;
}
.quickmenu {
    position:absolute;
    top:126px;
    z-index:9998;
    top: 189px;
    left: 1451.5px;
    font-family: 'Noto Sans KR', sans-serif;
    box-sizing: border-box;
}
    .quickmenu {position:absolute;width:90px;top:50%;margin-top:-50px;right:10px;background:#F6F6F6;}
	.sns_area {
		margin-left: 20px;
	}
	.sns_area a {
		margin-left: 5px;
	}	
	.quickmenu {
	    position:absolute;
	    top:126px;
	    z-index:9998;
	    top: 189px;
	    left: 1551.5px;
	    font-family: 'Noto Sans KR', sans-serif;
	    box-sizing: border-box;
	}
    .quickmenu {position:absolute;width:90px;top:50%;margin-top:-50px;right:10px;background:#fff;}
	.quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;border:1px solid #ddd;}
	.quickmenu ul li {float:left;width:100%;border-bottom:1px solid #ddd;text-align:center;display:inline-block;*display:inline;}
	.quickmenu ul li a {position:relative;float:left;width:100%;height:30px;line-height:30px;text-align:center;color:#999;font-size:9.5pt;}
	.quickmenu ul li a:hover {color:#000;}
	.quickmenu ul li:last-child {border-bottom:0;}
	.quickmenu ul li img{}
	
	.mainLogin{
		width:100%; 
		height:100%;
		margin: 0px; auto;
        padding: 5px;
        box-sizing: border-box;
        color: #515151; 
        text-align: center;
        
	} 
	#loginTitle{
		width:100%; 
		height:100%; 
		margin: 0px; auto;
        padding: 0px;
        box-sizing: border-box;
        color: #515151; 
        text-align: center;
		border-bottom: 1px solid  #001433;
		color: #001433; 
	}
	#logBtnid{  
		border: 1px solid  #aaaaaa;
		border-top-left-radius: 1em;
		border-bottom-right-radius: 1em;
	}

</style>
</head>
<body>
<div id="wrap">
	<div id="header">
		<div id = "imgdiv"><a href="/question_pool/user/index.do"><img src="../img/user/mainLogo.png" height="4%" width="4%" style="margin-left: 20px; margin-right: auto;"></a></div>
		<h1 style="margin-left: 80px; margin-right: auto;"><a href="<%=userUtil.Property.contextPath%>/user/index.do">Ladder Up</a><a href="javascript:;" onclick="test()">&nbsp;&nbsp;&nbsp;</a></h1>
		<ul class="topmenu">		
			<c:if test="${!empty userInfo }">
				<li class="login"><a href="/question_pool/user/logout.do">로그아웃</a></li>
				<li class="mypage"><a href="javascript:;" onclick="clickMenu('main2', 'Mypage', '/user/mypage/index.do', false)" >마이페이지 (${userInfo.user_email})</a></li>
			</c:if>	
		</ul>
	</div>
	<!--//header-->
	<div id="container">
		<div id="menuWrap">
			<div class="allmenu">전체메뉴	
				<div class="allmenu_con">
					<dl style="width:13.666%;">
						<dt><a href="javascript:;">문제풀기</a></dt>
						<dd class="frist"><a href="javascript:;" onclick="clickMenu('front1', '문제풀기', '/user/question/pool.do', false)">문제풀기</a></dd>
						<dd><a href="javascript:;" onclick="clickMenu('front2', '랜덤 모의고사', '/user/question/random.do', false)">랜덤 모의고사</a></dd>
					</dl>
					<dl style="width:13.666%;">
						<dt><a href="javascript:;">결제</a></dt>
						<dd class="frist"><a href="javascript:;" onclick="clickMenu('project1', '상품보기', '/user/payment/pay.do', false)">상품보기</a></dd>
						<dd><a href="javascript:;" onclick="clickMenu('project2', '환불요청', '/user/payment/refund.do', false)">환불요청</a></dd>
					</dl>
					<dl style="width:14.666%;">
						<dt><a href="javascript:;">추가학습</a></dt>
						<dd class="frist"><a href="javascript:;" onclick="clickMenu('back1', '오답노트', '/user/question/note.do', false)">오답노트</a></dd>

						<dd><a href="javascript:;" onclick="clickMenu('back2', '단어장', '/user/question/study/word2.do, false">단어장</a></dd>
					</dl>
					<dl style="width:15.666%;">
						<dt><a href="javascript:;">커뮤니티</a></dt>
						<dd class="frist"><a href="javascript:;" onclick="clickMenu('portfolio1', '공지사항', '/user/board/notice/notice.do', false)">공지사항</a></dd>
						<dd><a href="javascript:;" onclick="clickMenu('portfolio2', '시험일정', '/user/board/testdate/testdate.do', false)">시험일정</a></dd>
						<dd><a href="javascript:;" onclick="clickMenu('portfolio3', 'Q&A', '/user/board/qa/qa.do', false)">Q&A</a></dd>
						<dd><a href="javascript:;" onclick="clickMenu('portfolio4', 'FAQ', '/user/board/faq/faq.do', false)">FAQ</a></dd>
						<dd class="last"><a href="javascript:;" onclick="clickMenu('portfolio5', '자유게시판', '/user/board/community/community.do', false)">자유게시판</a></dd>
					</dl>
				</div>
			</div>
			<c:if test="${empty userInfo }">
			<div class="loginTitle" id="loginTitle">
				<h1><span>LOG IN</span></h1>	
			</div>
	<div class="mainLogin">  
	<form name=loginForm id="loginForm" method="post" action="" onclick="" style="width:100%;higth:100%" onsubmit="return false;">
		<fieldset> 
			
			<div class="bgBox" style="text-align: center;">
				<div class="infoBox" >
					<dl>	
						<dt >
							<label for="user_eamil" ><strong style=" float:left">&nbsp;&nbsp;&nbsp;&nbsp;이메일</strong></label> 
						</dt>
						<dd style="text-align: center;">
							<input type="text" id="user_email" name="user_email" value="" title="이메일을 입력해주세요." style="ime-mode:inactive;width:85%;height:30px;"/>
						</dd> 
					</dl>
					<dl> 
						<dt>
							<label for="password"><strong style=" float:left">&nbsp;&nbsp;&nbsp;&nbsp;비밀번호</strong></label>
						</dt>
						<dd style="text-align: center;">
							<input type="password" id="user_pwd" name="user_pwd" value="" title="비밀번호를 입력해주세요." style="width:85%;height:30px;" />
						</dd>
					</dl> 
				</div>
				<!-- //infoBox -->  
				<div style="text-align: right; padding: 5px;"> 
				<input type="checkbox" name="saveBtn" id="saveBtn" style="text-align: left;"/> <label for="reg" style=" font-size:12px;">아이디 저장</label> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" onclick="return loginProcess();" value="로그인" style="width: 28%; height: 30%; font-size:12px;" alt="로그인" class="loginBtn" id="logBtnid"  />&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			<!-- //bgBox --> 
	
			<div style="width:100%;height:100%; text-align: center;">   
			                        <a href="join.do" class="aaa"  style="width:20px;height:35px;font-size:12px;text-align: center;">회원가입</a> &nbsp
                                    <a href="searchId.do" class="aaa"  style="width:100px;height:35px;font-size:12px;text-align: center;">이메일/비밀번호 찾기</a>
			</div>
			<!-- //joinList -->
			<input type="hidden" name="url" id="url" value="<%//=url%>"/>
			<input type="hidden" name="param" id="param" value="<%//=param%>"/>
			<input type="hidden" name="ip" id="ip" value="<%=request.getRemoteAddr()%>"/> 
		</fieldset>
	</form>
	</div>
	</c:if>
			<div class="gnb">
				<dl>
					<dt id="main" class="gnb_menu">Main</dt>
					<dd class="gnb_submenu">
						<ul>
							<li id="main1_submenu" onclick="clickMenu('main1', '메인', '/user/main/index.do', false)">Main</li>
						</ul>
					</dd>
					<dt id="front" class="gnb_menu">문제풀기</dt>
					<dd class="gnb_submenu">
						<ul>	
							<li id="front1_submenu" onclick="clickMenu('front1', '문제풀기', '/user/question/pool.do', false)">문제풀기</li>
							<li id="front2_submenu" onclick="clickMenu('front2', '랜덤 모의고사', '/user/question/random.do', false)">랜덤 모의고사</li>
						</ul>
					</dd>
					<dt id="project" class="gnb_menu">결제</dt>
					<dd class="gnb_submenu">
						<ul>	
							<li id="project1_submenu" onclick="clickMenu('project1', '상품보기', '/user/payment/pay.do', false)">상품보기</li>
							<li id="project2_submenu" onclick="clickMenu('project2', '환불요청', '/user/payment/refund.do', false)">환불요청</li>
						</ul>
					</dd>
					<dt id="back" class="gnb_menu">추가학습</dt>
					<dd class="gnb_submenu">
						<ul>	
							<li id="back1_submenu" onclick="clickMenu('back1', '오답노트', '/user/question/note.do', false)">오답노트</li>
							<li id="back2_submenu" onclick="clickMenu('back2', '단어장', '/user/question/study/word2.do', false)">단어장</li>
						</ul>
					</dd>
					<dt id="portfolio" class="gnb_menu">커뮤니티</dt>
					<dd class="gnb_submenu">
						<ul>	
							<li id="portfolio1_submenu" onclick="clickMenu('portfolio1', '공지사항', '/user/board/notice/notice.do', false)">공지사항</li>
							<li id="portfolio2_submenu" onclick="clickMenu('portfolio2', '시험일정', '/user/board/testdate/testdate.do', false)">시험일정</li>
							<li id="portfolio3_submenu" onclick="clickMenu('portfolio3', 'Q&A', '/user/board/qa/qa.do', false)">Q&A</li>
							<li id="portfolio4_submenu" onclick="clickMenu('portfolio4', 'FAQ', '/user/board/faq/faq.do', false)">FAQ</li>
							<li id="portfolio5_submenu" onclick="clickMenu('portfolio5', '자유게시판', '/user/board/community/community.do', false)">자유게시판</li>
						</ul>
					</dd>
				</dl>
			</div>
			<div class="menuclose" onclick="menuToggle();"><img src="<%=userUtil.Property.contextPath%>/img/menu_close.png" /></div>
			<div class="copy">
				<p>(주)LadderCompany</p>
	            <p>서울특별시 종로구 삼일대로17길 51 스타골드빌딩 3층,4층,5층</p>
	            <p>02-738-5001 | 02-738-5001</p>
	            <p>대표자 김깐부</p>
	            <p>사업자번호 111-86-22222</p> 
			</div>
			<div class="sns_area">
                <a href=""><img src="/question_pool/img/facebook.png"></a>
                <a href=""><img src="/question_pool/img/twitter.png"></a>
                <a href=""><img src="/question_pool/img/youtube.png"></a>
            </div>						
		</div>
		<!--//menuWrap-->
		<div id="contentsWrap">
			<div class="tabWrap">
				<div class="tab"> <!--  style="overflow:scroll;" -->
					<ul style="overflow:hidden;width:1500px;">
					</ul>
				</div>
				<div class="tabNavi">
					<ul>
						<li><img src="<%=userUtil.Property.contextPath%>/img/tab_prev.png" onclick="goPrevTab();"/></li>
						<li><img src="<%=userUtil.Property.contextPath%>/img/tab_next.png" onclick="goNextTab();"/></li>
					</ul>
				</div>
			</div>
			<!--//tab-->
			<div class="contents">
			</div>
		</div>
		<!--//contentsWrap-->
	</div>
	<div class="btnTop">
		<a href="#"><img src="<%=userUtil.Property.contextPath%>/img/btn_top.png" alt="맨위로" /></a>
	</div>
	<!--//container-->
</div>
<div class="quickmenu">
		<ul>
			<li><img src="../img/user/quick_01.jpg" style="heigth:70px;"></li>
            <li id="project1_submenu" onclick="clickMenu('project1', '상품보기', '/user/payment/pay.do', false)">
            <img src="../img/user/quick12.png" style="height: 70px; cursor:pointer;"class="goTop">
            </li>
            <li id="front1_submenu" onclick="clickMenu('front1', '문제풀기', '/user/question/pool.do', false)">
            <img src="../img/user/quick11.png" style="height: 70px; cursor:pointer;"class="goTop">
            </li>
            <li id="front2_submenu" onclick="clickMenu('front2', '자유게시판', '/user/board/community/community.do', false)">
            <img src="../img/user/quick13.png" style="height: 70px; cursor:pointer;"class="goTop">
            </li>
       </ul>
</div> 
</body>
</html>
