<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
#division a {	
	border-radius: 10px 10px 0 0;
	font-size: 20px;
	margin: -2;
	padding: 0 20px 0 20px;
}
</style>
<script type="text/javascript">
$(document).ready(function () {
    $('#division #tab').hover(function(){
        $(this).css('color','#c91c1c');
        $(this).css('font-weight','bold');        
    }, function() {
        $(this).css('color','');
        $(this).css('font-weight','');
    });
});
</script>
</head>
<body> 
						<div class="list">
							<p id="division">
							<span>					
								<a id="tab" href="/question_pool/user/mypage/myboard.do" style="margin-left: 3; border: solid 1px #000000;">Q&A</a>
								<a onclick="myComu()"  style="color: #c91c1c !important; border: solid 2px #000000;"><strong>자유게시판</strong></a>						
								<a id="tab" onclick="myComment()" style="border: solid 1px #000000;">댓글</a>						
							</span>
							</p>							
							<form name="frm" id="frm" action="process.do" method="post">
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
										<th scope="col">제목</th> 
										<th scope="col" style="width: 10%;">작성일</th> 
										<th scope="col" style="width: 7%;">작성자</th> 
										<th scope="col" style="width: 5%;" class="last">조회수</th>
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
			                            <input type="hidden" name="community_no" value="${list.community_no }">
			                            <input type="hidden" name="user_no" value="${list.user_no }">
			                            <tr>			                            				                            	
			                                <td>${list.community_no }</td>
			                                <td class="txt_l" onclick="location.href='view2.do?community_no=${list.community_no }'" style="cursor: pointer;">
			                                    <a href="view2.do?community_no=${list.community_no }">${list.community_title } &nbsp;
			                                    <c:if test="${list.c_count != 0}">
			                                    	<strong>[${list.c_count }]</strong>
			                                    </c:if>
			                                    </a>
			                                </td>
			                                <td class="date"><fmt:formatDate value="${list.community_date }" pattern="yyyy-MM-dd"/></td>			                                
			                                <td class="writer">
			                                    ${list.user_name }
			                                </td>			                                
			                                <td class="readcount">${list.community_readcount }</td>
			                            </tr>
			                            </c:forEach>
			                         </c:if>
								</tbody>
							</table>
							</form>
							<p><span><strong>총 ${totCount }개</strong>  |  ${communityVo.page }/${totPage }페이지</span></p>							
							<br>	
							<div class="btn">
								<div class="writebtn">
									<a class="wbtn" href="/question_pool/user/board/community/community.do"><strong>자유게시판바로가기</strong> </a>
								</div>
							</div>							
							<!--//btn-->
							<!-- 페이징 처리 -->
							<div class="pagenate">
							${pageArea }
							</div>
							<!-- //페이징 처리 -->
						</div>
</body>
</html>