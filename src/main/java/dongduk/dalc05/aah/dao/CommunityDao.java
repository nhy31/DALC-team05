package dongduk.dalc05.aah.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import dongduk.dalc05.aah.domain.Community;
import dongduk.dalc05.aah.domain.Post;

@Repository
public interface CommunityDao {

	/* commu 관련*/
	List<Community> getCommuList(); // 전체 커뮤니티 리스트
	List<Community> getMyCommuList(int member_code); // 나의 커뮤니티들
	String getCommuName(int commu_code); // commu_code로 name 가져오기
	int checkName(String commu_name); // 커뮤 생성시, 이름 중복체크
	void insertCommu(Community c); // 커뮤니티 생성
	
	/* 게시글 post 관련*/
	List<Post> getAllPosts(); // 전체 게시글 
	List<Post> getBestPosts(); // 전체게시판 게시글 인기순 10개 보여주기
	List<Post> getCommuPosts(int commu_code); // 해당 커뮤의 게시글들
	void insertPost(Post p); // 게시글 업로드
}
