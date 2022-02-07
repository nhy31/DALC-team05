package dongduk.dalc05.aah.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	// 홈 메인페이지 시작
	@RequestMapping(value="/main")
	public ModelAndView main(
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		String member_nickName = (String) session.getAttribute("member_nickName");
	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/main");
		
		if (member_id == null) {
			mav.addObject("ses", 0);
		} 
		else {
			mav.addObject("ses", 1);
			System.out.println("MainController - 로그인성공");
			System.out.println("MainController - member_id : " + member_id);
			System.out.println("MainController - member_nickName : " + member_nickName);
			mav.addObject("member_id", member_id);
			mav.addObject("member_nickName", member_nickName);
		}
		
		return mav;
	}
}