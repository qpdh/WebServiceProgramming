<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.CommunityDTO, dto.CommunityCommentDTO"%>
<%@ include file="/module/dbconn.jsp"%>
<!DOCTYPE html>

<%
//로그인 임시로 추가

String user_id = (String) session.getAttribute("user_id");

List<CommunityDTO> communityList = (List) request.getAttribute("communityList");
int total_record = ((Integer) request.getAttribute("total_record")).intValue();
int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
int total_page = ((Integer) request.getAttribute("total_page")).intValue();

System.out.println("community.jsp의 pageNum : " + pageNum);
%>
<html>
<head>
<meta charset="UTF-8">
<title>여행 어디가</title>

<link rel="stylesheet" href="./../assets/css/bootstrap-theme.min.css" />
<link rel="stylesheet" href="./../assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="./../assets/css/jumbotron-narrow.css">
<link rel="stylesheet" href="./community.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

function writeComment(){
	if(${user_id == null}){
		alert("로그인 해주세요.");
		return false;
	}
	
	location.href="./CommunityCommentWriteAction.community?user_id=<%=user_id%>"
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

function search(){
	alert("search()");
	if(!document.body.input_tag.value){
		alert("검색어를 입력하세요.");
	}
}

</script>
</head>

<body>


	<jsp:include page="/assets/jsp/header.jsp" />


	<%--Left Floating View --%>
	<div class="right-floating">
		<button type="button" class="btn btn-default" onclick="orderLikes()">
			<p>
				<img src="./../resources/images/likes.png">
			</p>
			<p>좋아요</p>
		</button>
		<button type="button" class="btn btn-default" onclick="orderRecent()">
			<p>
				<img src="./../resources/images/recent.png">
			</p>
			<p>최신순</p>
		</button>
	</div>

	<%--Right Floating View --%>
	<div class="left-floating">
		<button class="btn btn-default" onclick="writeCommunity()">
			<p>
				<img src="./../resources/images/write.png">
			</p>
			<p>글쓰기</p>
		</button>
		<button class="btn btn-default" onclick="scrollToTop();return false;">
			<p>
				<img src="./../resources/images/top.png">
			</p>
			<p>상단으로
		</button>
	</div>

	<%-- 게시글들 --%>
	<div class="container" id="container1">

		<%--검색 --%>
		<form class="form-inline" method="post"
			action="/community/CommunityListAction.community">

			<input class="form-control input-lg" id="formGroupInputLarge"
				type="text" name="input_tag" placeholder="태그를 입력하세요">
			<button type="submit" class="btn btn-default">
				<img class="search-img" src="./../resources/images/search.png"
					alt="검색" onclick="search()">
			</button>

		</form>


		<%
		System.out.println("갱신 후 사이즈 : " + communityList.size());
		for (int j = 0; j < communityList.size(); j++) {
			CommunityDTO notice = communityList.get(j);
		%>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title"><%=notice.getTitle()%></h3>
			</div>
			<div class="panel-body">
				<p>
					작성자 :
					<%=notice.getUser_id()%></p>
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

				<%--<p>
					댓글
					<%
				for (int i = 0; i < notice.getComments().size(); i++) {
					CommunityCommentDTO comment = notice.getComments().get(i);
				%>
				
				<p>
					작성자 :
					<%=comment.getUser_id()%>
				<p>
					댓글 내용 :
					<%=comment.getComment()%>
					<%
					}
					%>
				
				<form class="form-inline" method="post"
					action="./CommunityCommentWriteAction.community">
					<input type="hidden" name="user_id" value=<%=user_id%>> <input
						type="hidden" name="community_id" value="<%=notice.getId()%>">

					<div class="form-group">
						<input class="form-control" type="text" name="content"
							placeholder="댓글 작성">
					</div>

					<button class="btn btn-primary" type="submit">게시</button>
				</form>

			</div> --%>
			</div>
		</div>
		<%
		}
		%>
	</div>

	<jsp:include page="/assets/jsp/footer.jsp" />
</body>
</html>