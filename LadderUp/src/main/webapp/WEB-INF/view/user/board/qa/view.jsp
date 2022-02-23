<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script type="text/javascript">
	$(function() {
		commentList('qa', ${data.qa_no});
	});
	function commentList(tablename, qa_no) {
		$.ajax({
			url:'/question_pool/comment/list.do',
			data:{tablename:tablename, qa_no:qa_no},
			success:function(res) {
				$("#commentArea").html(res);
			}
		});
	}	
</script>
</head>
<body> 
<div id="wrap">
<input type="hidden" name="qa_no" value="${data.qa_no}">
	<!-- canvas -->
	<div id="canvas">		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>Q&A - [상세페이지]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="10%" />
									<col width="15%" />
									<col width="25%" />
									<col width="25%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">분류</label></th>
										<td colspan="10">
											${data.qa_division}
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">제목</label></th>
										<td colspan="10">
											${data.qa_title }
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">내용</label></th>										
											<p><span>번호 :  <strong> ${data.qa_no}</strong>  |  작성자 :  <strong>${data.user_name }</strong> | 조회수 :  <strong>${data.qa_readcount }</strong>  |  작성일 :  <strong><fmt:formatDate value="${data.qa_date }" pattern="yyyy-MM-dd HH:mm:ss"/></strong> </span></p>										
										<td colspan="10">											
											${data.qa_content }
										</td>
									</tr>
								</tbody>
							</table>
							<c:if test="${!empty userInfo}">
							<form method="post" name="frm" id="frm" action="" enctype="multipart/form-data" >
			                <input type="hidden" name="tablename" value="qa">
			                <input type="hidden" name="qa_no" value="${data.qa_no }">
			                <input type="hidden" name="user_no" value="${userInfo.user_no}">
			                <input type="hidden" name="admin_no" value="${adminInfo.admin_no}">			                
			                    <table class="board_write">
			                        <colgroup>
			                            <col width="*" />
			                            <col width="100px" />
			                        </colgroup>
			                        <tbody>
			                        <tr>
			                            <td>
			                                <textarea name="content" id="content" style="height:50px;"></textarea>
			                            </td>
			                            <td>
			                                <div class="btnSet"  style="text-align:center;">
			                                    <a class="btns" href="javascript:goSave();"><strong>댓글등록</strong> </a>		                                    
			                                </div>
			                            </td>
			                        </tr>
			                        </tbody>
			                    </table>
			                </form>
			                </c:if>
							<div id="commentArea"></div>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="/question_pool/user/board/qa/qa.do"><strong>목록</strong></a>
								</div>
								<c:if test="${!empty userInfo && userInfo.user_no == data.user_no}">
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" href="/question_pool/user/board/qa/edit.do?qa_no=${data.qa_no }"><strong>글수정</strong></a>
									<a class="btns" style="cursor:pointer;" href="/question_pool/user/board/qa/delete.do?qa_no=${data.qa_no }"><strong>글삭제</strong></a>
								</div>
								</c:if>
							</div>
							<!--//btn-->
						</div>
						<!-- //bread -->
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