package dongduk.dalc05.aah.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import dongduk.dalc05.aah.domain.Community;
import dongduk.dalc05.aah.domain.Post;

@Mapper
public interface CommunityMapper {
	
	// 전체게시판 게시글 인기순 10개 보여주기
	List<Post> getBestPosts();
		
	// 전체 커뮤니티 리스트 보기
	List<Community> getCommuList();
		
	// 나의 커뮤니티들
	List<Community> myCommuList(int member_code);
		
	// 커뮤니티 생성
	void insertCommu(Community c);
		
	// 커뮤 생성시 커뮤이름 중복확인
	String checkName(String commu_name);
		
	// commu_code로 name 가져오기
	String getCommuName(int commu_code);
	
}
