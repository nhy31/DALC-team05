package dongduk.dalc05.aah.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import dongduk.dalc05.aah.domain.Post;

@Mapper
public interface CommunityMapper {
	
	// 인기글 10개 보여주기
	List<Post> getBestPosts();

}
