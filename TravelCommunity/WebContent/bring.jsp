<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/module/dbconn.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	ResultSet rs = null;
	PreparedStatement pstmt = null;

	try {
		String sql = "select * from community order by likes desc limit 3";
		pstmt = conn.prepareStatement(sql);

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
		<%=file_name%></p>
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