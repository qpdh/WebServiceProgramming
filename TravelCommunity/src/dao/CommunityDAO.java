package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.CommunityDTO;
import module.DBConnection;

public class CommunityDAO {
	private static CommunityDAO instance;

	private CommunityDAO() {

	}

	public static CommunityDAO getInstance() {
		if (instance == null)
			instance = new CommunityDAO();
		return instance;
	}

	// users 테이블에서 인증된 id의 사용자명 가져오기
	public String getLoginNameById(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String name = null;
		String sql = "select * from users where id = ?";

		// 인자 값으로 받아온 id값에 해당하는 내용 가져오기
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				name = rs.getString("name");
			}
		} catch (Exception ex) {
			System.out.println("getLoginNameById() 에러 : " + ex);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return name;
	}

	// community 테이블에 새로운 글 삽입하기
	public void insertCommunity(CommunityDTO community) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();

			String sql = "insert into board values(NULL,?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, community.getDate());
			pstmt.setString(2, community.getFile_name());
			pstmt.setString(3, community.getUser_id());
			pstmt.setString(4, community.getTag());
			pstmt.setString(5, community.getTitle());
			pstmt.setString(6, community.getComment());
			pstmt.setInt(7, community.getLikes());

			pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("insertCommunity() 에러 : " + ex);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}

	// 선택된 글의 좋아요 증가하기
	public void upadteLikes(int id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.getConnection();

			String sql = "select likes from community where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			int likes = 0;

			if (rs.next())
				likes = rs.getInt("likes") + 1;

			sql = "update community set likes=? where id =?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, likes);
			pstmt.setInt(2, id);

			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("updateLikes() 에러 : " + ex);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}
	// TODO 수정
	// TODO 삭제
}
