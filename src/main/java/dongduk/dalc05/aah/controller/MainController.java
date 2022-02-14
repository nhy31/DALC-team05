package dongduk.dalc05.aah.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dongduk.dalc05.aah.domain.Member;

@Controller
public class MainController {
	
	// 완료 // 홈 메인페이지 시작
	@RequestMapping(value="/main")
	public ModelAndView main(
			HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/main");
		
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
		if (m == null) {
			mav.addObject("ses", 0);
		} 
		else {
			mav.addObject("ses", 1);
			System.out.println("MainController - 로그인성공");

			mav.addObject("member_id", m.getMember_id());
			mav.addObject("member_nickName", m.getMember_nickName());
		}
		return mav;
	}
	
	@RequestMapping(value="/main/search")
	public ModelAndView searchKeyword(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/search");
		
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
		if (m == null) {
			mav.addObject("ses", 0);
		} 
		else {
			mav.addObject("ses", 1);
			System.out.println("MainController - 로그인성공");

			mav.addObject("member_id", m.getMember_id());
			mav.addObject("member_nickName", m.getMember_nickName());
		}
		return mav;
	}
}