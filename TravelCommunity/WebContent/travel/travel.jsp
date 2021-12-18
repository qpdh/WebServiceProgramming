<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행</title>
<%@include file="/assets/jsp/header.jsp"%>
<link rel="stylesheet" href="/assets/css/area.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

</head>
<body>
	<br>
	<br>
	<br>

	<div class=main_title>
		<h1 align="center">국내 주요 도시</h1>
		<h3 align="center">이미지를 클릭해주세요</h3>
	</div>
	<div class="container" align="center">
		<div class="row">

			<div class="col-md-4">
				<br> <a href=" ./seoul.jsp "><img
					src="../images/gyeongbokgung1.jpg" alt="1" class="img-thumbnail"
					width="300px" height="300px"></a>
				<h3>서울</h3>

			</div>
			<div class="col-md-4">
				<br> <a href=" ./jeju.jsp "><img
					src="../images/Hallasan Mountain.jpg" alt="2" class="img-thumbnail"
					width="300px" height="300px"></a>
				<h3>제주</h3>

			</div>
			<div class="col-md-4">
				<br> <a href=" ./busan.jsp "><img
					src="../images/Haeundae Beach.jpg" alt="3" class="img-thumbnail"
					width="300px" height="300px"></a>
				<h3>부산</h3>
			</div>
		</div>
		<br>

	</div>

</body>
<%@include file="/assets/jsp/footer.jsp"%>
</html>