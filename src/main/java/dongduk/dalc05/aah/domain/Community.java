package dongduk.dalc05.aah.domain;

public class Community {
	
	// DB
	private int commu_code; // auto-increment
	private String commu_name;
	private String commu_introduce;
	private int sick_code;
	
	// only domain
	private String sick_name;
	
	public Community() {}
	
	public Community(String commu_name, String commu_introduce, int sick_code) {
		super();
		this.commu_name = commu_name;
		this.commu_introduce = commu_introduce;
		this.sick_code = sick_code;
	}

	public Community(String commu_name, String commu_introduce, int sick_code, String sick_name) {
		super();
		this.commu_name = commu_name;
		this.commu_introduce = commu_introduce;
		this.sick_code = sick_code;
		this.sick_name = sick_name;
	}

	public int getCommu_code() {
		return commu_code;
	}

	public void setCommu_code(int commu_code) {
		this.commu_code = commu_code;
	}

	public String getCommu_name() {
		return commu_name;
	}

	public void setCommu_name(String commu_name) {
		this.commu_name = commu_name;
	}

	public String getCommu_introduce() {
		return commu_introduce;
	}

	public void setCommu_introduce(String commu_introduce) {
		this.commu_introduce = commu_introduce;
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
