package dongduk.dalc05.aah.dao.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dongduk.dalc05.aah.dao.CommunityDao;
import dongduk.dalc05.aah.dao.mybatis.mapper.CommunityMapper;
import dongduk.dalc05.aah.dao.mybatis.mapper.MemberMapper;
import dongduk.dalc05.aah.domain.Community;
import dongduk.dalc05.aah.domain.Post;
import dongduk.dalc05.aah.domain.Sick;

@Repository
public class CommunityDaoImpl implements CommunityDao {
	
	@Autowired
	private CommunityMapper communityMapper;
	
	@Override
	public void insertCommu(Community c) {
		// TODO Auto-generated method stub
		communityMapper.insertCommu(c);
	}
	
	@Override
	public String checkName(String commu_name) {
		// TODO Auto-generated method stub
		return communityMapper.checkName(commu_name);
	}
	
	// 인기글 10개 보여주기
	@Override
	public List<Post> getBestPosts() {
		return communityMapper.getBestPosts();
	}
	
	@Override
	public String getCommuName(int coomu_code) {
		return communityMapper.getCommuName(coomu_code);
	}
	
	@Override
	public String getMemberNickName(int member_code) {
		return communityMapper.getMemberNickName(member_code);
	}

	@Override
	public List<Community> getCommuList() {
		return communityMapper.getCommuList();
	}


	@Override
	public int getSickCode(String sick_name) {
		// TODO Auto-generated method stub
		return communityMapper.getSickCode(sick_name);
	}




}
