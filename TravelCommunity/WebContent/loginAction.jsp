<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="dao.UserDAO"%>
<%@ page import="dto.UserDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="dao.UserDAO" scope="page" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");

	String userID = null;
	String userPassword = null;

	if (request.getParameter("userID") != null) {
		userID = (String) request.getParameter("userID");
	}

	if (request.getParameter("userPassword") != null) {
		userPassword = (String) request.getParameter("userPassword");
	}

	if (userID == null || userPassword == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("</script>");
		script.close();
		return;
	}
	UserDAO userDAO = new UserDAO();

	int result = userDAO.login(userID, userPassword);
	System.out.println("result" + result);
	if (result == 1) {
		session.setAttribute("user_id", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인에 성공했습니다.')");
		script.println("location.href='main.jsp';");
		script.println("</script>");
		script.close();
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인에 실패했습니다.')");
		script.println("location.href='login.jsp';");
		script.println("</script>");
		script.close();
	}
	%>

</body>
</html>