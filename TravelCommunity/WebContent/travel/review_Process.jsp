<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="dto.TravelReviewDTO"%>
<%@ page import="dao.TravelReviewDAO"%>
<!-- 스크립트문 편하게 사용하기 위한 -->
<%@ page import="java.io.PrintWriter"%>
<!-- 건너오는 데이터를 UTF-8 형태로 받아오기 위한 -->
<%
request.setCharacterEncoding("UTF-8");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/assets/jsp/header.jsp"%>
</head>
<body>

	<%
	//	if (session.getAttribute("id") == null) { //로그인 없이 댓글 작성
	%>
	<script>
		/* alert("로그인이 필요한 서비스입니다.");
		history.back();		 */
	</script>
	<%
	//	} else {  //로그인 후 댓글 작성

	// 세션을 통해 글쓴 아이디 찾아옴
	String id = null;
	if (session.getAttribute("user_id") != null) {
		id = (String) session.getAttribute("user_id");
	}

	TravelReviewDAO reviewProc = new TravelReviewDAO();

	int travel_id = Integer.parseInt(request.getParameter("index"));
	String comment = request.getParameter("review");
	String reviewRating = request.getParameter("star");
	int result = reviewProc.review(travel_id, id, comment, reviewRating);

	if (result == -1) { // 글쓰기 실패시
		PrintWriter script = response.getWriter();
		script.println("<script>alert('리뷰 작성에 실패하였습니다')</script>");
		script.println("<script>history.back()</script>");

	} else { // 글쓰기 성공시
		PrintWriter script = response.getWriter();
		script.println("<script>alert('리뷰 작성에 성공하였습니다')</script>");
		script.println("<script>location.href = document.referrer;</script>");

	}
	%>

</body>
<%@include file="/assets/jsp/footer.jsp"%>
</html>