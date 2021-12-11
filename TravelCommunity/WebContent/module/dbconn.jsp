<%--
DB 연결하는 jsp 파일
사용 방법
연결하고자 할 때
<%@ include file="/module/dbconn.jsp"%> 로 불러온다.
불러오기가 실패했을 경우 경로를 수정해본다.

PreparedStatement 등으로 SQL 처리를 완료 후

다음은 필수로 적어주자

if(pstmt){
	pstmt.close();
}

if(conn){
	conn.close();
}

PreparedStatement 등으로 SQL 처리를 완료 후
다음은 필수로 적어주자
if(pstmt){
	pstmt.close();
}
if(conn){
	conn.close();
}

--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
Connection conn = null;

try {
	String url = "jdbc:mysql://embeded.clez5ac4cxmt.us-east-2.rds.amazonaws.com:3306/travel_community";
	String user = "root";
	String password = "rlaehdgus";

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	//out.println("정상 연결 성공");
} catch (SQLException ex) {
	out.println("데이터베이스 연결이 실패했습니다.<br>");
	out.println("SQLException: " + ex.getMessage());
}

%>

