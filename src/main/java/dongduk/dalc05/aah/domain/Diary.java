package dongduk.dalc05.aah.domain;

import java.util.Date;

public class Diary {
	
	private int member_code;
	private Date diary_date;
	private int recipe_code;
	private int exercise_code;
	private int bloodPressure;
	private int bloodSugar;
	
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

}
