<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.TravelDAO"%>
<%@page import="dto.TravelDTO"%>
<%@page import="dto.TravelReviewDTO"%>
<%@page import="dao.TravelReviewDAO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/module/dbconn.jsp"%>

<!-- 부트스트랩 코드들은 header.jsp와 합치게 되면 header.jsp부분에 추가할 예정 -->

<link rel="stylesheet" href="../css/placeDetail.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--검색창 css 소스-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="/assets/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 로그인 상태에서 아이디 세션값 받아오기  -->
<!-- 아직 로그인 합치기 전이라 임의로 값 지정 -->
<%
String id = null;
if (session.getAttribute("user_id") != null) {
	id = (String) session.getAttribute("user_id");

}
int num = Integer.parseInt(request.getParameter("index"));
String placename = request.getParameter("placename");
TravelDAO ddao = new TravelDAO();

ArrayList<TravelDTO> list = ddao.travel_detail(num);
%>
<title>여행지 상세보기</title>
<%@include file="/assets/jsp/header.jsp"%>
</head>
<body>
	<br>
	<br>
	<br>

	<div class="title_box"></div>
	<hr>
	<div class="title_top"><%=list.get(0).getLocate()%></div>
	<hr>
	<div class="container p-3 my-3 border">
		<h3>여행지 정보</h3>

		<div>
			<div style="text-align: center;" id="div_img">
				<img src="../images/<%=list.get(0).getPhoto1()%>" class="center_img"><br>
			</div>
			<div style="text-align: center;" id="div_img">
				<img src="../images/<%=list.get(0).getPhoto2()%>" class="center_img"><br>
			</div>
			<div style="text-align: center;" id="div_img">
				<img src="../images/<%=list.get(0).getPhoto3()%>" class="center_img"><br>
			</div>
		</div>

		<p id="info">
			<%=list.get(0).getInformation()%>
			<br> <br>
		</p>
	</div>
	<!-- 여행 상세보기 끝  -->

	<!--리뷰작성 시작 -->
	<div class="container p-3 my-3 border">
		<h3>리뷰 남기기</h3>
		<hr>

		<div id="form1">
			<!-- action 속성에 게시 누르면 DB연결되는 jsp 작성할 예정 -->
			<form action="review_Process.jsp?index=<%=num%>" method="post">
				<input type="hidden" name="placeName"
					value="<%=list.get(0).getLocate()%>">
				<table id="reviewForm">
					<tr style="height: 40px;">
						<th style="width: 50px">별점</th>
						<td><label id="lb"><input type="radio" name="star"
								value="star5.png">&nbsp;5점&nbsp; <img id="star"
								src="../images/star5.png"></label> &nbsp; <label id="lb"><input
								type="radio" name="star" value="star4.jpg">&nbsp;4점&nbsp;
								<img id="star" src="../images/star4.jpg"></label> &nbsp; <label
							id="lb"><input type="radio" name="star" value="star3.jpg">&nbsp;3점&nbsp;
								<img id="star" src="../images/star3.jpg"></label> &nbsp; <label
							id="lb"><input type="radio" name="star" value="star2.jpg">&nbsp;2점&nbsp;
								<img id="star" src="../images/star2.jpg"></label> &nbsp; <label
							id="lb"><input type="radio" name="star" value="star1.jpg">&nbsp;1점&nbsp;
								<img id="star" src="../images/star1.jpg"></label> &nbsp;</td>
					</tr>
					<tr style="height: 40px;">
						<th style="width: 50px">리뷰</th>

						<td><textarea style="width: 1030px;" maxlength="1024"
								name="review" class="form-control"></textarea></td>
					</tr>
					<tr style="height: 30px;">
						<td colspan="2"><input id="sub1" type="submit" value="게시"
							style="float: right;"></td>
					</tr>
				</table>
			</form>
		</div>
		<hr>

		<table class="table table-hover">
			<tr>
				<th>글 번호</th>
				<th>글쓴이</th>
				<th>리뷰글</th>
				<th>작성일</th>
				<th>별점</th>
			</tr>

			<%
			// 리뷰 항목 DB연결 할 부분
			%>
			<%
			TravelReviewDAO reviewDAO = new TravelReviewDAO();

			ArrayList<TravelReviewDTO> reviewList = reviewDAO.getReviewList(num);

			if (reviewList.size() == 0) {
			%>
			<tr>
				<td colspan="5" align="center">등록된 게시글이 없습니다.</td>
			</tr>
			<%
			}

			for (int i = 0; i < reviewList.size(); i++) {
			%>
			<tr>
				<td><%=i + 1%></td>
				<td><%=reviewList.get(i).getUserId()%></td>
				<td><%=reviewList.get(i).getComment()%></td>
				<td><%=reviewList.get(i).getDate()%></td>
				<td><img id="star"
					src="../images/<%=reviewList.get(i).getScore()%>"></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</body>
<%@include file="/assets/jsp/footer.jsp"%>
</html>