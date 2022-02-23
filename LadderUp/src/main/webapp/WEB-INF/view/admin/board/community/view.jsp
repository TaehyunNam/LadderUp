<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
	function goSave() {
		$.ajax({
			url:'/question_pool/comment/insert.do',
			type:'post',
			data:$("#frm").serialize(),
			success:function(res) {
				if (res.trim() == '1') {
					alert('댓글이 등록되었습니다.');
					commentList('community', ${data.community_no});
					$("td > #content").val("");
				} else {
					alert('등록 오류');
				}
			}
		});
	}
	
	function commentList(tablename, community_no) {
		$.ajax({
			url:'/question_pool/comment/list.do',
			data:{tablename:tablename, community_no:community_no},
			success:function(res) {
				$("#commentArea").html(res);
			}
		});
	}
	$(function() {
		commentList('community', ${data.community_no});
	});
	function goDel(c_no) {
		if (confirm('댓글을 삭제하시겠습니까?')) {
			$.ajax({
				url:"/question_pool/comment/delete.do",
				data:{c_no:c_no},
				success:function(res) {
					if (res.trim() == '1') {
						alert('정삭적으로 삭제되었습니다.');
						commentList('community', ${data.community_no});						
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
<input type="hidden" name="community_no" value="${data.community_no}">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>자유게시판 - [읽기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
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
											${data.community_title }
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">내용</label></th>										
											<p><span>번호 :  <strong> ${data.community_no}</strong>  |  작성자 :  <strong>홍길동</strong> | 조회수 :  <strong>${data.community_readcount }</strong>  |  작성일 :  <strong><fmt:formatDate value="${data.community_date }" pattern="yyyy-MM-dd HH:mm:ss"/></strong> </span></p>										
										<td colspan="10">											
											${data.community_content }	
										</td>
									</tr>
								</tbody>
							</table>						
						<form method="post" name="frm" id="frm" action="" enctype="multipart/form-data" >
		                <input type="hidden" name="tablename" value="community">
		                <input type="hidden" name="community_no" value="${data.community_no }">
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
		                                    <a class="btns" href="javascript:goSave();"><strong>등록</strong> </a>		                                    
		                                </div>
		                            </td>
		                        </tr>
		                        </tbody>
		                    </table>
		                </form>	                
		                <div id="commentArea"></div>	                        
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="community.do"><strong>목록</strong></a>
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