package dongduk.dalc05.aah.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dongduk.dalc05.aah.domain.Community;
import dongduk.dalc05.aah.domain.Post;
import dongduk.dalc05.aah.service.MemberService;

public class PostController {
	
	@Autowired
	private MemberService memberService;
	
	// 게시글 작성 페이지로 이동
	@RequestMapping(value="/community/post")
	public ModelAndView post(
			HttpServletRequest request,
			Model model) {
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		String member_nickName = (String) session.getAttribute("member_nickName");	
		int member_code = memberService.getMemberCode(member_id);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("community/post");
		
		Date time = new Date(System.currentTimeMillis());
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		String now = format.format(time);

		Post p = new Post();
		p.setMember_code(member_code);
		p.setMember_nickName(member_nickName);
		
		// p.setPost_uploadDate(time);
		
//		List<Community> list = new ArrayList<>();
//	    list = commuService.myCommuList(); // 나의 커뮤니티들 불러오기
		
		mav.addObject("post", p);
		return mav;
		
	}
				

}
