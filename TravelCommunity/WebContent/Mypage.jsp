<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/module/dbconn.jsp"%>
<!DOCTYPE html>
<%
String user_id = (String) session.getAttribute("user_id");
%>

<html>
<head>
<meta charset="UTF-8">

<title>여행 어디가</title>
<div style="border: 1px dotted black;">
	<img src="images/user_mypage.png" style="vertical-align: middle;">
	<span style="margin-top: 20px; font-size: 18px;"> <%=user_id%> <a
		href="logout.jsp">로그아웃</a>
	</span>
</div>
</head>
<body>

	<%
	ResultSet rs = null;
	PreparedStatement pstmt = null;

	try {
		String sql = "select * from community where user_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user_id);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			String date = rs.getString("date");
			String file_name = rs.getString("file_name");
			String title = rs.getString("title");
			String comment = rs.getString("comment");
	%>
	<p>
		날짜
		<%=date%></p>
	<p>
		파일명
		<%=file_name%>
		<image src="C:\\WebProject\\Community\\<%=file_name%>">
	</p>
	<p>
		제목
		<%=title%></p>
	<p>
		내용
		<%=comment%></p>
	<%
	}
	} catch (SQLException ex) {
	out.println("SQLException: " + ex.getMessage());
	}
	if (rs != null)
	rs.close();
	if (pstmt != null)
	pstmt.close();
	if (conn != null)
	conn.close();
	%>



</body>
</html>