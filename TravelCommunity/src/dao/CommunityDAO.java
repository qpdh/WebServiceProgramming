package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.CommunityCommentDTO;
import dto.CommunityDTO;
import module.DBConnection;

public class CommunityDAO {
	private static CommunityDAO instance;
	private ArrayList<CommunityDTO> listOfProducts = new ArrayList<CommunityDTO>();

	private CommunityDAO() {

	}

	public static CommunityDAO getInstance() {
		if (instance == null)
			instance = new CommunityDAO();
		return instance;
	}

	// community 테이블 레코드 갯수
	public int getListCount(String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = 0;

		String sql;

		if (text == null) {
			sql = "select count(*) from community";
		} else {
			sql = "select count(*) from community where tag like '%" + text + "%'";
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
	public ArrayList<CommunityDTO> getCommunityList(int page, int limit, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int total_record = getListCount(text);
		int start = (page - 1) * limit;
		int index = (start + 1);
		System.out.println("total_record : " + total_record);
		System.out.println("start : " + start);
		System.out.println("index : " + index);

		String sql;

		System.out.println("입력한 검색어 : " + text);
		if (text == null) {
			sql = "select * from community order by id desc";
		} else {
			sql = "select * from community where tag like '%" + text + "%' order by id desc";
		}

		listOfProducts.clear();
		listOfProducts = new ArrayList<CommunityDTO>();

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

				// ArrayList<CommunityCommentDTO> comments =
				// getCommunityCommentsList(rs.getInt("id"));
				// community.setComments(comments);

				listOfProducts.add(community);

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

		return listOfProducts;
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
	public void upadteLikes(int communityId, String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.getConnection();

			String sql = "select * from likes_check where community_id = ? and user_id = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, communityId);
			pstmt.setString(2, userId);

			rs = pstmt.executeQuery();

			// 이미 좋아요를 한 경우
			if (rs.next()) {
				return;
			}

			pstmt.close();

			sql = "insert into likes_check values(?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, communityId);
			pstmt.setString(2, userId);

			pstmt.execute();

			pstmt.close();

			sql = "select likes from community where id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, communityId);

			rs = pstmt.executeQuery();

			int likes = 0;
			if (rs.next())
				likes = rs.getInt("likes") + 1;

			pstmt.close();

			sql = "update community set likes=? where id =?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, likes);
			pstmt.setInt(2, communityId);

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

	// 댓글 리스트 가져오기
	public ArrayList<CommunityCommentDTO> getCommunityCommentsList(int id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from community_comment where community_id = ? order by id desc";

		ArrayList<CommunityCommentDTO> list = new ArrayList<CommunityCommentDTO>();

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmt.setInt(1, id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				System.out.println("처리완료");
				CommunityCommentDTO comment = new CommunityCommentDTO();
				comment.setId(rs.getInt("id"));
				comment.setUser_id(rs.getString("user_id"));
				comment.setComment(rs.getString("comment"));
				comment.setDate(rs.getString("date"));
				comment.setCommunityId(rs.getString("community_id"));
				list.add(comment);
			}

		} catch (Exception ex) {
			System.out.println("getCommunityCommentsList() 에러 : " + ex);
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

	// 댓글 테이블에 새로운 글 삽입하기
	public void insertCommunityComment(CommunityCommentDTO comment) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();

			String sql = "insert into community_comment(date,user_id,comment,community_id) values(?,?,?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, comment.getDate());
			pstmt.setString(2, comment.getUser_id());
			pstmt.setString(3, comment.getComment());
			pstmt.setString(4, comment.getCommunityId());

			pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("insertCommunityComment() 에러 : " + ex);
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

	// 댓글 테이블에 새로운 글 삭제
	public void deleteCommunityComment(int commentId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();

			String sql = "delete from community_comment where id=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, commentId);

			pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("deleteCommunityComment() 에러 : " + ex);
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
	// 커뮤니티 테이블 글 삭제
	public void deleteCommunity(int communityId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();

			String sql = "SET foreign_key_checks = 0";
			pstmt = conn.prepareStatement(sql);
			pstmt.execute();
			pstmt.close();

			sql = "delete from community where id=?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, communityId);
			pstmt.executeUpdate();
			pstmt.close();

			sql = "SET foreign_key_checks = 1;";
			pstmt = conn.prepareStatement(sql);
			pstmt.execute();
			pstmt.close();

		} catch (Exception ex) {
			System.out.println("deleteCommunity() 에러 : " + ex);
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

	// 특정 페이지
	public CommunityDTO getCommunityByNum(int num, int page) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CommunityDTO community = null;

		// updateHit(num);
		String sql = "select * from community where id = ? ";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				community = new CommunityDTO();
				community.setId(rs.getInt("id"));
				community.setUser_id(rs.getString("user_id"));
				community.setFile_name(rs.getString("file_name"));
				community.setTitle(rs.getString("title"));
				community.setComment(rs.getString("comment"));
				community.setDate(rs.getString("date"));
				community.setLikes(rs.getInt("likes"));
				community.setTag(rs.getString("tag"));
			}

			return community;
		} catch (Exception ex) {
			System.out.println("getCommunityByNum() 오류 : " + ex);
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
		return null;
	}

	// mypage
	public ArrayList<CommunityDTO> getmypage(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from community where user_id = ? limit 3";
		ArrayList<CommunityDTO> list = new ArrayList<CommunityDTO>();
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CommunityDTO communityDTO = new CommunityDTO();
				communityDTO.setId(rs.getInt(1));
				communityDTO.setDate(rs.getString(2));
				communityDTO.setFile_name(rs.getString(3));
				communityDTO.setUser_id(rs.getString(4));
				communityDTO.setTag(rs.getString(5));
				communityDTO.setTitle(rs.getString(6));
				communityDTO.setComment(rs.getString(7));
				communityDTO.setLikes(rs.getInt(8));
				list.add(communityDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
