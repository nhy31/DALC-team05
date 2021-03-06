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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dongduk.dalc05.aah.domain.Comment;
import dongduk.dalc05.aah.domain.Community;
import dongduk.dalc05.aah.domain.Member;
import dongduk.dalc05.aah.domain.Post;
import dongduk.dalc05.aah.domain.Sick;
import dongduk.dalc05.aah.domain.cMember;
import dongduk.dalc05.aah.service.CommunityService;
import dongduk.dalc05.aah.service.MemberService;
import dongduk.dalc05.aah.service.SickService;
import dongduk.dalc05.aah.util.ImageUtil;

@Controller
public class CommunityController {
   
   @Autowired
   private CommunityService commuService;

   @Autowired
   private SickService sickService;
   
   @Autowired
   private MemberService memberService;
   
   @Autowired
   private ImageUtil imageUtil; 
   
   // 메인에서 커뮤니티 카테고리로 이동
   @RequestMapping(value = "/community")
   public ModelAndView commuMain(
		   HttpServletRequest request,
		   Model model) {
	 
	  HttpSession session = request.getSession();
	  Member m = (Member) session.getAttribute("loginMember");
	  ModelAndView mav = new ModelAndView();
	  mav.setViewName("community/community_main");
	  
	  // 로그인 X -> 이용불가
	  if(m == null) {
		  	
		  	mav.setViewName("alert/warning");
			model.addAttribute("msg", "로그인 후 이용하실 수 있습니다.");
	        model.addAttribute("url","/member/login");
	        return mav;
	  }
  
      List<Post> bests = new ArrayList<>();
      bests = commuService.getBestPosts(); // 조회순 나열해서 10개 뽑아서 정렬
      mav.addObject("BestPosts", bests);
      
      int member_code = m.getMember_code();
      List<Community> cList = new ArrayList<>();
      cList = commuService.getMyCommuList(member_code);
      for(int i=0; i<cList.size(); i++) {
    	  cList.get(i).setSick_name(sickService.getSickName(cList.get(i).getSick_code()));
      }
      mav.addObject("MyCommuList", cList);

      List<Community> list = new ArrayList<>();
      list = commuService.getCommuList(member_code); // 전체 불러오기
      for(int i=0; i<list.size(); i++) {
    	  list.get(i).setSick_name(sickService.getSickName(list.get(i).getSick_code()));
      }
      mav.addObject("CommuList", list);
      
      return mav;
   }
   
   // 리스트에서 클릭하면 커뮤니티에 대한 글을 모두 보기
   @RequestMapping(value = "/community/posts")
   public ModelAndView commuPosts(
		   HttpServletRequest request,
		   @RequestParam("commu_code") int commu_code) {
	   
	   HttpSession session = request.getSession();
	   Member m = (Member) session.getAttribute("loginMember");
	   ModelAndView mav = new ModelAndView();
	   mav.setViewName("community/posts");
	   
	   int writeOk = 0; // 내 게시판이 아님 -> 글쓰기 못함
	   List<Community> Mylist = commuService.getMyCommuList(m.getMember_code());
	   System.out.println("글쓰기버튼 존재유무 확인 넘어온 커뮤코드 " + commu_code);
	   System.out.println("글쓰기버튼 존재유무 확인 멤버코드 " + m.getMember_code());
	   System.out.println(Mylist.size());
	   
	   for(int i=0; i<Mylist.size(); i++) {
		   System.out.println("글쓰기버튼 존재유무 확인 " + Mylist.get(i).getCommu_name());
		   if(commu_code == Mylist.get(i).getCommu_code()) {
			   writeOk = 1;
	           mav.addObject("writeOk", writeOk);
		   }
	   }
	 
	   System.out.println("글쓰기버튼 존재유무 확인 " + writeOk);
	   
	   List<Post> list = new ArrayList<>();
	   // 전체 게시판 선택 
	   if(commu_code == 0) {
		   list = commuService.getAllPosts();
	   }
	   else {   
		   list = commuService.getCommuPosts(commu_code);
	   }
	   
	   for(int i=0; i<list.size(); i++) {
		   int code = list.get(i).getMember_code();
		   int post = list.get(i).getPost_code();
		   list.get(i).setMember_nickName(memberService.getMemberInfo(code).getMember_nickName());
		   list.get(i).setCommentNum(commuService.countComment(post));
		   System.out.println("0219 댓글수" + list.get(i).getCommentNum());
	   }
	  mav.addObject("posts", list);
	  
	  Community c = commuService.getCommuInfo(commu_code);
	  c.setSick_name(sickService.getSickName(c.getSick_code()));
	  mav.addObject("c", c);
	
	  List<Post> bests = new ArrayList<>();
      bests = commuService.getBestPosts(); // sql 쿼리로 조회순 나열해서 10개 뽑아서 정렬
      mav.addObject("BestPosts", bests);
      return mav;
   }
   
