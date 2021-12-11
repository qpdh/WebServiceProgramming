<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 로그인 상태에서 아이디 세션값 받아오기  -->
<!-- 아직 로그인 합치기 전이라 임의로 값 지정 -->
<%
	String id = "jiyoon";
	/* String id = null;
	if(session.getAttribute("id") != null){
		id = (String) session.getAttribute("id");
} */
%>
<title>여행지 상세보기</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("index"));
		Statement stmt = null;
		PreparedStatement pstmt = null;
		String location = null;
		String image_name1 = null;
		String image_name2 = null;
		String image_name3 = null;
		String info = null;
		ResultSet rs = null;

		try {
			String SQL = "select * from travel where id = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				location = rs.getString(2);
				image_name1 = rs.getString(3);
				image_name2 = rs.getString(4);
				image_name3 = rs.getString(5);
				info = rs.getString(6);
	%>
	<div class="title_box"></div>
	<hr>
	<div class="title_top"><%=location%></div>
	<hr>
	<div class="container p-3 my-3 border">
		<h3>여행지 정보</h3>

		<div>
			<div style="text-align: center;" id="div_img">
				<img src="../images/<%=image_name1%>" class="center_img"><br> 
			</div>
			<div style="text-align: center;" id="div_img">
				<img src="../images/<%=image_name2%>" class="center_img"><br>
			</div>
			<div style="text-align: center;" id="div_img">
				<img src="../images/<%=image_name3%>" class="center_img"><br>
			</div>
		</div>

		<p id="info">
			<%=info%>
			<br> <br>
		</p>
	</div>
	<%
			}
		} catch (SQLException ex) {
			out.println(ex.getMessage());
			out.println("실패");
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	%> <!-- 여행 상세보기 끝  -->
	
	<!--리뷰작성 시작 -->
<div class="container p-3 my-3 border">
<h3>리뷰 남기기 </h3>
<hr>

<div id="form1">
<!-- action 속성에 게시 누르면 DB연결되는 jsp 작성할 예정 -->
<form action="#" method="post">
<input type="hidden" name="placeName" value="<%=location%>">
<table id="reviewForm">
	<tr style="height: 40px;">
		<th style="width: 50px">별점</th>
		<td>
			<label id="lb"><input type="radio" name="star" value="star5.png">&nbsp;5점&nbsp; <img id="star" src="../images/star5.png"></label> &nbsp;
			<label id="lb"><input type="radio" name="star" value="star4.jpg">&nbsp;4점&nbsp; <img id="star" src="../images/star4.jpg"></label> &nbsp;
			<label id="lb"><input type="radio" name="star" value="star3.jpg">&nbsp;3점&nbsp; <img id="star" src="../images/star3.jpg"></label> &nbsp;
			<label id="lb"><input type="radio" name="star" value="star2.jpg">&nbsp;2점&nbsp; <img id="star" src="../images/star2.jpg"></label> &nbsp;
			<label id="lb"><input type="radio" name="star" value="star1.jpg">&nbsp;1점&nbsp; <img id="star" src="../images/star1.jpg"></label> &nbsp;
		</td>		
	</tr>
	<tr style="height: 40px;">
		<th style="width: 50px">리뷰</th>
		
		<td><textarea style="width: 1030px;" maxlength="1024" name="review" class="form-control"></textarea></td>
	</tr>
	<tr style="height: 30px; ">
		<td colspan="2"><input id="sub1" type="submit" value="게시" style ="float : right; "></td>
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
   		<tr>
			<td colspan="5" align="center">등록된 게시글이 없습니다.</td>
		</tr>
		
		<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		</tr>
</table>
</div>
</body>
</html>