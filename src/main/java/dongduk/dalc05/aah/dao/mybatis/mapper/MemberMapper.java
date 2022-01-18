package dongduk.dalc05.aah.dao.mybatis.mapper;

import dongduk.dalc05.aah.domain.Member;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

@Mapper
public interface MemberMapper {
	
	// 가입
	void insertMember(Member member) throws DataAccessException;

	// 탈퇴
	void deleteMember(int memberId);

	// 정보 불러오기
	Member getMemberInfo(int memberId);
	
	// 아이디에 맞는 올바른 패스워드인지 확인
	String getPassword(String member_id);
	
	// 아이디로 member_code 불러오기
	int getMemberCode(String member_id);
	
	// 아이디로 member_nickName 불러오기
	int getMemberNickName(String member_id);

}

