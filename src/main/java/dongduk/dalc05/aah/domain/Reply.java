package dongduk.dalc05.aah.domain;

import java.util.Date;

public class Reply {
	
	private int recipe_code;
	private int reply_code;
	private Date reply_date;
	private int member_code;
	private String reply_content;
	
	public int getRecipe_code() {
		return recipe_code;
	}
	public void setRecipe_code(int recipe_code) {
		this.recipe_code = recipe_code;
	}
	public int getReply_code() {
		return reply_code;
	}
	public void setReply_code(int reply_code) {
		this.reply_code = reply_code;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	public int getMember_code() {
		return member_code;
	}
	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_contents) {
		this.reply_content = reply_contents;
	}
	
	
	



}
