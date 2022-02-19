package dongduk.dalc05.aah.dao;

import dongduk.dalc05.aah.domain.Member;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberDao {
	
	// 가입
	void insertMember(Member member) throws DataAccessException;
	
	// 정보 업데이트
	void updateMember(Member member);
		
	// 아이디 중복확인
	Member checkId(String member_id);
	
	// 닉네임 중복확인
	Member checkNick(String member_nickName);
	
	// 탈퇴
	void deleteMember(int member_code);
	
	// ID로 member_code 불러오기
	int getMemberCode(String member_id);
	
	// ID로 nickName 불러오기
	String getMemberNickName(String member_id);
	
	// ID에 맞는 올바른 패스워드인지 확인
	String getPassword(String member_id);
	
	// member_code로 모든정보 불러오기
	Member getMemberInfo(int member_code);
}
