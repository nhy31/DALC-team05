package dongduk.dalc05.aah.service;
import dongduk.dalc05.aah.domain.Member;

public interface MemberService{
	
	// 가입
	public void insertMember(Member member);
	
	// 탈퇴
	public void deleteMember(int member_code);
	// member_code로 정보 불러오기
	public Member getMemberInfo(int member_code);
	
	// 아이디에 맞는 올바른 패스워드인지 확인
	public String getPassword(String member_id);
	// 아이디로 member_code 불러오기
	public int getMemberCode(String member_id);

	// 아이디로 member_nickName 불러오기
	public String getMemberNickName(String member_id);
	
	// 유효한 로그인인지 판단
	public boolean isValidUser(String member_id, String member_pw);
}