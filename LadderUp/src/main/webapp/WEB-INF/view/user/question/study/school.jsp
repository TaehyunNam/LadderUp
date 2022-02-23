<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp"%>
<style>
.w-btn-outline:active {
    transform: scale(1.5);
}
.w-btn-outline:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}
.w-btn-outline {
    position: relative;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-indigo {
    background-color: aliceblue;
    color: #1e6b7b;
}
.w-btn-indigo-outline {
    border: 3px solid aliceblue;
    color: #1e6b7b;
}

.w-btn-indigo-outline:hover {
    color: #1e6b7b;
    background: aliceblue;
}
.submit {
	border: 0.5px solid #ff0080; /*---테두리 정의---*/
	background-Color: #AB9D9D; /*--백그라운드 정의---*/
	font: 12px 굴림; /*--폰트 정의---*/
	font-weight: bold; /*--폰트 굵기---*/
	color: #000000; /*--폰트 색깔---*/
	width: 130;
	height: 30; /*--버튼 크기---*/
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

 select {
          justify-content: center;
    display: flex;
    -moz-appearance: none;
    -webkit-appearance: none;
    appearance: none;
    font-size: 1rem;
    font-weight: 400;
    color: #444;
    background-color: #fff;
    padding: 0.3em 1.4em 0.2em 0.8em;
    margin: auto;
    border: 1px solid #aaa;
    border-radius: 0.5em;
    box-shadow: 0 1px 0 1px rgb(0 0 0 / 4%);
    align-items: center;
    }

    select:hover {
      border-color: #888;
    }

    select:focus {
      border-color: #aaa;
      box-shadow: 0 0 1px 3px rgba(59, 153, 252, .7);
      box-shadow: 0 0 0 3px -moz-mac-focusring;
      color: #222;
      outline: none;
    }

    select:disabled {
      opacity: 0.5;
    }

    label {
      font-family: "Noto Sans KR", sans-serif;
      font-size: 1rem;
      font-weight: 600;
      line-height: 1.3;
      color: #444;
      margin-right: 0.5em;
    }
</style>
<script>
function check_submit() {
 if(school.school_no.value ==""){
 alert("학교를 선택하시오");
 school.school_no.focus();
 return false;
 }
}
</script>
</head>
<body>
	<div id="wrap">
		<h2> 랜덤모의고사 풀기 </h2>
		<!-- canvas -->
		<div id="canvas">
			<!-- 학교/연도/회차 선택 페이지 -->
			<form action="randomIndex.do" enctype="multipart/form-data"
				style="text-align: center;" name="school" onsubmit="return check_submit();">
				<div style="text-align: center; padding: 100px 0 0 0;'">
					<h4 style="font-size: 30px;">학교선택</h4>
				<h3>학교를 선택하시면 학교 기출문제중 년도와 상관없이 랜덤으로 문제가 제공됩니다.</h3>
				<br>
					<select name="school_no" id="school_no"
						style="width: 200px; height: 40px; font-size:20px">
						<option value="" selected disabled hidden>==선택하세요==</option>
						<c:forEach var="vo" items="${list}">
							<option value="${vo.school_no}">${vo.school_name}</option>
						</c:forEach>
					</select>
				</div>
				<br/>
				<br/>
				<br/>
						<input type="submit" value="랜덤모의고사 시작" class="w-btn-outline w-btn-indigo-outline">
			</form>
		</div>
		<!--//canvas -->
	</div>
	<!--//wrap -->

</body>
</html>