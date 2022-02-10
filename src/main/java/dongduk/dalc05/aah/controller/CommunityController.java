package dongduk.dalc05.aah.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dongduk.dalc05.aah.domain.Community;
import dongduk.dalc05.aah.domain.Member;
import dongduk.dalc05.aah.domain.Post;
import dongduk.dalc05.aah.domain.Sick;
import dongduk.dalc05.aah.service.CommunityService;
import dongduk.dalc05.aah.service.MemberService;
import dongduk.dalc05.aah.service.SickService;

@Controller
public class CommunityController {
   
   @Autowired
   private CommunityService commuService;

   @Autowired
   private SickService sickService;
   
   @Autowired
   private MemberService memberService;
   
   // 메인에서 커뮤니티 카테고리로 이동
   @RequestMapping(value = "/community")
   public ModelAndView commuMain(
		   HttpServletRequest request,
		   Model model) {
	 
	  HttpSession session = request.getSession();
	  Member m = (Member) session.getAttribute("loginMember");
	  
	  ModelAndView mav = new ModelAndView();
	  
	  // 로그인 X -> 이용불가
	  if(m == null) {
		  	
		  	mav.setViewName("alert/error");
			model.addAttribute("msg", "로그인 후 이용하실 수 있습니다.");
	        model.addAttribute("url","/member/login");
	        return mav;
	  }
	  
	  mav.setViewName("community/community_main");
	      
      List<Post> bests = new ArrayList<>();
      bests = commuService.getBestPosts(); // sql 쿼리로 조회순 나열해서 10개 뽑아서 정렬
      mav.addObject("BestPosts", bests);
      
	  int member_code = m.getMember_code();
      List<Community> cList = new ArrayList<>();
      cList = commuService.getMyCommuList(member_code);
      mav.addObject("MyCommuList", cList);
      
      List<Post> posts = new ArrayList<>(); 
      posts = commuService.getAllPosts(); // 전체 게시글 
      mav.addObject("posts", posts);
      return mav;
   }
   
   // 전체 커뮤니티 리스트보기
   @RequestMapping(value = "/community/list")
   public ModelAndView commuList() {
	   
	  ModelAndView mav = new ModelAndView();
	  mav.setViewName("community/list");
      List<Community> list = new ArrayList<>();
      list = commuService.getCommuList(); // 전체 불러오기
      mav.addObject("CommuList", list);
      return mav;
   }
   
   // 리스트에서 클릭하면 커뮤니티에 대한 글을 모두 볼 수 있음
   @RequestMapping(value = "/community/posts")
   public ModelAndView commuPosts(

		   @RequestParam("commu_code") int commu_code) {

		  
	   ModelAndView mav = new ModelAndView();
	   mav.setViewName("community/posts");
	   
	   List<Post> list = new ArrayList<>();
	   // 전체 게시판 선택 
	   if(commu_code == 0) {
		   list = commuService.getAllPosts();
	   }
	   else {
		   list = commuService.getCommuPosts(commu_code);
	   }
	  mav.addObject("posts", list);
	  
	 

      return mav;
   }
   
  
   // 커뮤니티 생성페이지로 이동
   @RequestMapping(value = "/community/create")
   public ModelAndView commuCreate() {
	   
	   ModelAndView mav = new ModelAndView();
	   mav.setViewName("community/create");
	   
	   List<Sick> list = new ArrayList<>();
	   list = sickService.getSickList();
	   mav.addObject("sicks", list);
	   return mav;
   }
   
   // 커뮤니티 생성
   @RequestMapping(value = "/community/create.do")
   public ModelAndView commuCreateDo(
		   Model model,
		   @RequestParam int sick_code,
		   @RequestParam String commu_name,
		   @RequestParam String commu_introduce
		   ) {
	   
	   ModelAndView mav = new ModelAndView();
	
	   // 커뮤니티 이름 중복체크
	   if(commuService.checkName(commu_name) != 0) {
		  	mav.setViewName("alert/error");
			model.addAttribute("msg", "이미 존재하는 커뮤니티 이름입니다.");
	        model.addAttribute("url","/community/create");
	        return mav;
	   }
	   
	   Community c = new Community();
	   c.setCommu_introduce(commu_introduce);
	   c.setCommu_name(commu_name);
	   c.setSick_code(sick_code);
	   c.setSick_name(sickService.getSickName(sick_code));
    
	   commuService.insertCommu(c);      

	   mav.setViewName("redirect:/community/list");
	   return mav;
   }
   
	// 게시글 작성 페이지로 이동
	@RequestMapping(value = "/community/post/upload")
	public ModelAndView postUpload(
			HttpServletRequest request,
			Model model) {
		
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
		int code = m.getMember_code();
		String nick = m.getMember_nickName();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("community/postUpload");
		mav.addObject("nickName", nick);
		
		Post p = new Post();
		Date now = new Date();
		p.setMember_code(code);
		p.setMember_nickName(nick);
		p.setPost_uploadDate(now);
		mav.addObject("post", p);

		List<Community> list = new ArrayList<>();
		list = commuService.getMyCommuList(code);
		mav.addObject("MyCommuList", list);
		
		return mav;	
	}
	
	// 게시글 자세히보기
	@RequestMapping(value = "/community/post/datail")
	public ModelAndView postDetail(
			HttpServletRequest request,
			Model model,
			@RequestParam int commu_code,
			@RequestParam String post_title,
			@RequestParam String post_content) {
		
		System.out.println("게시글업로드 test");
		
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");

		String commu_name = commuService.getCommuName(commu_code);
		int post_hits = 0;
		Date now = new Date();
		
		Post p = new Post(commu_code, m.getMember_code(), post_title, post_content, post_hits,
				now, m.getMember_nickName(), commu_name);
		commuService.insertPost(p);
		System.out.println("게시글업로드 SUECESS");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/community/post/detail");
		
		return mav;
		
	}

	
	// 게시글 업로드
	@RequestMapping(value = "/community/post/upload.do")
	public ModelAndView postUploadDo(
			HttpServletRequest request,
			Model model,
			@RequestParam int commu_code,
			@RequestParam String post_title,
			@RequestParam String post_content) {
		
		System.out.println("게시글업로드 test");
		
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");

		String commu_name = commuService.getCommuName(commu_code);
		int post_hits = 0;
		Date now = new Date();
		
		Post p = new Post(commu_code, m.getMember_code(), post_title, post_content, post_hits,
				now, m.getMember_nickName(), commu_name);
		commuService.insertPost(p);
		System.out.println("게시글업로드 SUECESS");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/community/post/detail");
		
		return mav;
		
	}

   
   
   
}