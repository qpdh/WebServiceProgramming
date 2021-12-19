<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.CommunityDTO, dto.CommunityCommentDTO"%>
<%@ include file="/module/dbconn.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<%
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
<!-- Scripts -->

<link rel="stylesheet" href="/assets/css/bootstrap-theme.min.css" />
<link rel="stylesheet" href="/assets/css/bootstrap.min.css" />
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
<jsp:include page="/assets/jsp/header.jsp" />
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<form action="<c:url value="./CommunityListAction.community"/>"
			method="post">
			<div>
				<div class="text-right">
					<span class="badge badge-success">전체 <%=total_record%>건
					</span>
				</div>
			</div>
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>좋아요</th>
						<th>글쓴이</th>
					</tr>
					<%
					for (int j = 0; j < communityList.size(); j++) {
						CommunityDTO notice = (CommunityDTO) communityList.get(j);
					%>
					<tr>
						<td><%=notice.getId()%></td>
						<td><a
							href="./CommunityViewAction.community?num=<%=notice.getId()%>&pageNum=<%=pageNum%>"><%=notice.getTitle()%></a></td>
						<td><%=notice.getDate()%></td>
						<td><%=notice.getLikes()%></td>
						<td><%=notice.getUser_id()%></td>
					</tr>
					<%
					}
					%>
				</table>
			</div>
			<div align="center">
				<c:set var="pageNum" value="<%=pageNum%>" />
				<c:forEach var="i" begin="1" end="<%=total_page%>">
					<a
						href="<c:url value="./CommunityListAction.community?pageNum=${i}" /> ">
						<c:choose>
							<c:when test="${pageNum==i}">
								<font color='4C5317'><b> [${i}]</b></font>
							</c:when>
							<c:otherwise>
								<font color='4C5317'> [${i}]</font>

							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>
			</div>
			<div align="left">
				<table>
					<tr>
						<td width="100%" align="left">&nbsp;&nbsp;<input
							name="input_tag" type="text" placeholder="태그를 입력하세요" /> <input
							type="submit" id="btnAdd" class="btn btn-primary " value="검색 " />
						</td>
						<td width="100%" align="right"><a href="#"
							onclick="writeCommunity(); return false;" class="btn btn-primary">&laquo;글쓰기</a>
						</td>
					</tr>
				</table>
			</div>
		</form>
		<hr>
	</div>
</body>
<jsp:include page="/assets/jsp/footer.jsp" />
</html>