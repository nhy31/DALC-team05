package dongduk.dalc05.aah.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import dongduk.dalc05.aah.domain.Member;
import dongduk.dalc05.aah.domain.Post;

@Repository
public interface CommunityDao {

	// 인기글 10개 보여주기
	List<Post> getBestPosts();
	
}
