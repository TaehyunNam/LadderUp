<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<title>오답노트</title>
<style>

.p{
	display:"inline-block"
}
.btn-btn-primary{
  background-color: #484b56;
  color: white;
  cursor: pointer;
  padding: 10px;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
}
#hidebtn{
	float:right;
}
#multiCollapseExample3{
  display:inline-block;
  position:relative;
}

#memosave{
  position:absolute;
  bottom:10px;
  right:10px;
}

#memo{
  display:block;
}

</style>
<script>
window.onload=function(){
	  document.getElementById("showall").click();
	};
	
function textAreaAdjust(element) {
	element.style.height = "1px";
	element.style.height = (25+element.scrollHeight)+"px";
}

function fn_paging(curPage){
	location.href="note.do?curPage="+curPage;
	}
	
$(function(){  // 전체 체크버튼	
	var chkObj = document.getElementsByName("RowCheck");
	var rowCnt = chkObj.length;
	
	$("input[name='allChk']").click(function(){
		var chk_listArr = $("input[name='RowCheck']");
		for (var i=0; i<chk_listArr.length; i++){
			chk_listArr[i].checked = this.checked;
		}
	});
	$("input[name='RowCheck']").click(function(){
		if($("input[name='RowCheck']:checked").length == rowCnt){
			$("input[name='allChk']")[0].checked = true;
		}
		else{
			$("input[name='allChk']")[0].checked = false;
		}
	});
});

function del(){  // 단일 및 다중선택 후 삭제 가능하도록 배열 처리
	var url = "noteDelete.do";    // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
	var valueArr = new Array();
    var list = $("input[name='RowCheck']")
    for(var i = 0; i < list.length; i++){
        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
            valueArr.push(list[i].value);
        	console.log(valueArr);
        }
    }
    if (valueArr.length == 0){
    	alert("선택된 글이 없습니다.");
    }
    else{
		var chk = confirm("정말 삭제하시겠습니까?");				 
		$.ajax({
		    url : url,                    // 전송 URL
		    type : 'POST',                // GET or POST 방식
		    traditional : true,
		    data : {
		    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
		    },
            success: function(jdata){
                if(jdata = 1) {
                    alert("삭제 성공");
                    location.replace("note.do")
                }
                else{
                    alert("삭제 실패");
                }
            }
		});
	}
}


function goSave(question_no) {	
	$("#frm").ajaxForm({
		url:'noteUpdate.do',
		data: {question_no:question_no},
		success:function(res) {
			console.log(question_no)
			location.href='note.do?user_no=${userInfo.user_no}';
		}
	});
}

</script>
</head>
<body>
	<div id="canvas">
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>[${userInfo.user_nick }님의 오답노트입니다.]</h2>
					<input type="hidden" value="${userInfo.user_no }">
				</div>				
			</div>
		</div>
	</div>
	<div class="con">
		<div id="bbs">
			<div id="bread">

			<p><span><strong>총 ${totCount }개</strong>  |  ${QuestionVo.page }/${totPage }페이지</span></p>							
			
			<p> 
				<button class="btn btn-primary" type="button" hidden="hidden" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample1" aria-expanded="false" aria-controls="multiCollapseExample1">문제</button>
  				<button id="hidebtn" class="btn-btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample2" aria-expanded="false" aria-controls="multiCollapseExample2" >정답 가리기</button>
  				<button id="showall" class="btn btn-primary" type="button" hidden="hidden" data-bs-toggle="collapse" data-bs-target=".multi-collapse" aria-expanded="false" aria-controls="multiCollapseExample1 multiCollapseExample2">모두 보기</button>			
			</p>
			<p><div scope="col" class="first"><input type="checkbox" name="allChk" id="allChk"/></div></p>
			
			<c:forEach var="wlist" items="${wlist}" varStatus="status">
			<input type="hidden" value="${wlist.question_no}">			
			<div class="row">					
  				<div scope="col" class="first"><input type="checkbox" name="RowCheck" value="${wlist.question_no }"/></div>                            	                            				
				<div class="col">
					<div class="collapse multi-collapse" id="multiCollapseExample1">
						<div class="card card-body" style="width: 600px;">
							<div class="passage">${wlist.passage }</div>
									
							<c:set var="string" value="${wlist.question_content}"/>
							<c:set var="string1" value="${fn:replace(string,'#','<u>')}"/>
							<c:set var="string2" value="${fn:replace(string1,'$','</u>')}"/>
									
							<div class="subcon">
								<div class="qcon">${status.count}. ${string2}</div>
									<c:forEach var="ev" items="${wlist.ex}" varStatus="status">
										<div class="examples">
											(${ev.example}) ${ev.example_content}
										</div>
									</c:forEach>
								</div>																										
							</div>
						</div>
					</div>
				<div class="col">
					<div class="collapse multi-collapse" id="multiCollapseExample2">
						<div class="card card-body" style="width: 500px;" >
							<p>정답 : (${wlist.answer})</p>						
							<p>해설 : ${wlist.explanation}</p>
						</div>
						<div class="collapse multi-collapse" id="multiCollapseExample3">	
							<form method="get" name="frm" id="frm" action="noteUpdate.do">
							<input type="hidden" name="question_no" value="${wlist.question_no}">										
							<textarea id="memo" name="memo" class="card card-body" onkeyup="textAreaAdjust(this)" style="overflow:hidden; width:500px;"> ${wlist.memo} </textarea>								
							<button id="memosave" onclick="javascript:goSave(${wlist.question_no});">메모</button>								
							</form>															
						</div>				
					</div>
				</div>
			</div>
			</c:forEach>
  				<button class="btn-btn-primary" type="button" onclick="javascript:del();" ><strong>삭제</strong></button>
			${pageArea }			
			</div>			
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>  
</body>
</html>