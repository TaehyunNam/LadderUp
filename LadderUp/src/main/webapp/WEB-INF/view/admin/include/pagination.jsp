<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
function fn_paging(curPage){
    location.href="notice.do?curPage="+curPage;
}
</script>																						
								<c:if test="${pagination.curRange ne 1 }">
			                        <a href="#" onClick="fn_paging(1)">
			                        	<<
			                        </a> 
			                    </c:if>
			                    <c:if test="${pagination.curPage ne 1}">
			                        <a href="#" onClick="fn_paging('${pagination.prevPage }')">
			                        	<
			                        </a> 
			                    </c:if>
			                    <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
			                        <c:choose>
			                            <c:when test="${pageNum eq  pagination.curPage}">
			                                <span style="font-weight: bold;"><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></span> 
			                            </c:when>
			                            <c:otherwise>
			                                <a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a> 
			                            </c:otherwise>
			                        </c:choose>
			                    </c:forEach>
			                    <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
			                        <a href="#" onClick="fn_paging('${pagination.nextPage }')">
			                        	>
			                        </a> 
			                    </c:if>
			                    <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
			                        <a href="#" onClick="fn_paging('${pagination.pageCnt }')">
			                        	>>
			                        </a> 
			                    </c:if>
							