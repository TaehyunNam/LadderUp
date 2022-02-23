<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<div class="list">
					<p id="division">
					<span>					
						<a id="tab" href="/question_pool/user/mypage/myboard.do" style="margin-left: 3; border: solid 1px #000000;">Q&A</a>
						<a id="tab" onclick="myComu()" style="border: solid 1px #000000;">자유게시판</a>						
						<a onclick="myComment()" style="color: #c91c1c; border: solid 2px #000000;"><strong>댓글</strong></a>						
					</span>
					</p>
					<table>										    
					    <thead>
							<tr>									
								<th scope="col" class="first" style="width: 8%;">게시판</th>
								<th scope="col">내용</th> 
								<th scope="col" class="last" style="width: 9%;">작성일</th>								 
							</tr>
						</thead>
					    <tbody>
					    <c:if test="${empty cList}">
					        <tr>
					            <td class="first" colspan="4">등록된 댓글이 없습니다.</td>
					        </tr>
					    </c:if>                    
					    <c:if test="${!empty cList}">
					    	<c:forEach var="vo" items="${cList }">					    						    	            
					        <c:if test="${vo.tablename == 'notice'}">	
					        	<tr onclick="location.href='/question_pool/user/board/${vo.tablename}/view.do?notice_no=${vo.notice_no }'" style="cursor: pointer;">
				        	</c:if>
					        <c:if test="${vo.tablename == 'testdate'}">	
					        	<tr onclick="location.href='/question_pool/user/board/${vo.tablename}/view.do?td_no=${vo.td_no }'" style="cursor: pointer;">
				        	</c:if>
					        <c:if test="${vo.tablename == 'community'}">	
					        	<tr onclick="location.href='/question_pool/user/board/${vo.tablename}/view.do?community_no=${vo.community_no }'" style="cursor: pointer;">
				        	</c:if>
					            <td>
					            <c:if test="${vo.tablename == 'notice'}">
					            	공지사항
					            </c:if>
					            <c:if test="${vo.tablename == 'testdate'}">
					            	시험일정
					            </c:if>
					            <c:if test="${vo.tablename == 'community'}">
					            	자유게시판
					            </c:if>
					            </td>
					            <td class="txt_l" style="text-align: left; width: 73%" >
					                ${vo.content }                 
					            </td>
					            <td class="date" style="width: 11%; text-align: center;"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>			            
					        </tr>        
					        </c:forEach>
					    </c:if>                    
					    </tbody>
					    </table>
					</div>