   // 커뮤니티 생성페이지로 이동
   @RequestMapping(value = "/community/create")
   public ModelAndView commuCreate() {
	   ModelAndView mav = new ModelAndView();
	   mav.setViewName("community/create");
	   List<Sick> list = new ArrayList<>();
	   list = sickService.getSickList();
	   list.get(0).setChecked(1);
	   mav.addObject("sicks", list);
	   return mav;
   }
   
   // 커뮤니티 생성
   @RequestMapping(value = "/community/create.do")
   public ModelAndView commuCreateDo(
		   HttpServletRequest request,
		   Model model,
		   RedirectAttributes redirect,
		   @RequestParam int sick_code,
		   @RequestParam String commu_name,
		   @RequestParam String commu_introduce
		   ) {
	   
	   ModelAndView mav = new ModelAndView();
	
	   HttpSession session = request.getSession();
	   Member m = (Member) session.getAttribute("loginMember");
		
	   // 커뮤니티 이름 중복체크
	   if(commuService.checkName(commu_name) != 0) {
		  	mav.setViewName("alert/warning");
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
	   
	   int commu_code = commuService.getCommuCode(commu_name);
	   
	   cMember cm = new cMember(m.getMember_code(), commu_code);
	   commuService.insertCmember(cm);

	   redirect.addAttribute("commu_code", commu_code); 
	   mav.setViewName("redirect:/community/posts");

	   return mav;
   }
   
	// 게시글 작성 페이지로 이동
	@RequestMapping(value = "/community/post/upload")
	public ModelAndView postUpload(
			HttpServletRequest request,
			Model model,
			@RequestParam ("commu_code") int commu_code) {
		
		System.out.print("0218확인" + commu_code);
		
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
		p.setCommu_code(commu_code);
		p.setCommu_name(commuService.getCommuName(commu_code));
		mav.addObject("post", p);
		
		String sick = sickService.getSickName(commuService.getCommuInfo(p.getCommu_code()).getSick_code());
		mav.addObject("sick", sick);

		return mav;	
	}
	
	// 게시글 자세히보기
	@RequestMapping(value = "/community/post/detail")
	public ModelAndView postDetail(
			HttpServletRequest request,
			Model model,
			@RequestParam ("post_code") int post_code) {
		
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
		
		System.out.println("게시글상세보기 test");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/community/post/detail");
		
		commuService.hitsCount(post_code);
		
		Post p = commuService.postDetail(post_code);
		String postWriter = memberService.getMemberInfo(p.getMember_code()).getMember_nickName();
		
		p.setCommu_name(commuService.getCommuName(p.getCommu_code()));
		p.setMember_nickName(postWriter);
		p.setCommentNum(commuService.countComment(post_code));
		
		String sick = sickService.getSickName(commuService.getCommuInfo(p.getCommu_code()).getSick_code());
		
		mav.addObject("sick", sick);
		
		mav.addObject("post", p);
		mav.addObject("me", m);
		
		List<Comment> comments = new ArrayList<>();
		comments = commuService.getComments(post_code);
		System.out.print("0220확인" + post_code);
		
		for(int i=0; i<comments.size(); i++) {
			Member writer = memberService.getMemberInfo(comments.get(i).getMember_code());
			comments.get(i).setMember_nickName(writer.getMember_nickName());
			comments.get(i).setMember_image(writer.getMember_image());
		
		}
		mav.addObject("comments", comments);
		
		mav.setViewName("community/postDetail");
		return mav;
		
	}

	
	// 게시글 업로드
	@RequestMapping(value = "/community/post/upload.do")
	public ModelAndView postUploadDo(
			HttpServletRequest request,
			RedirectAttributes redirect,
			@RequestParam int commu_code,
			@RequestParam String post_title,
			@RequestParam String post_content,
			MultipartFile img_file
			) {
		
		System.out.println("게시글업로드 test");
		ModelAndView mav = new ModelAndView();
	    String post_img = imageUtil.uploadImage(request, img_file);
		
		System.out.println("uploadPost  post_img  : " +  post_img );
		
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");

		String commu_name = commuService.getCommuName(commu_code);
		int post_hits = 0;
		Date now = new Date();
		
		Post p = new Post(commu_code, m.getMember_code(), post_title, post_content, post_hits,
				now, m.getMember_nickName(), commu_name, post_img);
		commuService.insertPost(p);
		System.out.println("게시글업로드 SUECESS");
		
		redirect.addAttribute("commu_code", commu_code); 
		mav.setViewName("redirect:/community/posts");
		return mav;
	}
		
	// 게시글 삭제
	@RequestMapping(value = "/community/post/delete")
	public ModelAndView postDelete(
			HttpServletRequest request,
			RedirectAttributes redirect,
			@RequestParam int post_code,
			@RequestParam int commu_code
			) {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("게시글삭제 test");

		commuService.deletePost(post_code);
		
		redirect.addAttribute("commu_code", commu_code); 
		mav.setViewName("redirect:/community/posts");
		return mav;
		
	}		
		
	// 커뮤니티 가입
	@RequestMapping(value = "/community/join")
	public ModelAndView joinCommu (
			HttpServletRequest request,
			RedirectAttributes redirect,
			@RequestParam int commu_code,
			Model model) {
		
		System.out.println("커뮤가입 test");
		
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
		
		cMember cm = new cMember(m.getMember_code(), commu_code);
		
		commuService.insertCmember(cm);
		
		ModelAndView mav = new ModelAndView();
		//redirect.addAttribute("commu_code", commu_code); 
	
		mav.setViewName("redirect:/community");


        return mav;

	}
	
	// 커뮤니티 가입해제
	@RequestMapping(value = "/community/join/cancel")
	public ModelAndView cancelJoinCommu (
			HttpServletRequest request,
			RedirectAttributes redirect,
			@RequestParam int commu_code,
			Model model) {
		
		System.out.println("커뮤가입해지 test");
		
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
		
		cMember cm = new cMember(m.getMember_code(), commu_code);
		
		commuService.cancelCmember(cm);

		ModelAndView mav = new ModelAndView();
		
        mav.setViewName("redirect:/community");

        return mav;

	}
	
	// 모댓글 업로드
	@RequestMapping(value = "/community/post/comment/upload")
	public ModelAndView uploadComment (
			HttpServletRequest request,
			RedirectAttributes redirect,
			@RequestParam ("post_code") int post_code,
			@RequestParam ("comment_content") String comment_content,
			Model model) {
		
		System.out.println("댓글업로드");
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
		
		Date now = new Date();
		
		Comment c = new Comment(post_code, m.getMember_code(), comment_content,
				now, m.getMember_nickName(), m.getMember_image(), 0);
		
		commuService.insertComment(c);

		
		
		ModelAndView mav = new ModelAndView();
		
		redirect.addAttribute("post_code", post_code);
		
        mav.setViewName("redirect:/community/post/detail");

        return mav;

	}

	// 모댓글 삭제
	@RequestMapping(value = "/community/post/comment/delete")
	public ModelAndView deleteComment (
			HttpServletRequest request,
			RedirectAttributes redirect,
			@RequestParam ("post_code") int post_code,
			@RequestParam ("comment_code") int comment_code,
			Model model) {
		
		ModelAndView mav = new ModelAndView();
		
		commuService.deleteComment(comment_code);
		
		
		redirect.addAttribute("post_code", post_code);
		
        mav.setViewName("redirect:/community/post/detail");

        
		return mav;


	}
}