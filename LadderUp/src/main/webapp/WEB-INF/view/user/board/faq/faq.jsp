<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@ include file="/WEB-INF/view/user/include/headHtml.jsp" %>
<style type="text/css">
#answer {    
    display: flex;
    background-color: #dddddd;
    padding: 0.3em 1.4em 0.2em 0.8em;    
    border: 1px solid #aaa;
    border-radius: 0.5em;
    box-shadow: 0 1px 0 1px rgb(0 0 0 / 4%);
    text-align: left;
}
</style>
<script>
function getA(faq_no){
	$.ajax({
		url : 'view.do',
		data: {faq_no:faq_no},
		async : false,
		success : function(res) {			
			$("#answer").show();
			$("#answer").html(res);
		}
	})
}
</script>
</head>
<body> 
<div id="boardWrap">
	<!-- canvas -->
	<div id="canvas">		
		<!-- S T A R T :: containerArea-->
		<div id="container" style="width:100%;">
			<div id="content">
				<div class="pageTitle">
					<h1>FAQ</h1>		
				</div>
				<h3>
					[Ladder Up] 고객님들께서 자주 물으시는 질문과 답변을 모았습니다. <br> 
					원하시는 내용이 없으면 'Q&A'를 이용하여 문의해주시기 바랍니다.						
				</h3>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div class="bbs">					
					<table>								
						<tr id="answer" colspan="10" style="display: none;"></tr>
					</table>	
						<div class="list">
							<!-- search --> 							
							<form name="searchForm" id="searchForm" action="faq.do"  method="get" >
								<div class="search">
									<select name="searchType" title="검색을 선택해주세요">
										<option value="">전체</option>										
										<option value="faq_title" <c:if test="${param.searchType == 'faq_title'}">selected</c:if>>제목</option>
										<option value="faq_content" <c:if test="${param.searchType == 'faq_content'}">selected</c:if>>내용</option>										
									</select>									
									<input type="text" name="searchWord" value="${param.searchWord }" title="검색어를 입력해주세요" value placeholder="검색어를 입력해주세요" style="width: 500px"/>
									<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" />									
								</div>
							</form>							
							<!-- //search -->
							<p><span><strong>총 ${totCount }개</strong>  |  ${faqVo.page }/${totPage }페이지</span></p>							
							<form name="frm" id="frm" action="process.do" method="get">
							<table width="100%"  cellspacing="0" cellpadding="0">
								<colgroup>
									<col class="w3"/>
									<col class="w4"/>
									<col class="" />
									<col class="w10" />
									<col class="w5" />
									<col class="w6" />
								</colgroup>
								<thead>
									<tr>										
										<th scope="col" class="first" style="width: 5%;">번호</th>
										<th scope="col" style="width: 5%;">분류</th>
										<th scope="col">질문</th>
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
										<input type="hidden" name="faq_no" id="faq_no" value="${list.faq_no }" >                                    
			                            <tr id="freq" style="cursor: pointer;" onclick="getA(${list.faq_no })">			                            				                            	
			                                <td>${list.faq_no }</td>
			                                <td>
			                                	${list.faq_division }			                                	
			                                </td>			                                
			                                <td class="txt_l" style="font-size: 13px; font-family: dotum;">
			                                	<a>${list.faq_title }</a>
		                                	</td>
			                            </tr>			                            
		                            		
			                            </c:forEach>
			                         </c:if>
								</tbody>
							</table>
							</form>
							<!--//btn-->
							<!-- 페이징 처리 -->
							<div class="pagenate">
							${pageArea }
							</div>
							<!-- //페이징 처리 -->	 
						</div>
						<!-- //list -->
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