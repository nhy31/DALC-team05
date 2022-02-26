package dongduk.dalc05.aah.domain;

public class rOrder {
	
	private int recipe_code; // fk
	private int rOrder_num;
	private String rOrder_content;
	private String rOrder_img;
	
	public rOrder() {}
	
	public int getRecipe_code() {
		return recipe_code;
	}
	public void setRecipe_code(int recipe_code) {
		this.recipe_code = recipe_code;
	}
	public int getrOrder_num() {
		return rOrder_num;
	}
	public void setrOrder_num(int rOrder_num) {
		this.rOrder_num = rOrder_num;
	}
	public String getrOrder_content() {
		return rOrder_content;
	}
	public void setrOrder_content(String rOrder_content) {
		this.rOrder_content = rOrder_content;
	}
	public String getrOrder_img() {
		return rOrder_img;
	}
	public void setrOrder_img(String rOrder_img) {
		this.rOrder_img = rOrder_img;
	}
	
	
}