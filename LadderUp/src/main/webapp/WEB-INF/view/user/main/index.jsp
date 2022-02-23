<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<head>
<title><%=userUtil.Property.title%></title>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>      
<%@ include file="/WEB-INF/view/user/include/headHtml.jsp" %>
<script>
$(document).ready(function(){
	$(".trade_type").each(function(idx, item) {
		if ($(".trade_type").eq(idx).prop("checked")) {	// 라디오박스 체크된 경우
			var val = $("input:radio[name='trade_type']").eq(idx).val();
			selectNation("export");
		}
    });
	
	$(".trade_type").on('ifChecked', function(){
		$(".trade_type").each(function(idx, item) {
			if ($(".trade_type").eq(idx).prop("checked")) {	// 라디오박스 체크된 경우
				var val = $("input:radio[name='trade_type']").eq(idx).val();
				selectNation(val);
			}
	    });
    });
	
});

function selectPort(source, target, sel) {
	$("#"+target+" option").remove();
	
	var korea_city = ["BUSAN", "INCHEON", "PYONGTAEK", "KWANGYANG"];
	var korea_value = ["KRPUS", "KRINC", "KRPTK", "KRKAN"];
	var japan_city = ["CHIBA", "HIROSHIMA", "KOBE", "NAGOYA", "OSAKA", "SHIMIZU", "TOKYO", "YOKOHAMA"];
	var japan_value = ["JPCHB", "JPHIJ", "JPUKB", "JPNGO", "JPOSA", "JPSMZ", "JPTYO", "JPYOK"];
	var china_city = ["NINGBO", "QINGDAO", "SHANGHAI", "TAICANG", "XINGANG", "ZHANGJIAGANG"];
	var china_value = ["CNNBG", "CNTAO", "CNSHA", "CNTAG", "CNTXG", "CNZJG"];
	
	var nation = $("#"+source+" option:selected").val();
	if (nation == "korea") {
		for (var i=0; i<korea_city.length; i++) {
			var isSel = "";
			if (korea_value[i] == sel) isSel = "selected";
			$("#"+target).append("<option value="+korea_value[i]+" "+isSel+">"+korea_city[i]+"</option>");
		}
	} else if (nation == "japan") {
		for (var i=0; i<japan_city.length; i++) {
			var isSel = "";
			if (japan_value[i] == sel || (sel == "" && japan_value[i] == "JPTYO")) isSel = "selected";
			$("#"+target).append("<option value="+japan_value[i]+" "+isSel+">"+japan_city[i]+"</option>");
		}
	} else if (nation == "china") {
		for (var i=0; i<china_city.length; i++) {
			var isSel = "";
			if (china_value[i] == sel || (sel == "" && china_value[i] == "CNSHA")) isSel = "selected";
			$("#"+target).append("<option value="+china_value[i]+" "+isSel+">"+china_city[i]+"</option>");
		}
	}
	$('#'+target).data('selectric').refresh();
}

function changeTab(v) {
	$("#curbl_notice").removeClass("on");
	$("#curbl_qna").removeClass("on");
	$("#curbl_"+v).addClass("on");
	
	$("#notice_tab").hide();
	$("#qna_tab").hide();
	$("#"+v+"_tab").show();
}

function goSchedule() {
	var n1 = $("#nation1").val();
	var n2 = $("#nation2").val();
	var p1 = $("#port1").val();
	var p2 = $("#port2").val();
	var trade_type = $("input:radio[name=trade_type]:checked").val();
	var pYear = $("#pYear").val();
	var pMonth = $("#pMonth").val();
	
	parent.clickMenu('schedule1', '스케쥴', '/schedule/index.do?nation1='+n1+'&nation2='+n2+'&port1='+p1+'&port2='+p2+'&trade_type='+trade_type+'&pYear='+pYear+'&pMonth='+pMonth);
}

function goCargo() {
	var stype = $("#cargo_stype").val();
	var sval = $("#cargo_sval").val();
	
	parent.clickMenu('cargo1', '화물추적', '/cargo/index.do?stype='+stype+'&sval='+sval)
}

function goContainer() {
	var stype = $("#con_stype").val();
	var sval = $("#con_sval").val();
	
	parent.clickMenu('export0', '컨테이너<br>중량 조회', '/export/container/index.do?stype='+stype+'&sval='+sval)
}

$(function() {
	var swiper = new Swiper(".swiper", {
        loop:true,
        autoplay : {
            delay:5000
        },
        navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
        },
    });
});
</script>
<style type="text/css">
.main {
    width:100%;
    height:420px;
    margin-bottom: 10px;
}
.main .swiper {
    height:420px;
}
.swiper-slide {
    background-repeat: no-repeat;
    background-position: center center;
    background-size: cover;
}


#goexam {
	background-image: url("/question_pool/img/user/goexam2.jpg");
	height: 180px;
	text-align: center;	
	margin-bottom: 4%;
}
.notice .goexam1 {
	font-size: 25px;
	text-align: center;	
	font-weight: bold;
	margin-top:6%;
	font-style: italic;
	color: #fff;	
}

