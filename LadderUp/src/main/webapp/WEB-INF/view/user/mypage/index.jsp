<%@ page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html lang="ko">
<head>
<title><%=userUtil.Property.title%></title>
<%@ include file="/WEB-INF/view/user/include/headHtml.jsp"%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>

.box {
	border: 3px solid rgb(173, 173, 173);
	display: float;
}

.box:hover {
	border-color: rgb(66, 66, 66);
}
/* Rules for sizing the icon. */

.material-icons.md-18 { font-size: 18px; }

.material-icons.md-24 { font-size: 24px; }

.material-icons.md-36 { font-size: 36px; }

.material-icons.md-48 { font-size: 48px; }



/* Rules for using icons as black on a light background. */

.material-icons.md-dark { color: rgba(0, 0, 0, 0.54); }

.material-icons.md-dark.md-inactive { color: rgba(0, 0, 0, 0.26); }



/* Rules for using icons as white on a dark background. */

.material-icons.md-light { color: rgba(255, 255, 255, 1); }

.material-icons.md-light.md-inactive { color: rgba(255, 255, 255, 0.3); }

.box notice {
	width: 300px;
}
</style>
</head>
<body>
	<div id="boardWrap" class="bbs">
	<input type="hidden" name="user_no" value="${vo.user_no}">
		<div class="main">
			<div class="wid48 fl_l">
				<a href="myinfo.do">
					<div class="box notice" style="text-align:center;" >
					<span class="material-icons md-48"><br> assignment_ind<br> </span>
						<ul>
							<li><h2>Profile</h2></li>
							<li>회원정보</li>
							<li>회원님의 개인정보를 관리하는 공간입니다<br><br></li>
						</ul>
					</div>
				</a>
				<div class="box notice" style="text-align: center; cursor: pointer;" onclick="location.href='/question_pool/user/mypage/myboard.do'">
					<span class="material-icons md-48"><br>border_color<br></span>
					<ul onclick="location.href='myboard.do" style="cursor: pointer;">
						<li><h2>Board</h2></li>
						<li>게시물관리</li>
						<li>회원님께서 작성하신 게시물을 관리하는 공간입니다.<br><br></li>						
					</ul>
				</div>
			</div>
			<div class="wid48 fl_r">
				<a href="myExams.do">
					<div class="box notice" style="text-align: center;">
					<span class="material-icons md-48"><br>format_list_numbered<br></span>								
						<ul>
							<li><h2>Exams</h2></li>
							<li>내가 푼 문제</li>
							<li>회원님께서 푸신 문제들을 조회하는 공간입니다.<br><br></li>
						</ul>
					</div>
				</a>
				<div class="box notice" style="text-align: center; cursor: pointer;" onclick="location.href='/question_pool/user/mypage/payRecord.do'">
				<span class="material-icons md-48"><br>card_membership<br></span>
					<ul>
						<li><h2>Membership</h2></li>
						<li>결제 내역</li>
						<li>회원님께서 결제하신 기간권을 관리하는 공간입니다.<br><br></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!--//contentsWrap-->
</body>
</html>
