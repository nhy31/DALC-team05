package dongduk.dalc05.aah.domain;

public class Recipe {
	
	private int recipe_code;
	private String recipe_name;
	private float recipe_level; //double
	private int recipe_length;
	private int sick_code;
	private String recipe_img;
	
	public String getRecipe_img() {
		return recipe_img;
	}
	public void setRecipe_img(String recipe_img) {
		this.recipe_img = recipe_img;
	}
	public int getRecipe_code() {
		return recipe_code;
	}
	public void setRecipe_code(int recipe_code) {
		this.recipe_code = recipe_code;
	}
	public String getRecipe_name() {
		return recipe_name;
	}
	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
	}
	public float getRecipe_level() {
		return recipe_level;
	}
	public void setRecipe_level(float recipe_level) {
		this.recipe_level = recipe_level;
	}
	public int getRecipe_length() {
		return recipe_length;
	}
	public void setRecipe_length(int recipe_length) {
		this.recipe_length = recipe_length;
	}
	public int getSick_code() {
		return sick_code;
	}
	public void setSick_code(int sick_code) {
		this.sick_code = sick_code;
	}
	
	



}
