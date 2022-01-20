package dongduk.dalc05.aah.service;

import java.util.List;

import dongduk.dalc05.aah.domain.Post;

public interface CommunityService {
	
	// 인기글 10개 보여주기
	public List<Post> getBestPosts();
	
//	public getCommuName(int coomu_code);
//	
//	public getMemberNickName(int memmer_code);

}
