<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
function wordcheck() {
	if ($("#word").val() == '') {
		alert('단어를 입력해 주세요');
		$("#word").focus();
		return false;
	}
	if ($("#mean").val() == '') {
		alert('뜻을 입력해 주세요');
		$("#mean").focus();
		return false;
	}
}
function deleteword(word_no) {
	if (confirm('댓글을 삭제하시겠습니까?')) {
		$.ajax({
			url:"/user/question/study/delete.do",
			data:{word_no:word_no},
			success:function(res) {
				if (res.trim() == '1') {
					alert('정삭적으로 삭제되었습니다.');
				} else {
					alert('삭제 오류');
				}
			}
		});
	}
}
</script>
</head>
<style>
table.type10 {
  border-collapse: collapse;
  width: 70%;
  text-align:center;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  margin-left: auto; margin-right: auto;
}
table.type10 thead th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
  background: #e7708d;
  margin: 20px 10px;
}
table.type10 tbody th {
  width: 150px;
  padding: 10px;
}
table.type10 td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
}
table.type10 .even {
  background: #fdf3f5;
}
tr:hover { background-color: #F5F5F5; } /* 커서 갖다대면 색깔이 바뀌며 직관적으로 표현한다 */

    #word,#mean {
    	width: 300px;
        height: 50px;
        border-top: none;
        border-left: none;
        border-right: none;
        border-bottom : 3px solid black;
    }
    #input2 {
    	width: 100px;
        height: 55px;
        border-top: none;
        border-left: none;
        border-right: none;
        border-bottom : 3px solid black;
    }
    h2 {
  position: relative;
  padding: 1rem 0.5rem;
  font-size: 50px;
}
h2::after {
  position: absolute;
  bottom: 0px;
  left: 0px;
  content: '';
  width: 100%;
  height: 6px;
  border-radius: 3px;
  background-image: -webkit-linear-gradient(right, #00b0ff 0%, #00e676 100%);
  background-image: linear-gradient(to left, #00b0ff 0%, #00e676 100%);
}





출처: https://nimolove.tistory.com/44 [Chaeni_vlog 🌈]

</style>
<body>
  <div class="container">
    <div class="search-header"></div>
    <h2> 단어장 </h2>
    <div class="search-content">
      <form action="/question_pool/user/question/study/insertwords.do" onsubmit="return wordcheck();">
       <input type="hidden" name="user_no" value="${userInfo.user_no}">
       <input id="word" name="word" class="word" type="text" placeholder="단어">
       <br>
       <input id="mean" name="mean" class="word" type="text" placeholder="뜻">
       <input type="submit" id="input2" value="등록">
      </form>
      <br>
      <br>
      <br>
      <br>
		<table border="1" width="70%" class="type10">
      	<thead>
			<tr>
				<th width="50%">단어</th>
				<th width="50%">뜻</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${empty list}">
	        <tr>
	            <td class="first" colspan="4">등록된 단어가 없습니다.</td>
	        </tr>
	    </c:if>                    
	    <c:if test="${!empty list}">
		<c:forEach var="list" items="${list }">                                    
          <input type="hidden" name="word_no" id="word_no" value="${list.word_no }">
          <tr>			                            				                            	
              <td>${list.word }</td>
              <td>${list.mean }</td>
              <td style="width: 20px; padding: 5px;">
	              <a href="delete.do?word_no=${list.word_no}" id="input2">X</a>
              </td>
          </tr>
         </c:forEach>
         </c:if>
		</tbody>
      </table>
    </div>
  </div>
</body>
</html>