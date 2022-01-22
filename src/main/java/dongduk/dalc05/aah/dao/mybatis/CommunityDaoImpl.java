package dongduk.dalc05.aah.dao.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dongduk.dalc05.aah.dao.CommunityDao;
import dongduk.dalc05.aah.dao.mybatis.mapper.CommunityMapper;
import dongduk.dalc05.aah.dao.mybatis.mapper.MemberMapper;
import dongduk.dalc05.aah.domain.Post;

@Repository
public class CommunityDaoImpl implements CommunityDao {
	
	@Autowired
	private CommunityMapper communityMapper;
	
	// 인기글 10개 보여주기
	@Override
	public List<Post> getBestPosts() {
		return communityMapper.getBestPosts();
	}
	
	public String getCommuName(int coomu_code) {
		return communityMapper.getCommuName(coomu_code);
	}
	
	public String getMemberNickName(int member_code) {
		return communityMapper.getMemberNickName(member_code);
	}

}
