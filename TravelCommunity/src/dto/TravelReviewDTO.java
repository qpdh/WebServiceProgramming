package dto;

public class TravelReviewDTO implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// 여행지 리뷰 아이디
	private int id;
	// 여행지 작성자 유저 아이디
	private String userId;
	// 여행지 리뷰 작성 날짜
	private String date;
	// 여행지 아이디
	private int travelId;
	// 여행지 리뷰 내용
	private String comment;
	// 여행지 리뷰 점수
	private String score;

	public TravelReviewDTO() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getTravelId() {
		return travelId;
	}

	public void setTravelId(int travelId) {
		this.travelId = travelId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

}
