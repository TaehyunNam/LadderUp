<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="util.*" %>
		<li class="login"><a href="/question_pool/user/logout.do">로그아웃</a></li>
		<li class="mypage"><a href="javascript:;" onclick="clickMenu('main2', 'Mypage', '/user/mypage/index.do', false)" >마이페이지 (${userInfo.user_email})</a></li> 
