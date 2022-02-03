package dongduk.dalc05.aah.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Post {
	
	// DB
	private int post_code;
	private int member_code;
	private String post_title;
	private String post_content;
	
	@DateTimeFormat (pattern ="yyyy/MM/dd HH:mm")
	private Date post_uploadDate;
	@DateTimeFormat (pattern ="yyyy/MM/dd HH:mm")
	private Date post_updateDate;
	
	private int post_hits;
	
	// only domain
	private String member_nickName;
	private String commu_name;
	
	public String getMember_nickName() {
		return member_nickName;
	}
	public void setMember_nickName(String member_nickName) {
		this.member_nickName = member_nickName;
	}
	public String getCommu_name() {
		return commu_name;
	}
	public void setCommu_name(String commu_name) {
		this.commu_name = commu_name;
	}
	
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
