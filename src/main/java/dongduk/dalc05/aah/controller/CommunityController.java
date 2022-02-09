package dongduk.dalc05.aah.controller;

import java.util.ArrayList;
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
   
   // 메인에서 커뮤니티로 이동
   @RequestMapping(value = "/community")
   public ModelAndView getCommuMain(
		   HttpServletRequest request,
		   Model model) {
	   
	  HttpSession session = request.getSession();
	  Member m = (Member) session.getAttribute("loginMember");
	  
	  // 로그인 X -> 이용불가
	  if(m == null) {
		  	ModelAndView mav = new ModelAndView();
		  	mav.setViewName("alert/error");
			model.addAttribute("msg", "로그인 후 이용하실 수 있습니다.");
	        model.addAttribute("url","/member/login");
	        return mav;
	  }
	  
	  int member_code = m.getMember_code();
	  
	  ModelAndView mav = new ModelAndView();
      mav.setViewName("community/community_main");
      
      List<Post> bests = new ArrayList<>();
      bests = commuService.getBestPosts(); // sql 쿼리로 조회순 나열해서 10개 뽑아서 정렬
      mav.addObject("BestPosts", bests);
      
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
   public ModelAndView getCommuList() {
	   
      List<Community> list = new ArrayList<>();
      list = commuService.getCommuList(); // 전체 불러오기
      
      for(int i=0; i<list.size(); i++) {
    	  list.get(i).setSick_name(sickService.getSickName(list.get(i).getSick_code()));
    	  
    	  System.out.println("commulist getCommu_code() "+ list.get(i).getCommu_code());
    	  System.out.println("commulist getCommu_name()"+ list.get(i).getCommu_name());
    	  System.out.println("commulist getSick_code()"+ list.get(i).getSick_code());
    	  System.out.println("commulist getSick_name()"+ list.get(i).getSick_name());
    	  System.out.println("commulist getCommu_introduce()"+ list.get(i).getCommu_introduce());
      }
     
      ModelAndView mav = new ModelAndView();
      mav.setViewName("community/community_list");
      mav.addObject("CommuList", list);
      return mav;
   }
   
   // 커뮤니티 생성하기로 이동
   @RequestMapping(value = "/community/create")
   public ModelAndView commuCreate(
       HttpServletRequest request) {
	   
	   ModelAndView mav = new ModelAndView();
	   mav.setViewName("community/community_create");
	   
	   List<Sick> list = new ArrayList<>();
	   list = sickService.getSickList();
	   mav.addObject("sicks", list);
	   
	   return mav;
   }
   
   // 커뮤니티 생성
   @RequestMapping(value = "/community/create.do")
   public ModelAndView createDo(
		   Model model,
		   @RequestParam int sick_code,
		   @RequestParam String commu_name,
		   @RequestParam String commu_introduce
		   ) {
	   
	   ModelAndView mav = new ModelAndView();
	
	   // 커뮤니티 이름 중복체크
	   if(commuService.checkName(commu_name) != 0) {
		  	mav.setViewName("alert/alert");
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
}