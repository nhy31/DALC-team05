package dongduk.dalc05.aah.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import dongduk.dalc05.aah.domain.Comment;
import dongduk.dalc05.aah.domain.Community;
import dongduk.dalc05.aah.domain.Post;
import dongduk.dalc05.aah.domain.cMember;

@Mapper
public interface CommunityMapper {
	
	/* commu 관련*/
	List<Community> getCommuList(int member_code); // 나의 커뮤가 아닌 전체 커뮤니티 리스트
	List<Community> getMyCommuList(int member_code); // 나의 커뮤니티들
	String getCommuName(int commu_code); // commu_code로 name 가져오기
	int checkName(String commu_name); // 커뮤 생성시, 이름 중복체크
	void insertCommu(Community c); // 커뮤니티 생성
	void insertCmember(cMember cm); // 커뮤 가입
	void cancelCmember(cMember cm); // 커뮤가입 해지
	Community getCommuInfo(int commu_code); // 커뮤정보 가져오기
	int getCommuCode(String commu_name); // 방금 생성된 커뮤코드 가져오기위한 메소드
	
	/* 게시글 post 관련*/
	List<Post> getAllPosts(); // 전체 게시글 
	List<Post> getBestPosts(); // 전체게시판 게시글 인기순 10개 보여주기
	List<Post> getCommuPosts(int commu_code); // 해당 커뮤의 게시글들
	void insertPost(Post p); // 게시글 업로드
	void deletePost(int post_code); // 게시글 삭제
	Post postDetail(int post_code); // 게시글 자세히 보기
	void hitsCount(int post_code); // 게시글 조회 (조회수증가)
	int countComment(int post_code); // 게시글의 댓글수 카운트
	
	/* 댓글 comment 관련 */
	void insertComment(Comment c); // 댓글 업로드
	void deleteComment(int comment_code); // 댓글 삭제
	List<Comment> getComments(int post_code); // 댓글 모두 가져오기
	
	/* 키워드로 커뮤 가져오기 */
	List<Community> getCommunityByKeyword(String keyword);
}
