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
$(function(){ 
	$('#word2').ready(function(){
		$("#word2").submit();
	})
})
</script>
</head>

<body>
<form name=word2 id="word2" method="post" action="/question_pool/user/question/study/word.do">
 	<input type="hidden" name="user_no" value="${userInfo.user_no }"> 
 </form>
</body>
</html>