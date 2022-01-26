package dongduk.dalc05.aah.domain;

import java.util.List;

public class Recipe {
	
	private int recipe_code;
	private String recipe_title;
	private String recipe_length;
	private int sick_code;
	private String recipe_img;
	
	private List<rUse> uses;
	
//	private String recipe_level;
//	private String recipe_amount;
	

	public List<rUse> getUses() {
		return uses;
	}
	public void setUses(List<rUse> uses) {
		this.uses = uses;
	}
	
//	public String getRecipe_amount() {
//		return recipe_amount;
//	}
//	public void setRecipe_amount(String recipe_amount) {
//		this.recipe_amount = recipe_amount;
//	}
//	public String getRecipe_level() {
//		return recipe_level;
//	}
//	public void setRecipe_level(String recipe_level) {
//		this.recipe_level = recipe_level;
//	}
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
	public String getRecipe_title() {
		return recipe_title;
	}
	public void setRecipe_title(String recipe_title) {
		this.recipe_title = recipe_title;
	}
	
	public String getRecipe_length() {
		return recipe_length;
	}
	public void setRecipe_length(String recipe_length) {
		this.recipe_length = recipe_length;
	}
	public int getSick_code() {
		return sick_code;
	}
	public void setSick_code(int sick_code) {
		this.sick_code = sick_code;
	}
	
	



}
