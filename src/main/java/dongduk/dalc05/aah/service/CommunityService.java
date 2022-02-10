package dongduk.dalc05.aah.service;

import java.util.List;

import dongduk.dalc05.aah.domain.Community;
import dongduk.dalc05.aah.domain.Post;

public interface CommunityService {

	/* commu 관련*/
	public List<Community> getCommuList(); // 전체 커뮤니티 리스트
	public List<Community> getMyCommuList(int member_code); // 나의 커뮤니티들
	public String getCommuName(int commu_code); // commu_code로 name 가져오기
	public int checkName(String commu_name); // 커뮤 생성시, 이름 중복체크
	public void insertCommu(Community c); // 커뮤니티 생성
	
	/* 게시글 post 관련*/
	public List<Post> getAllPosts(); // 전체 게시글 
	public List<Post> getBestPosts(); // 전체게시판 게시글 인기순 10개 보여주기
	public List<Post> getCommuPosts(int commu_code); // 해당 커뮤의 게시글들
	public void insertPost(Post p); // 게시글 업로드
	public Post postDetail(int post_code); // 게시글 자세히 보기
}
