package dongduk.dalc05.aah.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dongduk.dalc05.aah.domain.Community;
import dongduk.dalc05.aah.domain.Post;
import dongduk.dalc05.aah.domain.Sick;
import dongduk.dalc05.aah.service.CommunityService;

@Controller
public class CommunityController {
   
   @Autowired
   private CommunityService commuService;
   
   @RequestMapping(value = "/main/community")
   public ModelAndView getCommuMain(
		   HttpServletRequest request,
		   Model model) {
	   
	  HttpSession session = request.getSession();
	  String member_id = (String) session.getAttribute("member_id");
	  
	  if(member_id == null) {
		  	ModelAndView mav = new ModelAndView();
		  	mav.setViewName("alert/alert");
			model.addAttribute("msg", "로그인 후 이용하실 수 있습니다.");
	        model.addAttribute("url","/main/login");
	    
	        return mav;
	  }
	   
      List<Post> bests = new ArrayList<>();
      bests = commuService.getBestPosts(); // sql쿼리로 조회순 나열해서 10개정도뽑아서 정렬
      
      for(int i=0; i<bests.size(); i++) {
         bests.get(i).setMember_nickName(commuService.getMemberNickName(bests.get(i).getMember_code()));
         bests.get(i).setCommu_name(commuService.getCommuName(bests.get(i).getCommu_code()));
         
         System.out.println(bests.get(i).getPost_title());
      }
         
      ModelAndView mav = new ModelAndView();
      mav.setViewName("community/list");
      mav.addObject("BestPosts", bests);
      return mav;
   }
    
   // 전체커뮤들보기
   @RequestMapping(value = "/community/commulist")
   public ModelAndView getCommuList() {
      List<Community> list = new ArrayList<>();
         
      list = commuService.getCommuList(); // 전체불러옴
      
      for(int i=0; i<list.size(); i++) {
    	  list.get(i).setMember_nickName(commuService.getMemberNickName(list.get(i).getMember_code()));
    	  list.get(i).setSick_name(commuService.getSickName(list.get(i).getSick_code()));
    	  
    	  System.out.println("M "+ list.get(i).getCommu_code());
    	  System.out.println("M "+ list.get(i).getMember_code());
    	  System.out.println("M "+ list.get(i).getMember_nickName());
    	  System.out.println("M "+ list.get(i).getCommu_name());
    	  System.out.println("M "+ list.get(i).getSick_code());
    	  System.out.println("M "+ list.get(i).getSick_name());
      }
     
      ModelAndView mav = new ModelAndView();
      mav.setViewName("community/commuList");
      mav.addObject("CommuList", list);
      return mav;
   }
   
   //커뮤생성하기로 이동
   @RequestMapping(value = "/community/create")
   public ModelAndView commuCreate(
		   HttpServletRequest request) {
	  
	   HttpSession session = request.getSession();
	   String MyNickName = (String) session.getAttribute("member_nickName");
	   
	   System.out.println("commu create" + MyNickName);
	   
	   ModelAndView mav = new ModelAndView();
	   mav.setViewName("community/create");
	   
	   List<Sick> list = new ArrayList<>();
	   list = commuService.getSickNameList();

	   mav.addObject("sicks", list);
	   
	   mav.addObject(MyNickName, MyNickName);
	   
	   return mav;
   }
   
//   @RequestMapping(value = "/community/create.do")
//   public ModelAndView createDo(
//		   HttpServletRequest request) {
//	   HttpSession session = request.getSession();
//	   
//	   
//	   
//	   
//	   return null;
//	   
//   }
//   
   
   
   
	 
  

}