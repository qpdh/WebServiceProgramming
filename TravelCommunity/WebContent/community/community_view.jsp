<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="dto.CommunityDTO, dto.CommunityCommentDTO"%>
<%@ page import="java.util.ArrayList"%>

<%
CommunityDTO notice = (CommunityDTO) request.getAttribute("community");
int num = ((Integer) request.getAttribute("num")).intValue();
int pageNum = ((Integer) request.getAttribute("page")).intValue();
String user_id = (String) session.getAttribute("user_id");
%>
<html>
<head>
<link rel="stylesheet" href="/assets/css/bootstrap.min.css" />
<title>Board</title>
</head>

<script type="text/javascript">
function writeComment(){
	if(${user_id == null}){
		alert("로그인 해주세요.");
		return false;
	}
	
	location.href="./CommunityCommentWriteAction.community?user_id=<%=user_id%>"
}

function clickLikes() {
	if (${user_id == null}) {
		alert("로그인 해주세요.");
		return false;
	}

	location.href = "./CommunityLikeAction.community?user_id=<%=user_id%>&num=<%=num%>&pageNum=<%=pageNum%>"
}
</script>

<body>
	<jsp:include page="/assets/jsp/header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>

	<div class="container">

		<div class="form-group row">
			<label class="col-sm-2 control-label">성명</label>
			<div class="col-sm-3">
				<input name="name" class="form-control"
					value=" <%=notice.getUser_id()%>" readonly>
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2 control-label">제목</label>
			<div class="col-sm-5">
				<input name="subject" class="form-control"
					value=" <%=notice.getTitle()%>" readonly>
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2 control-label">내용</label>
			<div class="col-sm-8" style="word-break: break-all;">
				<textarea name="content" class="form-control" cols="50" rows="5"
					readonly> <%=notice.getComment()%></textarea>
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2 control-label">이미지</label>

			<div class="col-sm-8" style="word-break: break-all;">

				<img src="c:/WebProject/Community/<%=notice.getFile_name()%>" />

			</div>
		</div>

		<a href="#" onclick="clickLikes(); return false;"
			class="btn btn-primary">&laquo;좋아요</a>

		<p>
			좋아요 수 :<%=notice.getLikes()%></p>


		<p>댓글
		<div class="form-group row">
			<form class="form-inline" method="post"
				action="/community/CommunityCommentWriteAction.community">

				<input type="hidden" name="num" value=<%=num%>> <input
					type="hidden" name="pageNum" value=<%=pageNum%>> <input
					type="hidden" name="user_id" value=<%=user_id%>> <input
					type="hidden" name="community_id" value="<%=notice.getId()%>">

				<div class="form-group">
					<input class="form-control" type="text" name="content"
						placeholder="댓글 작성">
				</div>

				<button class="btn btn-primary" type="submit">게시</button>
			</form>
		</div>
		<%
		ArrayList<CommunityCommentDTO> comment = notice.getComments();
		for (int i = 0; i < comment.size(); i++) {
		%>
		<c:set var="userId" value="<%=comment.get(i).getUser_id()%>" />
		<p>
			작성자 :
			<%=comment.get(i).getUser_id()%>
		<p>
			댓글 내용 :
			<%=comment.get(i).getComment()%>
			<c:if test="${user_id==userId}">
				<a
					href="/community/CommunityCommentDeleteAction.community?num=<%=notice.getId()%>&pageNum=<%=pageNum%>&communiyId=<%=comment.get(i).getId()%>"
					class="btn btn-danger"> 삭제</a>
			</c:if>
			<%
			}
			%>
		
	</div>

	<c:set var="userId" value="<%=notice.getUser_id()%>" />
	<div class="form-group row">
		<div class="col-sm-offset-2 col-sm-10 ">
			<c:if test="${user_id==userId}">
				<p>
					<a
						href="/community/CommunityDeleteAction.community?num=<%=notice.getId()%>&pageNum=<%=pageNum%>"
						class="btn btn-danger"> 삭제</a> <input type="submit"
						class="btn btn-success" value="수정 ">
			</c:if>
			<a href="./CommunityListAction.community?pageNum=<%=pageNum%>"
				class="btn btn-primary"> 목록</a>
		</div>
	</div>
	<hr>

	<jsp:include page="/assets/jsp/footer.jsp" />
</body>
</html>


