<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script type="text/javascript">
	function goSave() {
		$.ajax({
			url:'/question_pool/comment/insert.do',
			type:'post',
			data:$("#frm").serialize(),
			success:function(res) {
				if (res.trim() == '1') {
					alert('댓글이 등록되었습니다.');
					commentList('notice', ${data.notice_no});
					$("td > #content").val("");
				} else {
					alert('등록 오류');
				}
			}
		});
	}
	$(function() {
		commentList('notice', ${data.notice_no});
	});
	function commentList(tablename, notice_no) {
		$.ajax({
			url:'/question_pool/comment/list.do',
			data:{tablename:tablename, notice_no:notice_no},
			success:function(res) {
				$("#commentArea").html(res);
			}
		});
	}	
	function goDel(c_no) {
		if (confirm('댓글을 삭제하시겠습니까?')) {
			$.ajax({
				url:"/question_pool/comment/delete.do",
				data:{c_no:c_no},
				success:function(res) {
					if (res.trim() == '1') {
						alert('정삭적으로 삭제되었습니다.');
						commentList('notice', ${data.notice_no});						
					} else {
						alert('삭제 오류');
					}
				}
			})
		}
	}
</script>
</head>
<body> 
<div id="wrap">
<input type="hidden" name="notice_no" value="${data.notice_no}">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: containerArea-->
		<div id="container" style="width:100%;">
			<div id="content">
				<div class="con_tit">
					<h2>공지사항 - [상세페이지]</h2>
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
										<th scope="row"><label for="">제목</label></th>
										<td colspan="10">
											${data.notice_title }
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">내용</label></th>										
											<p><span>번호 :  <strong> ${data.notice_no}</strong>  |  작성자 :  <strong>${data.admin_name }</strong> | 조회수 :  <strong>${data.notice_readcount }</strong>  |  작성일 :  <strong><fmt:formatDate value="${data.notice_date }" pattern="yyyy-MM-dd HH:mm:ss"/></strong> </span></p>										
										<td colspan="10">											
											${data.notice_content }											
											
											<c:if test="${!empty data.notice_file_real }">											
												<img src="/question_pool/upload/${data.notice_file_real }">											
											</c:if>
											<c:if test="${empty data.notice_file_real }">											
												<img src="">											
											</c:if>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">첨부파일</label></th>
										<td colspan="10">
												<div class="file">
													<a href="/question_pool/common/download.jsp?path=/upload/&org=${data.notice_file_org}&real=${data.notice_file_real}" 
                       								target="_blank">${data.notice_file_org } </a>
												</div>
										</td>
									</tr>
								</tbody>
							</table>
							<c:if test="${!empty userInfo}">
							<form method="post" name="frm" id="frm" action="" enctype="multipart/form-data" >
			                <input type="hidden" name="tablename" value="notice">
			                <input type="hidden" name="notice_no" value="${data.notice_no }">
			                <input type="hidden" name="user_no" value="${userInfo.user_no}">
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
									<a class="btns" href="notice.do"><strong>목록</strong></a>
								</div>
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