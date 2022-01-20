package dongduk.dalc05.aah.domain;

import java.util.Date;

public class Post {
	
	private int post_code;
	private int member_code;
	private int commu_code;
	private String post_title;
	private String post_content;
	private Date post_uploadDate;
	private Date post_updateDate;
	private int post_hits;

	public int getPost_hits() {
		return post_hits;
	}
	public void setPost_hits(int post_hits) {
		this.post_hits = post_hits;
	}
	public int getPost_code() {
		return post_code;
	}
	public void setPost_code(int post_code) {
		this.post_code = post_code;
	}
	public int getMember_code() {
		return member_code;
	}
	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}
	public int getCommu_code() {
		return commu_code;
	}
	public void setCommu_code(int commu_code) {
		this.commu_code = commu_code;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public Date getPost_uploadDate() {
		return post_uploadDate;
	}
	public void setPost_uploadDate(Date post_uploadDate) {
		this.post_uploadDate = post_uploadDate;
	}
	public Date getPost_updateDate() {
		return post_updateDate;
	}
	public void setPost_updateDate(Date post_updateDate) {
		this.post_updateDate = post_updateDate;
	}
	

}
