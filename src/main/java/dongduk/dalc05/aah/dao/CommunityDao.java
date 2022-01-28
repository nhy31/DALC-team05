package dongduk.dalc05.aah.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import dongduk.dalc05.aah.domain.Community;
import dongduk.dalc05.aah.domain.Member;
import dongduk.dalc05.aah.domain.Post;
import dongduk.dalc05.aah.domain.Sick;

@Repository
public interface CommunityDao {

	// 인기글 10개 보여주기
	List<Post> getBestPosts();
	
	int getSickCode(String sick_name);
	
	void insertCommu(Community c);
	
	String checkName(String commu_name);
	
	String getCommuName(int coomu_code);
	
	String getMemberNickName(int member_code);
	
	//전체 커뮤니티리스트 보기
	List<Community> getCommuList();
	
	String getSickName(int sick_code);
	
	List<Sick> getSickNameList();
	
}
