package dongduk.dalc05.aah.domain;

import java.util.List;

public class Recipe {
	
	// DB
	private int recipe_code; 
	private String recipe_title;
	private String recipe_memo;
	private String recipe_country; 
	private String recipe_category; 
	private String recipe_time;
	private String recipe_person;
	private String recipe_level;
	private String recipe_img;
	private int recipe_hits;
	
	// only domain
	private List<rUse> uses;
	private List<rOrder> orders;
	private int chk; // 보관함 표시 
	
	
	public int getChk() {
		return chk;
	}

	public void setChk(int chk) {
		this.chk = chk;
	}

	public Recipe() {}

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

	public String getRecipe_memo() {
		return recipe_memo;
	}

	public void setRecipe_memo(String recipe_memo) {
		this.recipe_memo = recipe_memo;
	}

	public String getRecipe_country() {
		return recipe_country;
	}

	public void setRecipe_country(String recipe_country) {
		this.recipe_country = recipe_country;
	}

	public String getRecipe_category() {
		return recipe_category;
	}

	public void setRecipe_category(String recipe_category) {
		this.recipe_category = recipe_category;
	}

	public String getRecipe_time() {
		return recipe_time;
	}

	public void setRecipe_time(String recipe_time) {
		this.recipe_time = recipe_time;
	}

	public String getRecipe_person() {
		return recipe_person;
	}

	public void setRecipe_person(String recipe_person) {
		this.recipe_person = recipe_person;
	}

	public String getRecipe_level() {
		return recipe_level;
	}

	public void setRecipe_level(String recipe_level) {
		this.recipe_level = recipe_level;
	}

	public String getRecipe_img() {
		return recipe_img;
	}

	public void setRecipe_img(String recipe_img) {
		this.recipe_img = recipe_img;
	}

	public int getRecipe_hits() {
		return recipe_hits;
	}

	public void setRecipe_hits(int recipe_hits) {
		this.recipe_hits = recipe_hits;
	}

	public List<rUse> getUses() {
		return uses;
	}

	public void setUses(List<rUse> uses) {
		this.uses = uses;
	}

	public List<rOrder> getOrders() {
		return orders;
	}

	public void setOrders(List<rOrder> orders) {
		this.orders = orders;
	}
	

}