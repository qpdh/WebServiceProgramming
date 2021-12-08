<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./community.css">
<script src="./community.js"></script>
</head>
<body>

	<%--
	TODO 헤더 추가되면 주석 제거할 것
	<%@page import="header.jsp"%>
	--%>

	<%--Left Floating View --%>
	<div class="left-floating">
		<div class="floating-menu" onclick="orderLikes()">
			<img src="./../images/likes.png"> 좋아요
		</div>
		<div class="floating-menu" onclick="orderRecent()">
			<img src="./../images/recent.png"> 최신순
		</div>
	</div>


	<%--Right Floating View --%>
	<div class="right-floating">
		<div class="floating-menu" onclick="writeCommunity()">
			<img src="./../images/write.png">글쓰기
		</div>
		<div class="floating-menu" onclick="scrollToTop();return false;">
			<img src="./../images/top.png">상단으로
		</div>
	</div>


	<%--검색 --%>
	<div class="search" align="right">
		<input class="search-input" type="text" name="input_tag"
			placeholder="태그를 입력하세요" /> <img class="search-img"
			src="./../images/search.png" alt="검색">
	</div>

	<%-- 게시글들 --%>
	<div class="container">
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>
		<h1>길이 늘리기</h1>

	</div>



</body>
</html>