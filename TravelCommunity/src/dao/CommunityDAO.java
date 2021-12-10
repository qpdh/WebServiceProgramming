package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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

	// community 테이블 레코드 갯수
	public int getListCount(String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = 0;

		String sql;

		if (items == null && text == null) {
			sql = "select count(*) from community";
		} else {
			sql = "select count(*) from community where " + items + " like '%" + text + "%'";
		}

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("getListCount() 에러: " + ex);
		}

		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				rs.close();
			}
			if (conn != null) {
				rs.close();
			}
		} catch (Exception ex) {
			throw new RuntimeException(ex.getMessage());
		}

		return x;
	}

	// community 테이블 레코드 가져오기
	public ArrayList<CommunityDTO> getCommunityList(int page, int limit, String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int total_record = getListCount(items, text);
		int start = (page - 1) * limit;
		int index = (start + 1);
		System.out.println("total_record : " + total_record);
		System.out.println("start : " + start);
		System.out.println("index : " + index);

		String sql;

		if (items == null && text == null) {
			sql = "select * from community order by id desc";
		} else {
			sql = "select * from community where " + items + " like '%" + text + "%' order by id desc";
		}

		ArrayList<CommunityDTO> list = new ArrayList<CommunityDTO>();

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs = pstmt.executeQuery();

			System.out.print("지금 인덱스 : " + index + " ");
			while (rs.absolute(index)) {
				System.out.println("처리완료");
				CommunityDTO community = new CommunityDTO();
				community.setId(rs.getInt("id"));
				community.setUser_id(rs.getString("user_id"));
				community.setFile_name(rs.getString("file_name"));
				community.setTitle(rs.getString("title"));
				community.setComment(rs.getString("comment"));
				community.setDate(rs.getString("date"));
				community.setLikes(rs.getInt("likes"));
				community.setTag(rs.getString("tag"));
				list.add(community);

				if (index < (start + limit) && index <= total_record) {
					index++;
				} else {
					break;
				}

			}

		} catch (Exception ex) {
			System.out.println("getCommunityList() 에러 : " + ex);
		}
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

		return list;
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
				name = rs.getString("id");
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
		System.out.println("getLoginNameById 에서 가져온 id : " + name);
		return name;
	}

	// community 테이블에 새로운 글 삽입하기
	public void insertCommunity(CommunityDTO community) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();

			String sql = "insert into community(date,file_name,user_id,tag,title,comment,likes) values(?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, community.getDate());
			System.out.println("check point");
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
