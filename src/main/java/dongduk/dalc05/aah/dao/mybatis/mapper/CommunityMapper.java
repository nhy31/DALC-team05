package dongduk.dalc05.aah.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import dongduk.dalc05.aah.domain.Community;
import dongduk.dalc05.aah.domain.Post;

@Mapper
public interface CommunityMapper {
	
	// 인기글 10개 보여주기
	List<Post> getBestPosts();


	String getCommuName(int coomu_code);
	
	String getMemberNickName(int member_code);
	
	// 전체 커뮤니티 리스트 보여주기
	List<Community> getCommuList();
	
	String getSickName(int sick_code);

}
