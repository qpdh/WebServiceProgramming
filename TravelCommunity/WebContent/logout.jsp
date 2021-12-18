<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>여행 어디가</title>
</head>
<body>
	<%
	session.invalidate();
	response.sendRedirect("login.jsp");
	%>
</body>
</html>