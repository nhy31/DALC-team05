package dongduk.dalc05.aah.domain;

import java.util.Date;

public class Diary {
	
	// DB
	private int diary_code; // auto, pk
	private int member_code;
	private Date diary_date;
	private String diary_title;
	private String diary_content;
	private String diary_img;
	
	public Diary() {}
	
	
	public Diary(int member_code, Date diary_date, String diary_title, String diary_content,
			String diary_img) {
		super();
		this.member_code = member_code;
		this.diary_date = diary_date;
		this.diary_title = diary_title;
		this.diary_content = diary_content;
		this.diary_img = diary_img;
	}


	public int getDiary_code() {
		return diary_code;
	}
	public void setDiary_code(int diary_code) {
		this.diary_code = diary_code;
	}
	public int getMember_code() {
		return member_code;
	}
	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}
	public Date getDiary_date() {
		return diary_date;
	}
	public void setDiary_date(Date diary_date) {
		this.diary_date = diary_date;
	}
	public String getDiary_title() {
		return diary_title;
	}
	public void setDiary_title(String diary_title) {
		this.diary_title = diary_title;
	}
	public String getDiary_content() {
		return diary_content;
	}
	public void setDiary_content(String diary_content) {
		this.diary_content = diary_content;
	}
	public String getDiary_img() {
		return diary_img;
	}
	public void setDiary_img(String diary_img) {
		this.diary_img = diary_img;
	}
		

}
