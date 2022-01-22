package dongduk.dalc05.aah.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dongduk.dalc05.aah.dao.CommunityDao;
import dongduk.dalc05.aah.domain.Post;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	private CommunityDao commuDao;
	
	// 인기글 10개 보여주기
	public List<Post> getBestPosts() {
		return commuDao.getBestPosts();
	}

	@Override
	public String getCommuName(int coomu_code) {
		return commuDao.getCommuName(coomu_code);
	}

	@Override
	public String getMemberNickName(int member_code) {
		return commuDao.getMemberNickName(member_code);
	}
	

}
