<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="dao.CommunityDAO"%>
<%@page import="dto.CommunityDTO"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/community_best.css">

<meta charset="UTF-8">
<title>커뮤니티</title>
<!--검색창 css 소스-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"> -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style type="text/css">
.my {
	text-align: center;
	font-size: 20px;
}
</style>
</head>
<%@include file="/assets/jsp/header.jsp"%>
<br>
<br>
<br>
<br>
<br>
<body>
	<div class="my">
		<img src="/images/user.png" class="center_img" style="width: 150px;"><br>
		<br>
		<%
		String id = null;
		if (session.getAttribute("user_id") != null) {
			id = (String) session.getAttribute("user_id");
		}
		%>
		<a><%=id%></a><br> <a href="/logout.jsp">로그아웃</a>
		<hr style="margin: 40px;">
	</div>
	<div class="feed" style="height: 300px;">
		<br>
		<%
		CommunityDAO dao = CommunityDAO.getInstance();
		ArrayList<CommunityDTO> list = dao.getmypage(id);
		if (list.size() == 0) {
		%>
		<p id="none">등록된 게시글이 없습니다.</p>
		<%
		}

		for (int i = 0; i < list.size(); i++) {
		%>
		<div id="cmb_img_div" class="col-xs-6 col-md-4">

			<a class="thumbnail"
				href="/community/CommunityViewAction.community?num=<%=list.get(i).getId()%>">
				<img id="cmb_img"
				src="c:/WebProject/Community/<%=list.get(i).getFile_name()%>" />
			</a>
		</div>
		<%
		}
		%>

	</div>
	<br>
	<br>
	<br>
	<br>

</body>
<%@include file="/assets/jsp/footer.jsp"%>
</html>