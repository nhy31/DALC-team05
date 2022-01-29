package dongduk.dalc05.aah.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dongduk.dalc05.aah.dao.CommunityDao;
import dongduk.dalc05.aah.domain.Community;
import dongduk.dalc05.aah.domain.Post;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	private CommunityDao commuDao;
	
	// 전체게시판 게시글 인기순 10개 보여주기
	@Override
	public List<Post> getBestPosts() {
		return commuDao.getBestPosts();
	}
	
	// 전체 커뮤니티 리스트 보기
	@Override
	public List<Community> getCommuList() {
		return commuDao.getCommuList();
	}
	
	// 나의 커뮤니티들
	@Override
	public List<Community> myCommuList(int member_code) {
		return commuDao.myCommuList(member_code);
	}
	
	// 커뮤니티 생성
	@Override
	public void insertCommu(Community c) {
		commuDao.insertCommu(c);
	}
	
	// 커뮤 생성시 커뮤이름 중복확인
	@Override
	public String checkName(String commu_name) {
		return commuDao.checkName(commu_name);
	}
	
	// commu_code로 name 가져오기
	@Override
	public String getCommuName(int commu_code) {
		return commuDao.getCommuName(commu_code);
	}
}
