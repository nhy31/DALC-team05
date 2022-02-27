package dongduk.dalc05.aah.domain;

public class MyBox {
	
	// DB
	private int myBox_code; // auto-increment, pk
	private int member_code; // pk, fk
	private int recipe_code; // fk
	private int exercise_code; // fk
	
	// only domain
	private String img; // 레시피나 홈트의 이미지
	private String title; // 레시피나 홈트의 제목
	private String memo; // 레시피나 홈트의 한줄소개 저장
	
	public MyBox() {}
	
	public MyBox(int myBox_code, int member_code) {
		super();
		this.myBox_code = myBox_code;
		this.member_code = member_code;
	}

	public void MyBoxRecipe(int member_code, int recipe_code) {
		this.member_code = member_code;
		this.recipe_code = recipe_code;
	}
	
	public void MyBoxExercise(int member_code, int exercise_code) {
		this.member_code = member_code;
		this.exercise_code = exercise_code;
		this.recipe_code = 1;
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

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}
	
}
