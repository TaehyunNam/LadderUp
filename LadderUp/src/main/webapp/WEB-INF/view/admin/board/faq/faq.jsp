<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">	
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
	var url = "delete.do";    // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
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
                    location.replace("faq.do")
                }
                else{
                    alert("삭제 실패");
                }
            }
		});
	}
}
function fn_paging(curPage){
    location.href="faq.do?curPage="+curPage;
}
</script>
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
</head>
<body> 
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>FAQ - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${totCount }개</strong>  |  ${faqVo.page }/${totPage }페이지</span></p>							
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="w4" />
									<col class="" />
									<col class="w10" />
									<col class="w5" />
									<col class="w6" />
								</colgroup>
								<thead>
									<tr>										
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk"/></th>
										<th scope="col" style="width: 5%">번호</th>
										<th scope="col" style="width: 10%">분류</th> 
										<th scope="col" style="width: 85%">질문</th> 
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list }">
			                            <tr>
			                                <td class="first" colspan="8">등록된 글이 없습니다.</td>
			                            </tr>
									</c:if>
									<c:if test="${!empty list }">
										<c:forEach var="list" items="${list }">                                    
			                            <input type="hidden" name="faq_no" value="${list.faq_no }">
			                            <input type="hidden" name="admin_no" value="${list.admin_no }">
			                            <tr>
			                            	<td scope="col" class="first"><input type="checkbox" name="RowCheck" value="${list.faq_no }"/></td>			                            	
			                                <td>${list.faq_no }</td>
			                                <td class="division">${list.faq_division }</td>
			                                <td class="txt_l" onclick="location.href='view.do?faq_no=${list.faq_no }'" style="cursor: pointer; text-align: left;">
			                                    <a href="view.do?faq_no=${list.faq_no }">&nbsp;&nbsp; ${list.faq_title }</a>
			                                </td>
			                            </tr>
			                            </c:forEach>
			                         </c:if>
								</tbody>
							</table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="javascript:del();"><strong>삭제</strong></a> 
								</div>
								<div class="btnRight">
									<a class="wbtn" href="write.do"><strong>등록</strong> </a>
								</div>
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->
							${pageArea }
							<!-- //페이징 처리 -->
							<form name="searchForm" id="searchForm" action="faq.do"  method="get" >
								<div class="search">
									<select name="searchType" title="검색을 선택해주세요">
										<option value="">전체</option>
										<option value="faq_title" <c:if test="${param.searchType == 'faq_title'}">selected</c:if>>제목</option>
										<option value="faq_content" <c:if test="${param.searchType == 'faq_content'}">selected</c:if>>내용</option>
									</select>
									<input type="text" name="searchWord" value="${param.searchWord }" title="검색어를 입력해주세요" value placeholder="검색어를 입력해주세요"/>
									<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" />
								</div>
							</form>
							<!-- //search --> 
						</div>
						<!-- //blist -->
					</div>
					<!-- //bbs --> 
					<!-- 내용 : e -->
				</div>
				<!--//con -->
			</div>
			<!--//content -->
		</div>
		<!--//container --> 
		<!-- E N D :: containerArea-->
	</div>
	<!--//canvas -->
</div>
<!--//wrap -->

</body>
</html>