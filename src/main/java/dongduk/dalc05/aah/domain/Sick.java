package dongduk.dalc05.aah.domain;

public class Sick {
	
	private int sick_code; // pk
	private String sick_name;
	
	public Sick() {}
	
	public Sick(int sick_code, String sick_name) {
		super();
		this.sick_code = sick_code;
		this.sick_name = sick_name;
	}

	public int getSick_code() {
		return sick_code;
	}
	public void setSick_code(int sick_code) {
		this.sick_code = sick_code;
	}
	public String getSick_name() {
		return sick_name;
	}
	public void setSick_name(String sick_name) {
		this.sick_name = sick_name;
	}
}
