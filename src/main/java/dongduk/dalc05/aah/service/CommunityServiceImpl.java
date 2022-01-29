package dongduk.dalc05.aah.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dongduk.dalc05.aah.dao.CommunityDao;
import dongduk.dalc05.aah.domain.Community;
import dongduk.dalc05.aah.domain.Post;
import dongduk.dalc05.aah.domain.Sick;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	private CommunityDao commuDao;
	
	@Override
	public void insertCommu(Community c) {
		// TODO Auto-generated method stub
		commuDao.insertCommu(c);
	}

	// 인기글 10개 보여주기
	public List<Post> getBestPosts() {
		return commuDao.getBestPosts();
	}
	

	@Override
	public String checkName(String commu_name) {
		// TODO Auto-generated method stub
		return commuDao.checkName(commu_name);
	}

	@Override
	public String getCommuName(int coomu_code) {
		return commuDao.getCommuName(coomu_code);
	}

	@Override
	public String getMemberNickName(int member_code) {
		return commuDao.getMemberNickName(member_code);
	}

	@Override
	public List<Community> getCommuList() {
		return commuDao.getCommuList();
	}


	@Override
	public int getSickCode(String sick_name) {
		// TODO Auto-generated method stub
		return commuDao.getSickCode(sick_name);
	}



}
