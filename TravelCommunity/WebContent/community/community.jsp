<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.CommunityDTO"%>
<!DOCTYPE html>
<%
//로그인 임시로 추가
session.setAttribute("user_id", "root");

String user_id = (String) session.getAttribute("user_id");

List<CommunityDTO> communityList = (List) request.getAttribute("communityList");
int total_record = ((Integer) request.getAttribute("total_record")).intValue();
int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
int total_page = ((Integer) request.getAttribute("total_page")).intValue();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./community.css">
<link rel="stylesheet2" href="./../resources/css/bootstrap.min.css" />
<script type="text/javascript">
function orderLikes() {
	alert("orderLikes()");
}

function orderRecent() {
	alert("orderRecent()");
}

function writeCommunity() {
	if (${user_id == null}) {
		alert("로그인 해주세요.");
		return false;
	}

	location.href = "./CommunityWriteForm.community?user_id=<%=user_id%>"
}

// 맨 위로 버튼을 누르면, 맨 위로 올라가는 메소드
var timeOut;
function scrollToTop() {

	if (document.body.scrollTop != 0 || document.documentElement.scrollTop != 0) {
		window.scrollBy(0, -50);
		timeOut = setTimeout('scrollToTop()', 5);
	} else {
		clearTimeout(timeOut);
	}
}


$(function(){  //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
    getList(page);
    page++;
}); 

$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
    if($(window).scrollTop() >= $(document).height() - $(window).height()){
    	getList(page);
    	page++; 
    	alert("호출");
    } 
});




</script>

</head>
<body>


	<jsp:include page="/assets/jsp/header.jsp" />


	<%--Left Floating View --%>
	<div class="left-floating">
		<div class="floating-menu" onclick="orderLikes()">
			<img src="./../resources/images/likes.png"> 좋아요
		</div>
		<div class="floating-menu" onclick="orderRecent()">
			<img src="./../resources/images/recent.png"> 최신순
		</div>
	</div>


	<%--Right Floating View --%>
	<div class="right-floating">
		<div class="floating-menu" onclick="writeCommunity()">
			<img src="./../resources/images/write.png">글쓰기
		</div>
		<div class="floating-menu" onclick="scrollToTop();return false;">
			<img src="./../resources/images/top.png">상단으로
		</div>
	</div>


	<%--검색 --%>
	<div class="search" align="right">
		<input class="search-input" type="text" name="input_tag"
			placeholder="태그를 입력하세요" /> <img class="search-img"
			src="./../resources/images/search.png" alt="검색">
	</div>

	<%-- 게시글들 --%>
	<div class="container">

		<%
		for (int j = 0; j < communityList.size(); j++) {
			CommunityDTO notice = communityList.get(j);
		%>
		<div class="card">
			<p>
				작성자 :
				<%=notice.getUser_id()%></p>
			<p>
				제목 :
				<%=notice.getTitle()%></p>
			<p>
				내용 :
				<%=notice.getComment()%></p>
			<p>
				태그 :
				<%=notice.getTag()%></p>
			<p>
				작성일 :
				<%=notice.getDate()%></p>
			<p>
				좋아요 수
				<%=notice.getLikes()%></p>
			<hr>
		</div>
		<%
		}
		%>


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
	<jsp:include page="/assets/jsp/footer.jsp" /></body>
</html>