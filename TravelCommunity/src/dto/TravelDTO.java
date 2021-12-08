package dto;

public class TravelDTO implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// 여행지 아이디
	private int id;
	// 여행지 위치
	private String locate;
	// 여행지 사진 위치
	private String photo[];
	// 여행지 정보
	private String imformation;

	public TravelDTO() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLocate() {
		return locate;
	}

	public void setLocate(String locate) {
		this.locate = locate;
	}

	public String[] getPhoto() {
		return photo;
	}

	public void setPhoto(String[] photo) {
		this.photo = photo;
	}

	public String getImformation() {
		return imformation;
	}

	public void setImformation(String imformation) {
		this.imformation = imformation;
	}

}
