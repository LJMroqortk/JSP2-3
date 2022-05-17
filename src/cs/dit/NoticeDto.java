package cs.dit;

/**============================================================
 * 패키지명 : cs.dit
 * 파일명 : NoticeDto.java
 * 변경이력 :
 *  2022년 05월 11일 최초작성  / 이주명
 * 프로그램 설명 : 데이터전달을 위한 객체
 * 
 *
 *=============================================================*/
public class NoticeDto {
	private String id;
	private String date;
	private String title;
	private String txtarea;
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the date
	 */
	public String getDate() {
		return date;
	}
	/**
	 * @param date the date to set
	 */
	public void setDate(String date) {
		this.date = date;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the txtarea
	 */
	public String getTxtarea() {
		return txtarea;
	}
	/**
	 * @param txtarea the txtarea to set
	 */
	public void setTxtarea(String txtarea) {
		this.txtarea = txtarea;
	}
	
	public NoticeDto() {}
	
	public NoticeDto(String id, String date, String title, String txtarea) {
		this.id = id;
		this.date = date;
		this.title = title;
		this.txtarea = txtarea;
	}
}
