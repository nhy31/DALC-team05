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
import dongduk.dalc05.aah.domain.Post;
import dongduk.dalc05.aah.service.CommunityService;
import dongduk.dalc05.aah.service.MemberService;
import dongduk.dalc05.aah.service.SickService;

@Controller
public class PostController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SickService sickService;
	
	@Autowired
	private CommunityService commuService;
	
	// 게시글 작성 페이지로 이동
	@RequestMapping(value = "/community/post/upload")
	public ModelAndView postUpload(
			HttpServletRequest request,
			Model model) {
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		String member_nickName = (String) session.getAttribute("member_nickName");	
		int member_code = memberService.getMemberCode(member_id);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("community/postUpload");
		mav.addObject("nickName", member_nickName);
		
		Post p = new Post();
		Date now = new Date();
		p.setMember_code(member_code);
		p.setMember_nickName(member_nickName);
		p.setPost_uploadDate(now);
		mav.addObject("post", p);

		List<Community> list = new ArrayList<>();
		list = commuService.getMyCommuList(member_code);
		mav.addObject("MyCommuList", list);
		
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
		String member_id = (String) session.getAttribute("member_id");
		String member_nickName = (String) session.getAttribute("member_nickName");	
		
		int member_code = memberService.getMemberCode(member_id);
		String commu_name = commuService.getCommuName(commu_code);
		int post_hits = 0;
		Date now = new Date();
		
		Post p = new Post(commu_code, member_code, post_title, post_content, post_hits,
				now, member_nickName, commu_name);
		commuService.insertPost(p);
		System.out.println("게시글업로드 SUECESS");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main/community");
		
		return mav;
		
	}

}
