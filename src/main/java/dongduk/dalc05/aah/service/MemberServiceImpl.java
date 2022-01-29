
package dongduk.dalc05.aah.service;
import dongduk.dalc05.aah.dao.MemberDao;
import dongduk.dalc05.aah.domain.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import java.util.Map;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	// 가입
	@Override
	public void insertMember(Member member) {
		memberDao.insertMember(member);
	}
	
	// 아이디 중복확인
	@Override
	public Member checkId(String member_id) {
		return memberDao.checkId(member_id);
	}
	
	// 탈퇴
	@Override
	public void deleteMember(int member_code) {
		memberDao.deleteMember(member_code);
	}
	
	// ID로 member_code 불러오기
	@Override
	public int getMemberCode(String member_id) {
		return memberDao.getMemberCode(member_id);
	}

	// ID로 nickName 불러오기
	public String getMemberNickName(String member_id) {
		return memberDao.getMemberNickName(member_id);
	}

	// ID에 맞는 올바른 패스워드인지 확인
	@Override
	public String getPassword(String member_id) {
		return memberDao.getPassword(member_id);
	}
	
	// member_code로 모든정보 불러오기
	@Override
	public Member getMemberInfo(int member_code) {
		return memberDao.getMemberInfo(member_code);
	}
		
	// only Service 
	// 유효한 로그인인지 판단
	@Override
	public boolean isValidUser(String member_id, String member_pw) {
		String validPassword = memberDao.getPassword(member_id);
		System.out.println("로그인시도 유효한지 판단(MemberServiceImpl)" + member_id);
		System.out.println("로그인시도 유효한지 판단(MemberServiceImpl)" + member_pw);
		System.out.println("로그인시도 유효한지 판단(MemberServiceImpl)" + validPassword);
		
		if (validPassword != null && validPassword.equals(member_pw) == true) {
			return true;
		}
		return false;
	}
}