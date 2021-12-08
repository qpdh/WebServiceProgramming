package dto;

public class CommunityComment implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// 댓글 번호
	private int id;
	// 댓글 작성일
	private String date;
	// 댓글 작성 유저 아이디
	private String user_id;
	// 댓글 내용
	private String comment;
	// 댓글이 달린 게시글 아이디
	private String communityId;

	public CommunityComment() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getCommunityId() {
		return communityId;
	}

	public void setCommunityId(String communityId) {
		this.communityId = communityId;
	}

}
