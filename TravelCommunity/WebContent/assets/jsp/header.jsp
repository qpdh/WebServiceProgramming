<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<%
String user_id = (String) session.getAttribute("user_id");
%>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/assets/css/main.css" />
<title>여행 어디가</title>
<style>
body {
	margin: 0px;
}

.menu {
	position: relative;
	height: 60px;
	background: #2b2f3a;
	width: auto;
}

.menu ul {
	list-style: none;
	padding: 0;
	margin: 0;
	line-height: 1;
}

.menu>ul {
	position: relative;
	display: block;
	background: #000000;
	width: 100%;
	z-index: 500;
}

.menu:after, .menu>ul:after {
	content: ".";
	display: block;
	clear: both;
	visibility: hidden;
	line-height: 0;
	height: 0;
}

.menu.align-right>ul>li {
	float: right;
}

.menu.align-center ul {
	text-align: center;
}

.menu.align-center ul ul {
	text-align: left;
}

.menu>ul>li {
	display: inline-block;
	position: relative;
	margin: 0;
	padding: 0;
}

.menu>ul>#menu-button {
	display: none;
}

.menu ul li a {
	display: block;
	font-family: Helvetica, sans-serif;
	text-decoration: none;
}

.menu>ul>li>a {
	font-size: 25px;
	font-weight: bold;
	padding: 20px 25px;
	color: #fff;
	text-transform: uppercase;
	-webkit-transition: color 0.25s ease-out;
	-moz-transition: color 0.25s ease-out;
	-ms-transition: color 0.25s ease-out;
	-o-transition: color 0.25s ease-out;
	transition: color 0.25s ease-out;
}

.menu>ul>li.sub>a {
	padding-right: 32px;
}

.menu>ul>li:hover>a {
	color: #ffffff;
}

.menu li.sub::after {
	display: block;
	content: "";
	position: absolute;
	width: 0;
	height: 0;
}

.menu>ul>li.sub::after {
	right: 10px;
	top: 20px;
	border: 5px solid transparent;
	border-top-color: #7a8189;
}

.menu>ul>li:hover::after {
	border-top-color: #ffffff;
}

.menu ul ul {
	position: absolute;
	left: -9999px;
	top: 70px;
	opacity: 0;
	-webkit-transition: opacity .3s ease, top .25s ease;
	-moz-transition: opacity .3s ease, top .25s ease;
	-ms-transition: opacity .3s ease, top .25s ease;
	-o-transition: opacity .3s ease, top .25s ease;
	transition: opacity .3s ease, top .25s ease;
	z-index: 1000;
}

.menu ul ul ul {
	top: 50x;
	padding-left: 5px;
}

.menu ul ul li {
	position: relative;
}

.menu>ul>li:hover>ul {
	left: auto;
	top: 44px;
	opacity: 1;
}

.menu.align-right>ul>li:hover>ul {
	left: auto;
	right: 0;
	opacity: 1;
}

.menu ul ul li:hover>ul {
	left: 170px;
	top: 0;
	opacity: 1;
}

.menu.align-right ul ul li:hover>ul {
	left: auto;
	right: 170px;
	top: 0;
	opacity: 1;
	padding-right: 5px;
}

.menu ul ul li a {
	width: 130px;
	border-bottom: 1px solid #eeeeee;
	padding: 10px 20px;
	font-size: 20px;
	color: #000000;
	background: #ffffff;
	-webkit-transition: all .35s ease;
	-moz-transition: all .35s ease;
	-ms-transition: all .35s ease;
	-o-transition: all .35s ease;
	transition: all .35s ease;
}

.menu.align-right ul ul li a {
	text-align: right;
}

.menu ul ul li:hover>a {
	background: #f2f2f2;
	color: #8c9195;
}

.menu ul ul li:last-child>a, .menu ul ul li.last>a {
	border-bottom: 0;
}

.menu>ul>li>ul::after {
	content: '';
	border: 6px solid transparent;
	width: 0;
	height: 0;
	border-bottom-color: #ffffff;
	position: absolute;
	top: -12px;
	left: 30px;
}

.menu.align-right>ul>li>ul::after {
	left: auto;
	right: 30px; . menu .align-right ul ul li.sub : : after {
  border-left-color : transparent;
	border-right-color: #9ea2a5;
	right: auto;
	left: 10px;
}

.menu ul ul li.sub:hover::after {
	border-left-color: #ffffff;
	right: -5px;
	-webkit-transform: rotateY(180deg);
	-ms-transform: rotateY(180deg);
	-moz-transform: rotateY(180deg);
	-o-transform: rotateY(180deg);
	transform: rotateY(180deg);
}

.menu.align-right ul ul li.sub:hover::after {
	border-right-color: #ffffff;
	border-left-color: transparent;
	left: -5px;
	-webkit-transform: rotateY(180deg);
	-ms-transform: rotateY(180deg);
	-moz-transform: rotateY(180deg);
	-o-transform: rotateY(180deg);
	transform: rotateY(180deg);
}
</style>
</head>

<body>
	<header id='header'>
		<center>

			<div class='menu'>
				<ul>
					<li><a href='/main.jsp'>여행 어디가</a></li>
					<%
					if (user_id == null || user_id == "") {
					%>
					<li><a href='/login.jsp'>로그인</a></li>

					<li><a href='/join.jsp'>회원가입</a></li>

					<%
					} else {
					%>

					<li><a href='/travel/travel.jsp'>여행지</a></li>

					<li><a href='/community/CommunityListAction.community'>커뮤니티</a></li>

					<li><img src="/images/user2.png" alt="" /><a
						href='/Mypage.jsp'></a></li>
					<%
					}
					%>
				</ul>
			</div>
		</center>
	</header>

</body>
</html>