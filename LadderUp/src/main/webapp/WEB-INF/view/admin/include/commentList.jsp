<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
					<table class="list">
					    <colgroup>
					        <col width="80px" />
					        <col width="*" />
					        <col width="100px" />
					        <col width="100px" />
					    </colgroup>
					    <tbody>
					    <c:if test="${empty cList}">
					        <tr>
					            <td class="first" colspan="4">등록된 댓글이 없습니다.</td>
					        </tr>
					    </c:if>                    
					    <c:if test="${empty clist}">
					    	<c:forEach var="vo" items="${cList }">            
					        <tr>
					            <td></td>
					            <td class="txt_l" style="text-align: left; width: 73%" >
					                ${vo.content }                
					            </td>
					            <td class="writer" style="width: 7%; text-align: center;">
					            	<c:if test="${!empty vo.admin_no }">
					                	${vo.admin_name }
					                </c:if>
					                <c:if test="${!empty vo.user_no }">
					                	${vo.user_name }
					                </c:if>
					            </td>
					            <td class="date" style="width: 11%; text-align: center;"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>
					            <c:if test="${(!empty userInfo && userInfo.user_no == vo.user_no) || (!empty adminInfo) }">            
					            <td>            			                                   
								  	<a class="btns" style="cursor:pointer;" href="javascript:goDel(${vo.c_no });"><strong>삭제</strong></a>
					            </td>
					            </c:if>				            
					        </tr>        
					        </c:forEach>
					    </c:if>                    
					    </tbody>
					</table>
