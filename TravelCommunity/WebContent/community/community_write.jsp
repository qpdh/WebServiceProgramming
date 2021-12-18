<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String user_id = (String) request.getAttribute("user_id");
%>
<html>
<head>
<link rel="stylesheet" href="./../resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>여행 어디가</title>
</head>

<script type="text/javascript">
	function checkForm() {
		if (!document.newWrite.title.value) {
			alert("제목을 입력하세요.");
			document.newWrite.title.focus();
			return false;
		}
		if (!document.newWrite.picture.value) {
			alert("사진을 첨부하세요.");
			document.newWrite.picture.focus();
			return false;
		}
		if (!document.newWrite.content.value) {
			document.newWrite.content.focus();
			alert("내용을 입력하세요.");
			return false;
		}
		if (!document.newWrite.tag.value) {
			document.newWrite.tag.focus();
			alert("태그를 입력하세요");
			return false;
		}
	}
</script>

<body>

	<div class="container">

		<h3>글쓰기</h3>
		<hr>

		<form name="newWrite" action="./CommunityWriteAction.community"
			class="form-horizontal" method="post" enctype="multipart/form-data"
			onsubmit="return checkForm()">

			<input name="user_id" type="hidden" class="form-control"
				value=<%=user_id%>>

			<div class="form-group row">
				<label class="col-sm-2 control-label"><h4>제목</h4></label>
				<div class="col-sm-10">
					<input name="title" type="text" class="form-control"
						placeholder="제목을 입력하세요">
				</div>
			</div>

			<hr>

			<div class="form-group row">
				<label class="col-sm-3 control-label"><h4>사진첨부</h4></label>
				<div class="col-sm-5">
					<input name="picture" type="file" accept="image/*">
				</div>
			</div>

			<hr>

			<div class="form-group row">
				<label class="col-sm-2 control-label"><h4>내용</h4></label>
				<div class="col-sm-10">
					<textarea name="content" cols="50" rows="5" class="form-control"
						placeholder="내용을 입력하세요"></textarea>
				</div>
			</div>

			<hr>

			<div class="form-group row">
				<label class="col-sm-2 control-label"><h4>태그</h4></label>
				<div class="col-sm-10">
					<input name="tag" type="text" class="form-control"
						placeholder="#태그를 적어주세요 ex) #좋아요 #오늘">
				</div>
			</div>

			<hr>

			<div class="form-group-row">
				<div class="com-sm-offet-2 col-sm-12" align="right">
					<input type="submit" class="btn btn-primary" value="글쓰기">
				</div>
			</div>

		</form>
	</div>
</body>
</html>