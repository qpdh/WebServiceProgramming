package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.TravelDTO;
import module.DBConnection;
public class TravelDAO {
	private ResultSet rs;
	private PreparedStatement pstmt;
	private Connection conn;
	public TravelDAO() {

	}
	// 여행지 뽑아오기
	public ArrayList<TravelDTO> travel(String placename) throws ClassNotFoundException {
		ArrayList<TravelDTO> list = new ArrayList<TravelDTO>();
		 System.out.println(placename);
	      try {
	    	  String SQL = "SELECT * FROM travel where placename = ?";
	    	  conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, placename);
	    	  rs = pstmt.executeQuery();
		
			while (rs.next()) {
				TravelDTO travelDTO = new TravelDTO();
				travelDTO.setId(rs.getInt(1));
				travelDTO.setLocate(rs.getString(2));
				travelDTO.setPhoto1(rs.getString(3));
				travelDTO.setPhoto2(rs.getString(4));
				travelDTO.setPhoto3(rs.getString(5));
				travelDTO.setInformation(rs.getString(6));
				
		        list.add(travelDTO);
			}
	      }catch (SQLException ex) {
	    	  
	    		} finally {
	    		if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    		if (conn != null)
					try {
						conn.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    		}
		return list;
		
	}
	
	// 여행지 세부 뽑아오기
		public ArrayList<TravelDTO> travel_detail(int num) throws ClassNotFoundException {
			ArrayList<TravelDTO> list = new ArrayList<TravelDTO>();
		      try {
		    	  String SQL = "SELECT * FROM travel where id = ?";
		    	  conn = DBConnection.getConnection();
		    	  pstmt = conn.prepareStatement(SQL);
		    	  pstmt.setInt(1, num);
		    	  rs = pstmt.executeQuery();
				while (rs.next()) {
					TravelDTO travelDTO = new TravelDTO();
					travelDTO.setId(rs.getInt(1));
					travelDTO.setLocate(rs.getString(2));
					travelDTO.setPhoto1(rs.getString(3));
					travelDTO.setPhoto2(rs.getString(4));
					travelDTO.setPhoto3(rs.getString(5));
					travelDTO.setInformation(rs.getString(6));
					
			        list.add(travelDTO);
				}
		      }catch (SQLException ex) {
		    	  
		    		} finally {
		    		if (pstmt != null)
						try {
							pstmt.close();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
		    		if (conn != null)
						try {
							conn.close();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
		    		}
			return list;
			
		}
}
