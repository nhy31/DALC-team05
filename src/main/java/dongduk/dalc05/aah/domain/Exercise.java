package dongduk.dalc05.aah.domain;

public class Exercise {
	
	private int exercise_code;
	private String exercise_title;
	private String exercise_channel;
	private String exercise_views;
	private String exercise_length;
	private String exercise_thumb;
	private String exercise_url;
	private int sick_code;
	
	public Exercise() {}

	public Exercise(int exercise_code, String exercise_title, String exercise_channel, String exercise_views,
			String exercise_length, String exercise_thumb, String exercise_url, int sick_code) {
		super();
		this.exercise_code = exercise_code;
		this.exercise_title = exercise_title;
		this.exercise_channel = exercise_channel;
		this.exercise_views = exercise_views;
		this.exercise_length = exercise_length;
		this.exercise_thumb = exercise_thumb;
		this.exercise_url = exercise_url;
		this.sick_code = sick_code;
	}

	public int getExercise_code() {
		return exercise_code;
	}

	public void setExercise_code(int exercise_code) {
		this.exercise_code = exercise_code;
	}

	public String getExercise_title() {
		return exercise_title;
	}

	public void setExercise_title(String exercise_title) {
		this.exercise_title = exercise_title;
	}

	public String getExercise_channel() {
		return exercise_channel;
	}

	public void setExercise_channel(String exercise_channel) {
		this.exercise_channel = exercise_channel;
	}

	public String getExercise_views() {
		return exercise_views;
	}

	public void setExercise_views(String exercise_views) {
		this.exercise_views = exercise_views;
	}

	public String getExercise_length() {
		return exercise_length;
	}

	public void setExercise_length(String exercise_length) {
		this.exercise_length = exercise_length;
	}

	public String getExercise_thumb() {
		return exercise_thumb;
	}

	public void setExercise_thumb(String exercise_thumb) {
		this.exercise_thumb = exercise_thumb;
	}

	public String getExercise_url() {
		return exercise_url;
	}

	public void setExercise_url(String exercise_url) {
		this.exercise_url = exercise_url;
	}

	public int getSick_code() {
		return sick_code;
	}

	public void setSick_code(int sick_code) {
		this.sick_code = sick_code;
	}

}
