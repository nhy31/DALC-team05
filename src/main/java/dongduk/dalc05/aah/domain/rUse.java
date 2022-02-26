package dongduk.dalc05.aah.domain;

public class rUse {
	
	// DB
	private int recipe_code; // pk, fk
	private String rUse_name;
	private String rUse_volume;
	private String rUse_type;
	
	public rUse() {}

	public int getRecipe_code() {
		return recipe_code;
	}

	public void setRecipe_code(int recipe_code) {
		this.recipe_code = recipe_code;
	}

	public String getrUse_name() {
		return rUse_name;
	}

	public void setrUse_name(String rUse_name) {
		this.rUse_name = rUse_name;
	}

	public String getrUse_volume() {
		return rUse_volume;
	}

	public void setrUse_volume(String rUse_volume) {
		this.rUse_volume = rUse_volume;
	}

	public String getrUse_type() {
		return rUse_type;
	}

	public void setrUse_type(String rUse_type) {
		this.rUse_type = rUse_type;
	};
	
	
}