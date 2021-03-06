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

	// 정보 업데이트
	@Override
	public void updateMember(Member member) {
		memberMapper.updateMember(member);	
	}	
		
	// 아이디 중복확인
	@Override
	public Member checkId(String member_id) {
		return memberMapper.checkId(member_id);
	}
	
	// 닉네임 중복확인
	@Override
	public Member checkNick(String member_nickName) {
		return memberMapper.checkId(member_nickName);
	}

	// 탈퇴
	@Override
	public void deleteMember(int member_code) {
		memberMapper.deleteMember(member_code);
	}
	
	// ID로 member_code 불러오기
	@Override
	public int getMemberCode(String member_id) {
		return memberMapper.getMemberCode(member_id);
	}
	
	// ID로 nickName 불러오기
	@Override
	public String getMemberNickName(String member_id) {
		return memberMapper.getMemberNickName(member_id);
	}

	// ID에 맞는 올바른 패스워드인지 확인
	@Override
	public String getPassword(String member_id) {
		return memberMapper.getPassword(member_id);
	}
	
	// member_code로 모든정보 불러오기
	@Override
	public Member getMemberInfo(int member_code) {
		return memberMapper.getMemberInfo(member_code);
	}
}
