// 커뮤니티 게시글 dto
package dto;

import java.util.ArrayList;

public class CommunityDTO implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// 게시글 번호
	private int id;
	// 게시글 등록 날짜
	private String date;
	// 게시글 등록 파일 명 (사진 위치)
	private String file_name;
	// 게시글 등록 유저 아이디
	private String user_id;
	// 게시글 태그
	private String tag;
	// 게시글 제목
	private String title;
	// 게시글 내용
	private String comment;
	// 게시글 좋아요 수
	private int likes;

	private ArrayList<CommunityCommentDTO> comments = new ArrayList<>();

	public CommunityDTO() {
		super();
	}

	public ArrayList<CommunityCommentDTO> getComments() {
		return comments;
	}
	
	public void setComments(ArrayList<CommunityCommentDTO> comments) {
		this.comments = comments;
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

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

}
