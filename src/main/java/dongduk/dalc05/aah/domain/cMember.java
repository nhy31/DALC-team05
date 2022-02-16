package dongduk.dalc05.aah.domain;

public class cMember {
	
	private int member_code;
	private int commu_code;
	
	public cMember() {}
	
	public cMember(int member_code, int commu_code) {
		super();
		this.member_code = member_code;
		this.commu_code = commu_code;
	}

	public int getMember_code() {
		return member_code;
	}

	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}

	public int getCommu_code() {
		return commu_code;
	}

	public void setCommu_code(int commu_code) {
		this.commu_code = commu_code;
	}
	
	

}
