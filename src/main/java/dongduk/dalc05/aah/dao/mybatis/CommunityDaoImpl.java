package dongduk.dalc05.aah.dao.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dongduk.dalc05.aah.dao.CommunityDao;
import dongduk.dalc05.aah.dao.mybatis.mapper.CommunityMapper;
import dongduk.dalc05.aah.domain.Community;
import dongduk.dalc05.aah.domain.Post;

@Repository
public class CommunityDaoImpl implements CommunityDao {
	
	@Autowired
	private CommunityMapper communityMapper;
	
	// 전체게시판 게시글 인기순 10개 보여주기
	@Override
	public List<Post> getBestPosts() {
		return communityMapper.getBestPosts();
	}
	
	// 전체 커뮤니티 리스트 보기
	@Override
	public List<Community> getCommuList() {
		return communityMapper.getCommuList();
	}
	
	// 나의 커뮤니티들
	@Override
	public List<Community> myCommuList(int member_code) {
		return communityMapper.myCommuList(member_code);
	}
	
	// 커뮤니티 생성
	@Override
	public void insertCommu(Community c) {
		communityMapper.insertCommu(c);
	}
	
	// 커뮤 생성시 커뮤이름 중복확인
	@Override
	public String checkName(String commu_name) {
		return communityMapper.checkName(commu_name);
	}
	
	// commu_code로 name 가져오기
	@Override
	public String getCommuName(int commu_code) {
		return communityMapper.getCommuName(commu_code);
	}

}
