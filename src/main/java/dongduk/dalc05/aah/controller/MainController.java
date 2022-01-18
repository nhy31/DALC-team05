//1111111
//메인페이지에서 이동하는 모든 것들에 대한 컨트롤러
package dongduk.dalc05.aah.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	@RequestMapping(value="/main")
	public ModelAndView main(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String member_code = (String) session.getAttribute("member_code");
		String member_id = (String) session.getAttribute("member_id");
		String member_nickName = (String) session.getAttribute("member_nickName");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/main");
		
		if (member_id == null) {
			mav.addObject("ses", 0);
		} 
		else {
			mav.addObject("ses", 1);
			System.out.println("MainController - login success!");
			System.out.println("MainController - member_id : " + member_id);
			System.out.println("MainController - member_nickName : " + member_nickName);
			mav.addObject("member_id", member_id);
			mav.addObject("member_nickName", member_nickName);
		}
		return mav;
	}

	
	// 로그인상태 : 메인페이지 -> 로그아웃
	@RequestMapping(value = "/main/logout.do", method = RequestMethod.GET)
	public String logoutDo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("member_id");
		session.removeAttribute("member_code");
		session.removeAttribute("member_nickName");

		return "main/main";
	}
	
	// 메인페이지 -> 로그인페이지 이동
    @RequestMapping(value = "/main/login")
    public String login() {
		return "member/login";
    }
    
	// 메인페이지 -> 회원가입페이지 이동
    @RequestMapping(value = "/main/join")
    public String join() {
		return "member/join";
    }

    // 메인페이지 -> 레시피페이지 이동
    @RequestMapping(value = "/main/recipe")
    public String recipe() {
		return "recipe/list";
    }
    
    // 메인페이지 -> 홈트페이지 이동
    @RequestMapping(value = "/main/exercise")
    public String exercise() {
		return "exercise/list";
    }
    
    // 메인페이지 -> 미디어페이지 이동
    @RequestMapping(value = "/main/media")
    public String media() {
		return "media/list";
    }
    
    // 메인페이지 -> 커뮤니티페이지 이동
    @RequestMapping(value = "/main/community")
    public String community() {
		return "community/list";
    }
}