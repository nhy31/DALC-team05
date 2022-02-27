package dongduk.dalc05.aah.domain;

import java.util.Date;

public class Diary {
	
	// DB
	private int diary_code; // auto, pk
	private int member_code;
	private Date diary_date;
	private String diary_content;
	private int recipe_code;
	private int exercise_code;
	private int bloodPressure;
	private int bloodSugar;
	
	// only domain
	private String recipe_name;
	private String recipe_img;
	public int getMember_code() {
		return member_code;
	}
	
	public Diary() {}
	
	
	public Diary(int member_code, Date diary_date, String diary_content, int recipe_code, int bloodPressure,
			int bloodSugar) {
		super();
		this.member_code = member_code;
		this.diary_date = diary_date;
		this.diary_content = diary_content;
		this.recipe_code = recipe_code;
		this.bloodPressure = bloodPressure;
		this.bloodSugar = bloodSugar;
	}

	public int getDiary_code() {
		return diary_code;
	}

	public void setDiary_code(int diary_code) {
		this.diary_code = diary_code;
	}

	public String getDiary_content() {
		return diary_content;
	}

	public void setDiary_content(String diary_content) {
		this.diary_content = diary_content;
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

	public int getRecipe_code() {
		return recipe_code;
	}
	public void setRecipe_code(int recipe_code) {
		this.recipe_code = recipe_code;
	}
	public int getExercise_code() {
		return exercise_code;
	}
	public void setExercise_code(int exercise_code) {
		this.exercise_code = exercise_code;
	}
	public int getBloodPressure() {
		return bloodPressure;
	}
	public void setBloodPressure(int bloodPressure) {
		this.bloodPressure = bloodPressure;
	}
	public int getBloodSugar() {
		return bloodSugar;
	}
	public void setBloodSugar(int bloodSugar) {
		this.bloodSugar = bloodSugar;
	}
	public String getRecipe_name() {
		return recipe_name;
	}
	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
	}
	public String getRecipe_img() {
		return recipe_img;
	}
	public void setRecipe_img(String recipe_img) {
		this.recipe_img = recipe_img;
	}
	
	
}
