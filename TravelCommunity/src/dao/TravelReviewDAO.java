package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.TravelReviewDTO;
import module.DBConnection;

public class TravelReviewDAO {
	private ResultSet rs;
	private PreparedStatement pstmt;
	private Connection conn;

	public TravelReviewDAO() throws ClassNotFoundException, SQLException {

		conn = DBConnection.getConnection();

	}

	public String getDate() { // 현재 날짜
		String SQL = "SELECT NOW()";
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return " ";
	}

	public int review(int travel_id, String id, String comment, String score) throws SQLException {
		String SQL = "insert into travel_review (identity, travel_id, comment, score, datetime) values(?,?,?,?,?); ";
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		try {
			pstmt.setString(1, id);
			pstmt.setInt(2, travel_id);
			pstmt.setString(3, comment);
			pstmt.setString(4, score);
			pstmt.setString(5, getDate());
			pstmt.executeUpdate();

			return 1;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<TravelReviewDTO> getReviewList(int travel_id) {

		String SQL = "select * from travel_review where travel_id = ?;	";
		ArrayList<TravelReviewDTO> reviewList = new ArrayList<TravelReviewDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, travel_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				TravelReviewDTO rm = new TravelReviewDTO();
				rm.setId(rs.getInt(1));
				rm.setUserId(rs.getString(2));
				rm.setComment(rs.getString(4));
				rm.setDate(rs.getString(6));
				rm.setScore(rs.getString(5));
				reviewList.add(rm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return reviewList;
	}

}
