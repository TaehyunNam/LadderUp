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

function selectNation(v) {
	if (v == "export") {
		$("#nation1 option").remove();
		$("#nation1").append("<option value='korea'>KOREA</option>");
		$("#nation1").data('selectric').refresh();
		selectPort('nation1','port1', '');
		
		$("#nation2 option").remove();
		$("#nation2").append("<option value='japan'>JAPAN</option>");
		$("#nation2").append("<option value='china'>CHINA</option>");
		$("#nation2").data('selectric').refresh();
		selectPort('nation2','port2', 'JPTYO');
		
	} else if (v == "import") {
		$("#nation1 option").remove();
		$("#nation1").append("<option value='japan'>JAPAN</option>");
		$("#nation1").append("<option value='china'>CHINA</option>");
		
		$("#nation1").data('selectric').refresh();
		selectPort('nation1','port1', 'JPTYO');
		
		$("#nation2 option").remove();
		$("#nation2").append("<option value='korea'>KOREA</option>");
		$("#nation2").data('selectric').refresh();
		selectPort('nation2','port2', '');
	}
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
            delay:3000
        },
        navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
        },
    });
});
$(document).ready(function () {
	$.ajax({
		url : 'mainPool.do',
		async : false,
		success : function(res) {
			$(".poolArea").html(res);
		}
	})
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

.fl_l {    
    background-color: #fff;
    padding: 0.3em 1.4em 1.2em 0.8em;
    margin: 0;
    border: 2px solid #aaa;
    border-radius: 0.5em;
    align-items: center;
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
				<div class="wid48 fl_l">
					<div class="box notice">
						<div class="poolArea">						
						</div>
					</div>
					<div class="linkBox">
						<ul>
							<li class="link01"><a href="">Profile</a></li>
							<li class="link02"><a href="">Java</a></li>
							<li class="link03"><a href="">BigData</a></li>
						</ul>
					</div>
				</div>
				<div class="wid48 fl_r">
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
								<tr>
									<td><a href="">공지사항입니다.</a></td>
									<td>홍길동</td>
									<td>2020-01-01</td>
								</tr>
								<tr>
									<td><a href="">공지사항입니다.</a></td>
									<td>홍길동</td>
									<td>2020-01-01</td>
								</tr>
								<tr>
									<td><a href="">공지사항입니다.</a></td>
									<td>홍길동</td>
									<td>2020-01-01</td>
								</tr>
								<tr>
									<td><a href="">공지사항입니다.</a></td>
									<td>홍길동</td>
									<td>2020-01-01</td>
								</tr>
								<tr>
									<td><a href="">공지사항입니다.</a></td>
									<td>홍길동</td>
									<td>2020-01-01</td>
								</tr>
								<tr>
									<td><a href="">공지사항입니다.</a></td>
									<td>홍길동</td>
									<td>2020-01-01</td>
								</tr>
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
								<tr>
									<td><a href="">Q&A입니다.</a></td>
									<td>홍길동</td>
									<td>2020-01-01</td>
								</tr>
								<tr>
									<td><a href="">Q&A입니다.</a></td>
									<td>홍길동</td>
									<td>2020-01-01</td>
								</tr>
								<tr>
									<td><a href="">Q&A입니다.</a></td>
									<td>홍길동</td>
									<td>2020-01-01</td>
								</tr>
								<tr>
									<td><a href="">Q&A입니다.</a></td>
									<td>홍길동</td>
									<td>2020-01-01</td>
								</tr>
								<tr>
									<td><a href="">Q&A입니다.</a></td>
									<td>홍길동</td>
									<td>2020-01-01</td>
								</tr>
								<tr>
									<td><a href="">Q&A입니다.</a></td>
									<td>홍길동</td>
									<td>2020-01-01</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
</div>
<!--//contentsWrap-->
</body>
</html>
