package dongduk.dalc05.aah.service;

import java.util.List;

import dongduk.dalc05.aah.domain.Community;
import dongduk.dalc05.aah.domain.Post;
import dongduk.dalc05.aah.domain.Sick;

public interface CommunityService {

	// 전체게시판 게시글 인기순 10개 보여주기
	public List<Post> getBestPosts();
		
	// 전체 커뮤니티 리스트 보기
	public List<Community> getCommuList();
		
	// 나의 커뮤니티들
	public List<Community> myCommuList(int member_code);
		
	// 커뮤니티 생성
	public void insertCommu(Community c);
		
	// 커뮤 생성시 커뮤이름 중복확인
	public String checkName(String commu_name);
		
	// commu_code로 name 가져오기
	public String getCommuName(int commu_code);

}
