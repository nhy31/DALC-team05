package dongduk.dalc05.aah.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Member {
	
	private int member_code;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_nickName;
	private String member_phone;
	
	@DateTimeFormat (pattern ="yyyy-MM-dd")
	private Date member_birth;
	
	private int sick_code;
	private String member_allergy;
	private String member_image;
	private int member_sex;
	
	public Member() {}
	
	public Member(String member_id, String member_pw, String member_name, String member_nickName, String member_phone,
			Date member_birth, int sick_code, String member_allergy, String member_image, int member_sex) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_nickName = member_nickName;
		this.member_phone = member_phone;
		this.member_birth = member_birth;
		this.sick_code = sick_code;
		this.member_allergy = member_allergy;
		this.member_image = member_image;
		this.member_sex = member_sex;
	}


	public int getMember_code() {
		return member_code;
	}

	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_nickName() {
		return member_nickName;
	}

	public void setMember_nickName(String member_nickName) {
		this.member_nickName = member_nickName;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public Date getMember_birth() {
		return member_birth;
	}

	public void setMember_birth(Date member_birth) {
		this.member_birth = member_birth;
	}

	public int getSick_code() {
		return sick_code;
	}

	public void setSick_code(int sick_code) {
		this.sick_code = sick_code;
	}

	public String getMember_allergy() {
		return member_allergy;
	}

	public void setMember_allergy(String member_allergy) {
		this.member_allergy = member_allergy;
	}

	public String getMember_image() {
		return member_image;
	}

	public void setMember_image(String member_image) {
		this.member_image = member_image;
	}

	public int getMember_sex() {
		return member_sex;
	}

	public void setMember_sex(int member_sex) {
		this.member_sex = member_sex;
	}
	
	
}