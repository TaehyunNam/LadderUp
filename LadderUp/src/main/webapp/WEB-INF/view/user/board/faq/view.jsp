<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script>
</script>
</head>
<body>									
										<table style="border-radius: 3px;">
											<thead style="border-bottom: solid 1.5px;">
												<tr class="txt_l">
					                                <th style="font-size: 24px; padding: 5; font-weight: bold;" >
					                                	<img src="<%=request.getContextPath()%>/img/Q_1.png" style="padding-bottom: 5px"> ${data.faq_title }
					                                </th>
			                                	</tr>
		                                	</thead>
											<tr>											
												<td colspan="10" style="font-size: 18px; padding: 10;"> ${data.faq_content }</td>
											</tr>
										</table>										
</body>
</html>