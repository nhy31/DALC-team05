package dongduk.dalc05.aah.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dongduk.dalc05.aah.domain.Post;
import dongduk.dalc05.aah.service.CommunityService;
import dongduk.dalc05.aah.service.MemberService;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService commuService;
	
	@RequestMapping(value = "/main/community")
	public ModelAndView getCommuMain() {
		List<Post> list = new ArrayList<>();
			
		list = commuService.getBestPosts(); // 한 sql쿼리로 조회순 나열해서 10개정도뽑아서 정렬
		
		for(int i=0; i<list.size(); i++) {
			System.out.print(list.get(i).getPost_title());
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("community/list");
		mav.addObject("BestPosts", list);
		return mav;
	}
		
//	@RequestMapping(value = "/main/community")
//	public ModelAndView getCommuMain() {
//		List<Post> list = new ArrayList<>();
//			
//		list = commuService.getBestPosts(); // 한 sql쿼리로 조회순 나열해서 10개정도뽑아서 정렬
//		
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("community/list");
//		mav.addObject("BestPosts", list);
//		return mav;
//	}

}
