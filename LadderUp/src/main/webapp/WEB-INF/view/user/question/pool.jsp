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
    margin: 0;
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
</head>
<script>
function chk(){
	if(school_no.value ==""){
		 alert("학교와 년도 그리고 학기를 선택하시오");
		 school_no.focus();
		 return false;
		 }
			$.ajax({
				url : 'showmetheexam.do',
				data : {
					exam_no : $("#exam_no").val()
				},
				async : false,
				success : function(res) {
					$("#examarea").html(res);
			}
		})
}
	function getyear(){
				$.ajax({
					url : 'showmetheyear.do',
					data : {
						school_no : $("#school_no").val()
					},
					async : false,
					success : function(res) {
						$("#yeararea").html(res);
				}
			})
		}
	
	
	function getsemester(){
		$.ajax({
			url : 'showmethesemester.do',
			data : {
				year : $("#year").val(),
				school_no : $("#school_no").val()
			},
			async : false,
			success : function(res) {
				$("#semesterarea").html(res);
		}
	})
}
	
</script>
<body>
	<div id="wrap">
			<h2> 문제 풀기 </h2>
		<!-- canvas -->
		<div id="canvas" style="text-align: center; padding: 100px 0 0 100px;'">
		<table>
			<tr>
				<td>
					<h4 style="font-size: 30px;">학교선택</h4>
					<select name="school_no" id="school_no"
					style="width: 200px; height: 40px; font-size:20px" onclick="getyear()">
					<option value="" selected disabled hidden>==선택하세요==</option>

						<c:forEach var="vo" items="${list}">
							<option value="${vo.school_no}">${vo.school_name}</option>
						</c:forEach>
					</select>
				</td>
				<td>
				<div id="yeararea"></div>
				</td>
				<td>
				<div id="semesterarea"></div>
				</td>
			</tr>
			<tr>
				<td colspan="3">
				<form name="frm" id="frm"  onclick="return chk();" enctype="multipart/form-data">
				<br/>
				<br/>
				<input type="button" value="문제 검색->" class="w-btn-outline w-btn-indigo-outline">
				</form>
				</td>
			</tr>
			<tr>
				<td colspan="3">
				<br/>
				<br/>
					<div id="examarea"></div>
				</td>
			</tr>			
		</table>
		</div>
		<!--//canvas -->
	</div>
	<!--//wrap -->

</body>
</html>