package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import dto.UserDTO;

import org.apache.catalina.User;

public class UserDAO {
	
	private Connection conn; //자바와 데이터베이스를 연결
	private PreparedStatement pstmt; //쿼리문 대기 및 설정
	private ResultSet rs; //결과값 받아오기
	
	//기본 생성자
	//UserDAO가 실행되면 자동으로 생성되는 부분
	//메소드마다 반복되는 코드를 이곳에 넣으면 코드가 간소화된다
	public UserDAO() {
		try {
			String url = "jdbc:mysql://embeded.clez5ac4cxmt.us-east-2.rds.amazonaws.com:3306/travel_community";
			String user = "root";
			String password = "rlaehdgus";

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

//로그인 영역
	public int login(String userID, String userPassword) {
		String sql = "select password from users where id = ?";
		try {
			pstmt = conn.prepareStatement(sql); //sql쿼리문을 대기 시킨다
			pstmt.setString(1, userID); //첫번째 '?'에 매개변수로 받아온 'userID'를 대입
			rs = pstmt.executeQuery(); //쿼리를 실행한 결과를 rs에 저장
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공
				}else
					return 0; //비밀번호 틀림
			}
			return -1; //아이디 없음
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //오류
	}
	public int join(String userID, String userPassword,String userName) { 
		String SQL = "INSERT INTO users VALUES (?,?,?)"; 
		try { // 각각의 데이터를 실제로 넣어준다. 
		PreparedStatement pstmt = conn.prepareStatement(SQL); // 쿼리문의 ?안에 각각의 데이터를 넣어준다. 
		pstmt.setString(1, userID);
		pstmt.setString(3, userPassword); // 명령어를 수행한 결과 반환, 반환값: insert가 된 데이터의 개수 
		pstmt.setString(2, userName);
		return pstmt.executeUpdate(); 
		} catch (Exception e) { 
		e.printStackTrace(); 
	} 
	return -1; 
	}
}

