<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>여행지 - 서울</title>
<%@ include file="/module/dbconn.jsp"%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style>
.carousel-inner img {
	width: 100%;
	height: 560px;
}

h1 {
	font-weight: bold;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.top {
	width: 1110px;
	margin: auto;
	font-weight: 600;
}

#carousel-example-generic {
	width: 1110px;
	margin: auto;
}

.right_img {
	position: fixed;
	float: right;
	right: -200px;
	width: 400px;
	height: 250px;
	margin: 50px 100px 0px 0px;
	font-weight: 600;
}

#s {
	line-height: 1;
	height: 550px;
}

p {
	font-weight: 600;
}

.col-md-4:hover {
	transform: scale(1);
}

.card-text {
	font-size: 27px;
	color: salmon;
}

.card-text2 {
	height: 60px;
	margin: 5px 0px;
	font-size: 17px;
}

.btn-group {
	font-family: 'Cafe24Oneprettynight';
	font-weight: 600;
}

#bt {
	padding: 4px 10px;
	font-size: 15px;
	border: 1px solid #ccc;
	background-color: white;
	border-radius: 10px;
	box-shadow: 1px 1px 3px #ccc;
	font-weight: 600;
}

.item_active {
	text-align: center;
}

.jumbotron {
	padding-top: 3rem;
	padding-bottom: 3rem;
	margin-bottom: 0;
	background-color: #fff;
}

@media ( min-width : 768px) {
	.jumbotron {
		padding-top: 6rem;
		padding-bottom: 6rem;
	}
}

* /
.jumbotron h1 {
	font-weight: 300;
}

.jumbotron .container {
	max-width: 40rem;
}
</style>
</head>

<body>
	<div class="top">
		<h1 style="font-size: 50px; font-weight: 600">서울</h1>
	</div>
	<div class="container marketing">
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img id="s" src="../images/seoul1.jpg" alt="">
				</div>
				<div class="item">
					<img id="s" src="../images/seoul2.jpg" alt="">
				</div>
				<div class="item">
					<img id="s" src="../images/seoul3.jpg" alt="">
				</div>
				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<div class="album py-5 bg-light">
			<div class="container">
				<div class="row">

					<%
					request.setCharacterEncoding("utf-8");
					Statement stmt = null;
					PreparedStatement pstmt = null;
					String location = null;
					String image_name1 = null;
					String image_name2 = null;
					String image_name3 = null;
					String info = null;
					String photo1 = null;
					ResultSet rs = null;

					try {
						String SQL = "select id, locate, information, photo1 from travel";
						pstmt = conn.prepareStatement(SQL);
						rs = pstmt.executeQuery();
						while (rs.next()) {
							int id = rs.getInt(1);
							location = rs.getString(2);
							info = rs.getString(3).toString().substring(0, 30);
							photo1 = rs.getString(4);
					%>
					<div class="col-md-4">
						<div class="card mb-4 shadow-sm">
							<div class="item_active">
								<img src="../images/<%=photo1%>"
									class="bd-placeholder-img card-img-top" width="100%"
									height="225" preserveAspectRatio="xMidYMid slice"
									focusable="false" role="img">

							</div>
							<div class="card-body">
								<p class="card-text">
									#<%=location%></p>
								<p class="card-text2"><%=info%>....
								</p>

								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<a href="./travel_detail.jsp?index=<%=id%>"
											class="btn btn-sm btn-outline-secondary" id="bt">보기</a>
									</div>
									<small class="text-muted"></small>
								</div>
							</div>
						</div>
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
					%>

				</div>
			</div>
		</div>
</body>
</html>