.notice .goexam2 {
	font-size: 25px;
	text-align: center;	
	font-weight: bold;
	color: #edd84c;
	margin-bottom: 2%;	
}

.notice .exambts {
	cursor: pointer;
	width: 60%;
	align-self: center;
	color: #fff;	
	margin-left: 20%;
    background-color: #001433 ;
    padding: 0.1em 0.1em 0.1em 0.1em;    
    border: 0.1px solid #001433 ;
    border-radius: 0.5em;
    text-align: center;
    font-size: 20px;
    font-weight: bold;
    font-family: sans-serif;   
}

.fl_r {    
    background-color: #fff;
    padding: 0.3em 1.4em 1.2em 0.8em;
    margin: 0;
    border: 2px solid #aaa;
    border-radius: 0.5em;
    align-items: center;
    height: 370px;
}
#gopay {
	background-image: url("/question_pool/img/user/memberShip.png");
	height: 180px;
	cursor: pointer;
}
#gopay p {
	align-self: center;
	color: #fff;
    padding: 0.3em 0.3em 0.3em 0.3em;
    text-align: center;
    padding-top: 40%;
    font-size: 15px;
    font-weight: bold;    
}

#notice_tab {
	border-spacing: 3px 4px;
}

#notice_tab thead tr{
	border-bottom: solid 1px #000;
}

#notice_tab tr {
	cursor: pointer;
}

#qna_tab {
	border-spacing: 3px 5px;
}

#qna_tab thead {
	border-bottom: solid 1px #000;
}

#qna_tab tr {
	cursor: pointer;
	border-spacing: 5px;
} 
 

</style>
</head>
<body>
<div class="main">
	<div class="swiper">
	    <div class="swiper-wrapper">
	      <div class="swiper-slide" style="background-image: url('/question_pool/img/user/main03.png');"></div>
	      <div class="swiper-slide" style="background-image: url('/question_pool/img/user/main06.png');"></div>
	      <div class="swiper-slide" style="background-image: url('/question_pool/img/user/main04.png');"></div>
	      <div class="swiper-slide" style="background-image: url('/question_pool/img/user/main05.png');"></div>
	        </div>
	        <div class="swiper-button-next"></div>
	        <div class="swiper-button-prev"></div>
	    </div>
	</div>
<div id="boardWrap" class="bbs">				
	<div class="wid33 fl_l">
		<div id="goexam" class="box notice">
			<div class="goexam1">Ladder Up</div>
			<div class="goexam2">편입영어 기출문제</div>
			<div class="exambts" onclick="location.href='/question_pool/user/question/pool.do'">문제풀기</div>
		</div>
		<div class="linkBox">
			<div id="gopay" onclick="location.href='/question_pool/user/payment/pay.do'">
				<p>결제혜택 확인하러가기</p>
			</div>
		</div>
	</div>
	<div class="wid65 fl_r">
		<div class="box bl">
			<h2>최근 게시글</h2>
			<div class="blTab">
				<ul>
					<li id="curbl_notice" class="on" onclick="changeTab('notice');">공지</li>
			<li id="curbl_qna" onclick="changeTab('qna');">Q&A</li>
		</ul>
	</div>
	<table id="notice_tab">
		<thead>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>			
			<c:forEach var="nlist" items="${nlist }">                                    
	            <input type="hidden" name="notice_no" value="${nlist.notice_no }">
	            <input type="hidden" name="admin_no" value="${nlist.admin_no }">
	            <tr onclick="location.href='/question_pool/user/board/notice/view.do?notice_no=${nlist.notice_no }'">
	                <td class="txt_l">
	                	<a><img src="/question_pool/img/admin/top_ico.gif">${nlist.notice_title }</a>
	               	</td>
	                <td class="writer" style="text-align: center;">
	                    ${nlist.admin_name }
	                </td>			                                
	                <td class="date" style="text-align: center;"><fmt:formatDate value="${nlist.notice_date }" pattern="yyyy-MM-dd"/></td>    
	            </tr>
            </c:forEach>         
		</tbody>
	</table>
	<table id="qna_tab" style="display:none;">
		<thead>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<form name="frm" id="frm" action="process.do" method="get">
				<c:forEach var="qlist" items="${qlist }">                                    
                    <input type="hidden" name="qa_no" value="${qlist.qa_no }">
                    <input type="hidden" name="user_no" value="${qlist.user_no }">
                    <tr onclick="location.href='/question_pool/user/board/qa/view.do?qa_no=${qlist.qa_no }'">
                        <td class="txt_l">
                        	<a>${qlist.qa_title }</a>
                       	</td>
                        <td class="writer" style="text-align: center;">
                            ${qlist.user_name }
                        </td>			                                
                        <td class="date" style="text-align: center;"><fmt:formatDate value="${qlist.qa_date }" pattern="yyyy-MM-dd"/></td>    
                    </tr>
                    </c:forEach>
                 </form>
					</tbody>
				</table>
			</div>
		</div>
	</div>		
</div>
<!--//contentsWrap-->
</body>
</html>
