package dongduk.dalc05.aah.dao.mybatis;

import dongduk.dalc05.aah.dao.MemberDao;
import dongduk.dalc05.aah.dao.mybatis.mapper.MemberMapper;
import dongduk.dalc05.aah.domain.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private MemberMapper memberMapper;

	// 가입
	public void insertMember(Member member) throws DataAccessException {
		memberMapper.insertMember(member);
	}

	// 탈퇴
	@Override
	public void deleteMember(int member_code) {
		memberMapper.deleteMember(member_code);
	}
	
	// 정보 불러오기
	@Override
	public Member getMemberInfo(int member_code) {
		return memberMapper.getMemberInfo(member_code);
	}

	// 아이디에 맞는 올바른 패스워드인지 확인
	@Override
	public String getPassword(String member_id) {
		return memberMapper.getPassword(member_id);
	}
	
	// 아이디로 member_code 불러오기
	@Override
	public int getMemberCode(String member_id) {
		return memberMapper.getMemberCode(member_id);
	}

	@Override
	public int getMemberNickName(String member_id) {
		return memberMapper.getMemberNickName(member_id);
	}
	
	

}
