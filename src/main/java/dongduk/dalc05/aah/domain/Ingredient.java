package dongduk.dalc05.aah.domain;

public class Ingredient {

	// DB
	private int ingredient_code; // pk
	int sick_code; // pk, fk
	private String ingredient_name;
	
	public Ingredient() {}
	
	public Ingredient(int ingredient_code, int sick_code, String ingredient_name) {
		super();
		this.ingredient_code = ingredient_code;
		this.sick_code = sick_code;
		this.ingredient_name = ingredient_name;
	}
	
	public int getIngredient_code() {
		return ingredient_code;
	}
	public void setIngredient_code(int ingredient_code) {
		this.ingredient_code = ingredient_code;
	}
	public int getSick_code() {
		return sick_code;
	}
	public void setSick_code(int sick_code) {
		this.sick_code = sick_code;
	}
	public String getIngredient_name() {
		return ingredient_name;
	}
	public void setIngredient_name(String ingredient_name) {
		this.ingredient_name = ingredient_name;
	}	
}
