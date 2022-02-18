package dongduk.dalc05.aah.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Comment {
	
	// DB
	private int post_code; // pk, fk(auto-increment)
	private int comment_code; // pk, auto-increment
	private int member_code;
	private String comment_content;
	@DateTimeFormat (pattern ="yyyy/MM/dd HH:mm") private Date comment_date;
	
	// only domain
	private String member_nickName;
	private String member_image;
	
	public Comment() {}
	
	public Comment(int post_code, int member_code, String comment_content, Date comment_date, String member_nickName, String member_image) {
		super();
		this.post_code = post_code;
		this.member_code = member_code;
		this.comment_content = comment_content;
		this.comment_date = comment_date;
		this.member_nickName = member_nickName;
		this.member_image = member_image;
	}

	public int getPost_code() {
		return post_code;
	}

	public void setPost_code(int post_code) {
		this.post_code = post_code;
	}

	public int getComment_code() {
		return comment_code;
	}

	public void setComment_code(int comment_code) {
		this.comment_code = comment_code;
	}

	public int getMember_code() {
		return member_code;
	}

	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public Date getComment_date() {
		return comment_date;
	}

	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}

	public String getMember_nickName() {
		return member_nickName;
	}

	public void setMember_nickName(String member_nickName) {
		this.member_nickName = member_nickName;
	}
}
