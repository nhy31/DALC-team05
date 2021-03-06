package dongduk.dalc05.aah.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dongduk.dalc05.aah.dao.CommunityDao;
import dongduk.dalc05.aah.domain.Comment;
import dongduk.dalc05.aah.domain.Community;
import dongduk.dalc05.aah.domain.Post;
import dongduk.dalc05.aah.domain.cMember;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	private CommunityDao commuDao; 
	
	/* commu 관련*/
	// 나의 커뮤가 아닌 전체 커뮤니티 리스트 
	@Override
	public List<Community> getCommuList(int member_code) { return commuDao.getCommuList(member_code); }
	
	// 나의 커뮤니티들
	@Override
	public List<Community> getMyCommuList(int member_code) { return commuDao.getMyCommuList(member_code); };

	// commu_code로 name 가져오기
	@Override
	public String getCommuName(int commu_code) { return commuDao.getCommuName(commu_code); }

	// 커뮤 생성시, 이름 중복체크
	@Override
	public int checkName(String commu_name) { return commuDao.checkName(commu_name); }
	
	// 커뮤니티 생성
	@Override
	public void insertCommu(Community c) { commuDao.insertCommu(c); }
	
	// 커뮤 가입
	@Override
	public void insertCmember(cMember cm) { commuDao.insertCmember(cm); }
	
	// 커뮤가입 해지
	@Override
	public void cancelCmember(cMember cm) { commuDao.cancelCmember(cm); }
	
	// 커뮤정보 가져오기
	@Override
	public Community getCommuInfo(int commu_code) { return commuDao.getCommuInfo(commu_code); }
	
	// 방금 생성된 커뮤코드 가져오기위한 메소드
	@Override
	public int getCommuCode(String commu_name) { return commuDao.getCommuCode(commu_name); }
	
	/* 게시글 post 관련*/
	// 전체 게시글 
	@Override
	public List<Post> getAllPosts() { return commuDao.getAllPosts(); }

	// 전체게시판 게시글 인기순 10개 보여주기
	@Override
	public List<Post> getBestPosts() { return commuDao.getBestPosts(); }
	
	// 해당 커뮤의 게시글들
	@Override
	public List<Post> getCommuPosts(int commu_code) { return commuDao.getCommuPosts(commu_code); }
	
	// 게시글 업로드
	@Override
	public void insertPost(Post p) { commuDao.insertPost(p); }
	
	// 게시글 삭제
	@Override
	public void deletePost(int post_code) { commuDao.deletePost(post_code); }

	// 게시글 자세히 보기
	@Override
	public Post postDetail(int post_code) { return commuDao.postDetail(post_code); }

	// 게시글 조회 (조회수증가)
	@Override
	public void hitsCount(int post_code) { commuDao.hitsCount(post_code); }
	
	// 게시글의 댓글수 카운트
	@Override
	public int countComment(int post_code) { return commuDao.countComment(post_code); }

	// 댓글 업로드
	@Override
	public void insertComment(Comment c) { commuDao.insertComment(c); }
	
	// 댓글 삭제
	@Override
	public void deleteComment(int comment_code) { commuDao.deleteComment(comment_code); } 
	
	// 댓글 모두 가져오기
	@Override
	public  List<Comment> getComments(int post_code) { return commuDao.getComments(post_code); }

	// 키워드로 커뮤 불러오기
	@Override
	public List<Community> getCommunityByKeyword(String keyword) {
		return commuDao.getCommunityByKeyword(keyword);
	} 

}
