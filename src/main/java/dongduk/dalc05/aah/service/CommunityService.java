package dongduk.dalc05.aah.service;

import java.util.List;

import dongduk.dalc05.aah.domain.Community;
import dongduk.dalc05.aah.domain.Post;

public interface CommunityService {
	
	// 인기글 10개 보여주기
	public List<Post> getBestPosts();
	
	public String getCommuName(int coomu_code);
	
	public String getMemberNickName(int member_code);
	
	//전체 커뮤니티리스트 보기
	public List<Community> getCommuList();

	public String getSickName(int sick_code);
}
