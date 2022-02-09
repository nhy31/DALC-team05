package dongduk.dalc05.aah.domain;

public class MyBox {
	
	// DB
	private int myBox_code; // auto-increment, pk
	private int member_code; // pk, fk
	private int recipe_code; // fk
	private int exercise_code; // fk
	
	// only domain
	private String image;
	private String sick_code;
	private String sick_name;
	
	public MyBox() {}
	
	public MyBox(int myBox_code, int member_code) {
		super();
		this.myBox_code = myBox_code;
		this.member_code = member_code;
	}

	public MyBox(int member_code, int recipe_code, int exercise_code) {
		super();
		this.member_code = member_code;
		this.recipe_code = recipe_code;
		this.exercise_code = exercise_code;
	}
	
	public int getMyBox_code() {
		return myBox_code;
	}
	public void setMyBox_code(int myBox_code) {
		this.myBox_code = myBox_code;
	}
	public int getMember_code() {
		return member_code;
	}
	public void setMember_code(int member_code) {
		this.member_code = member_code;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getSick_code() {
		return sick_code;
	}
	public void setSick_code(String sick_code) {
		this.sick_code = sick_code;
	}
	public String getSick_name() {
		return sick_name;
	}
	public void setSick_name(String sick_name) {
		this.sick_name = sick_name;
	}
}
